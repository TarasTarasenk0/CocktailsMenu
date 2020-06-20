//
//  UIViewController+Extensions.swift
//  CocktailsMenu
//
//  Created by md760 on 19.06.2020.
//  Copyright © 2020 md760. All rights reserved.
//

import UIKit

extension UIViewController {
    class func instance(_ storyboard: Storyboards = .main) -> Self {
        let storyboard = UIStoryboard(name: storyboard.rawValue, bundle: nil)
        let viewController = storyboard.instantiateViewController(self)
        return viewController
    }
    
    func showAlert(_ title: String, message: String? = nil, buttonTitle: String = "OK", completion: (() -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: buttonTitle, style: .default) { _ in
            completion?()
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    func checkInternet() {
        if !Reachability.isConnectedToNetwork() {
            self.showAlert(ConstName.internetTitle, message: ConstName.internetMessage)
        }
    }
}
