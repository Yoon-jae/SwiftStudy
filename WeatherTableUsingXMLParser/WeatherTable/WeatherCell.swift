//
//  WeatherCell.swift
//  WeatherTable
//
//  Created by yoonjae Cho on 31/12/2016.
//  Copyright © 2016 yoonjae Cho. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {

    @IBOutlet var countryLabel: UILabel!
    @IBOutlet var weatherLabel: UILabel!
    @IBOutlet var temperatrueLabel: UILabel!
    @IBOutlet var imgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
