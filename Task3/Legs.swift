//
//  Legs.swift
//  Task3
//
//  Created by verareddy on 23/09/17.
//  Copyright © 2017 verareddy. All rights reserved.
//

import Foundation
import SwiftyJSON
struct Legs {
    var distance : Distance?
    var duration : Duration?
    var startLoaction : StartLocation?
    var endLocation : EndLocation?
    init(legsJson: JSON) {
        self.distance = Distance(distanceJson: legsJson["distance"])
        self.duration = Duration(distanceDurationJson: legsJson["duration"])
        self.startLoaction = StartLocation(startLoactionJson: legsJson["start_location"])
        self.endLocation = EndLocation(endLoactionJson: legsJson["end_location"])
    }
    
}
struct Distance {
    var value : String?
    var text  : String?
    init(distanceJson:JSON) {
        self.value = distanceJson["value"].stringValue
        self.text = distanceJson["text"].stringValue
    }
}
struct Duration {
    var value : String?
    var text : String?
    init(distanceDurationJson:JSON) {
        self.value = distanceDurationJson["value"].stringValue
        self.text = distanceDurationJson["text"].stringValue
    }
}
struct StartLocation {
    var lat : Int?
    var lng : Int?
    init(startLoactionJson:JSON) {
        self.lat = startLoactionJson["lat"].int
        self.lng = startLoactionJson["lng"].int
    }
}
struct EndLocation {
    var lat : Int?
    var lng : Int?
    init(endLoactionJson:JSON) {
        self.lat = endLoactionJson["lat"].int
        self.lng = endLoactionJson["lng"].int
    }
}
struct Steps {
    var stepsDistance : StepsDistance?
    var stepsDuration : StepsDuration?
    var stepsStartLocation : StepsStartLoaction?
    var stepsEndLocation : StepsEndLocation?
    init(stepsJson: JSON) {
        self.stepsDistance = StepsDistance(stepsDistanceJson: stepsJson["distance"])
        self.stepsDuration = StepsDuration(stepsDistanceDurationJson: stepsJson["duration"])
        self.stepsStartLocation = StepsStartLoaction(stepsStartLoactionJson: stepsJson["start_location"])
        self.stepsEndLocation = StepsEndLocation(stepsEndLoactionJson: stepsJson["end_location"])
    }
    
}
struct StepsDistance {
    var value : String?
    var text  : String?
    init(stepsDistanceJson:JSON) {
        self.value = stepsDistanceJson["value"].stringValue
        self.text = stepsDistanceJson["text"].stringValue
    }

}
struct StepsDuration {
    var value : String?
    var text : String?
    init(stepsDistanceDurationJson:JSON) {
        self.value = stepsDistanceDurationJson["value"].stringValue
        self.text = stepsDistanceDurationJson["text"].stringValue
    }

}
struct StepsStartLoaction {
    var lat : String?
    var lng : String?
    init(stepsStartLoactionJson:JSON) {
        self.lat = stepsStartLoactionJson["lat"].stringValue
        self.lng = stepsStartLoactionJson["lng"].stringValue
    }
}
struct StepsEndLocation {
    var lat : String?
    var lng : String?
    init(stepsEndLoactionJson:JSON) {
        self.lat = stepsEndLoactionJson["lat"].stringValue
        self.lng = stepsEndLoactionJson["lng"].stringValue
    }
}
