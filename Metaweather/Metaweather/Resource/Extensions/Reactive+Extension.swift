//
//  Reactive+Extension.swift
//  Metaweather
//
//  Created by Bassuni on 19/06/2021.
//


import RxSwift
import RxCocoa
import SVProgressHUD

extension Reactive where Base: UIViewController {
    var showLoader: Binder<Bool> {
        return Binder(self.base) { (viewController, showLoader) in
            if showLoader {
                SVProgressHUD.show(withStatus: "")
            } else {
                SVProgressHUD.dismiss()
            }
        }
    }
}
