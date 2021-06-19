//
//  CityForecastTableViewCell.swift
//  Metaweather
//
//  Created by Bassuni on 19/06/2021.
//

import UIKit
import Kingfisher
class CityForecastTableViewCell: UITableViewCell {
    
    @IBOutlet weak var iconeImageView: UIImageView!
    @IBOutlet weak var temprtureLable: UILabel!
    @IBOutlet weak var dateLable: UILabel!
    @IBOutlet weak var forecastStatus: UILabel!
    @IBOutlet weak var containnerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    func setupUI() {
        containnerView.layer.borderColor = UIColor.gray.withAlphaComponent(0.5).cgColor
        containnerView.layer.borderWidth = 1
        containnerView.layer.cornerRadius = 10
    }
    
    func bindCell(model : CityForecastModel) {
        dateLable.text = model.applicableDate
        temprtureLable.text = model.theTemp
        forecastStatus.text = model.weatherStateName
        iconeImageView.setImage(path:model.imageURL)
    }
}
