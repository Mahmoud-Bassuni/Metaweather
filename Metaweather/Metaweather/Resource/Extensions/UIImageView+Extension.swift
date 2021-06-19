//
//  UIImageView+Extension.swift
//  Metaweather
//
//  Created by Bassuni on 19/06/2021.
//

import Foundation
import Kingfisher

extension UIImageView {
    func setImage(path: String) {
        if let url = URL(string: path) {
            self.kf.indicatorType = .activity
            self.kf.setImage(
                    with: url,
                    options: [
                        .scaleFactor(UIScreen.main.scale),
                        .transition(.fade(1)),
                        .cacheOriginalImage
                ])
            }
    }
}
