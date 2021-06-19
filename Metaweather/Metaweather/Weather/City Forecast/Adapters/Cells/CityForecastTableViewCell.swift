//
//  CityForecastTableViewCell.swift
//  Metaweather
//
//  Created by Bassuni on 19/06/2021.
//

import UIKit

class CityForecastTableViewCell: UITableViewCell {

    @IBOutlet weak var iconeImageView: UIImageView!
    @IBOutlet weak var temprtureLable: UILabel!
    @IBOutlet weak var dateLable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
