//
//  CustomTableViewCell.swift
//  Task3
//
//  Created by verareddy on 25/09/17.
//  Copyright © 2017 verareddy. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var lantitudeLabel: UILabel!
    @IBOutlet weak var latitudeLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
