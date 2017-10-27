//
//  ViewController.swift
//  Task3
//
//  Created by verareddy on 23/09/17.
//  Copyright © 2017 verareddy. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
class ViewController: UIViewController {
   //Mark:- IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    //Mark:- Properties
    var legsData = [Legs]()
    var stepsData = [Steps]()
    
   //Mark:- View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        Alamofire.request("http://maps.google.com/maps/api/directions/json?origin=Chennai&destination=Madurai&sensor=false").responseJSON(completionHandler: { response in
            switch response.result{
            case .success(let data):
                print(data)
             let jsonData = JSON(data)
                print("ParsingJsonData : \(jsonData)")
                _ = jsonData["geocoded_waypoints"]
                print(jsonData["geocoded_waypoints"])
                print("JSONDATA:\(jsonData["geocoded_waypoints"][0]["types"][0])")
                let routes = jsonData["routes"]
                print("RoutesData:\(routes)")
                print("NorthEast.latitude :\(routes[0]["bounds"]["northeast"]["lat"])")
                print("SouthWest.latitude :\(routes[0]["bounds"]["southwest"]["lat"])")
                print("Routes Summery :\(routes[0]["summary"])")
                let legs = routes[0]["legs"]
                for i in 0..<legs.count{
                    let object = Legs(legsJson:legs[i])
                    self.legsData.append(object)
                }
                print("legs Data : \(legs)")
                print("legs Data Count : \(legs.count)")
                print("Routes Legs : \(routes[0]["legs"])")
                print("Roures Stpes : \(routes[0]["legs"][0]["steps"])")
                let steps = routes[0]["legs"][0]["steps"]
                print("steps data: \(steps)")

                for i in 0..<steps.count{
                    let object = Steps(stepsJson: steps[i])
                    self.stepsData.append(object)
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
                print("steps data count value: \(self.stepsData.count)")
                print("Roures Stpes Start Location : \(routes[0]["legs"][0]["steps"][0]["start_location"])")
                print("Roures Stpes Distance : \(routes[0]["legs"][0]["steps"][0]["distance"])")
                print("Roures Stpes Travel Mode : \(routes[0]["legs"][0]["steps"][0]["travel_mode"])")
                print("Roures Stpes Duration : \(routes[0]["legs"][0]["steps"][0]["duration"])")
                print("Roures Stpes polyline : \(routes[0]["legs"][0]["steps"][0]["polyline"])")
                print("Roures Stpes End Location: \(routes[0]["legs"][0]["steps"][0]["end_location"])")
            case .failure(let error):
                print("Erorr Could be:\(error)")
            }
            
        })
       
    }

  


}
//Mark:- Extension Of ViewController
extension ViewController : UITableViewDelegate,UITableViewDataSource{
    //Mark:- delegate method
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    //Mark:- datasource methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stepsData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cutsomCell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as!CustomTableViewCell
        if indexPath.row%2 == 0{
            cutsomCell.backgroundColor = UIColor.blue
        }else{
            cutsomCell.backgroundColor = UIColor.brown
        }
        switch indexPath.section {
        case 0:
            cutsomCell.lantitudeLabel.text = self.stepsData[indexPath.row].stepsStartLocation?.lat
            cutsomCell.latitudeLabel.text = self.stepsData[indexPath.row].stepsStartLocation?.lng
            return cutsomCell
        case 1:
            cutsomCell.lantitudeLabel.text = stepsData[indexPath.row].stepsEndLocation?.lat
            cutsomCell.latitudeLabel.text = stepsData[indexPath.row].stepsEndLocation?.lng
            return cutsomCell
        case 2:
            
            cutsomCell.lantitudeLabel.text = stepsData[indexPath.row].stepsDistance?.value
            cutsomCell.latitudeLabel.text = stepsData[indexPath.row].stepsDuration?.text
            return cutsomCell

        default:
            return cutsomCell
        }
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "StartLoaction"
        case 1:
            return "EndLoaction"
        case 2:
            return "Distance"
        default:
            return ""
        }
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let lab = UILabel()
        switch section {
        case 0:
            lab.textAlignment = .center
            lab.textColor = UIColor.black
            lab.adjustsFontSizeToFitWidth = true
            lab.text = "StartLoaction"
            lab.backgroundColor = UIColor.cyan

            return lab
        case 1:
            lab.textAlignment = .center
            lab.textColor = UIColor.black
            lab.adjustsFontSizeToFitWidth = true
            lab.text = "EndLoaction"
            lab.backgroundColor = UIColor.yellow
            return lab
        case 2:
            lab.textAlignment = .center
            lab.textColor = UIColor.black
            lab.adjustsFontSizeToFitWidth = true
            lab.text = "Distance"
            lab.backgroundColor = UIColor.red

            return lab
        default:
            return lab
        }
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
}

