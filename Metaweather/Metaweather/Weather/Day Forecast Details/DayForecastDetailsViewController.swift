//
//  DayForecastDetailsViewController.swift
//  Metaweather
//
//  Created by Bassuni on 19/06/2021.
//

import UIKit
import RxSwift
import RxCocoa
import Kingfisher

class DayForecastDetailsViewController: UIViewController {
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var forecastState: UILabel!
    @IBOutlet weak var maxTempLable: UILabel!
    @IBOutlet weak var minTempLable: UILabel!
    @IBOutlet weak var humidityLable: UILabel!
    @IBOutlet weak var visibilityLable: UILabel!
    @IBOutlet weak var pressureLable: UILabel!
    @IBOutlet weak var confidenceLable: UILabel!
    
    let disposeBag = DisposeBag()
    var viewModel: DayForecastDetailsViewModel!
    var dayName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = dayName
        bindViewModel()
    }

    func bindViewModel(){
        if let forecastInfoDetails = viewModel?.forecastInfoDetails {
            forecastState.text = forecastInfoDetails.weatherStateName
            iconImageView.setImage(path: forecastInfoDetails.imageURL)
            maxTempLable.text = forecastInfoDetails.maxTemp
            minTempLable.text = forecastInfoDetails.minTemp
            humidityLable.text = forecastInfoDetails.humidity
            visibilityLable.text = forecastInfoDetails.visibility
            pressureLable.text =  forecastInfoDetails.airPressure
            confidenceLable.text =  forecastInfoDetails.windDirectionCompass
        }
    }
}
