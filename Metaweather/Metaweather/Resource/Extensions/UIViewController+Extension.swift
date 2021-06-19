//
//  UIViewController+Extension.swift
//  Metaweather
//
//  Created by Bassuni on 18/06/2021.
//

import Foundation
import UIKit
import SVProgressHUD

extension UIViewController {
    
    static func instantiate<T>(storyboard : String) -> T {
        let storyBoard = UIStoryboard(name: storyboard, bundle: .main)
        let controller = storyBoard.instantiateViewController(identifier: "\(T.self)") as! T
        return controller
    }
    
    func alert(title : String, message : String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func showLoader(){
        SVProgressHUD.show(withStatus: "")
    }
    
    func hideLoader(){
        SVProgressHUD.dismiss()
    }
}
