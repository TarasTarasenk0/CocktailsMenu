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
}
