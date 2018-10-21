//
//  CELL.swift
//  josnparsing
//
//  Created by mac on 26/09/18.
//  Copyright © 2018 jeky. All rights reserved.
//

import UIKit

class CELL: UITableViewCell {

    @IBOutlet var DestTime: UILabel!
    @IBOutlet var ArivalTime: UILabel!
    @IBOutlet var DetName: UILabel!
    @IBOutlet var SourceName: UILabel!
    @IBOutlet var TravelTime: UILabel!
    @IBOutlet var TrainNumber: UILabel!
    @IBOutlet var TrainName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
