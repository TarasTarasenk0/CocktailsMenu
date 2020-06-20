//
//  UIView+Extension.swift
//  CocktailsMenu
//
//  Created by md760 on 18.06.2020.
//  Copyright © 2020 md760. All rights reserved.
//

import UIKit

extension UIView {

    func xibSetup() {
        let view = loadFromNib()
        view.translatesAutoresizingMaskIntoConstraints = false
        fill(with: view)
    }

    func loadFromNib<T: UIView>() -> T {
        let selfType = type(of: self)
        let bundle = Bundle(for: selfType)
        let nibName = String(describing: selfType)
        let nib = UINib(nibName: nibName, bundle: bundle)
        guard let view = nib.instantiate(withOwner: self, options: nil).first as? T else {
            fatalError("Error loading nib with name \(nibName)")
        }
        return view
    }

    func fill(with view: UIView, removeSubviews: Bool = true) {
        guard self != view else { fatalError("Attempt to insert view inside itself") }
        if removeSubviews {
            self.removeSubviews()
        }
        addSubview(view)
        let views = ["view": view]
        let hConstraintString = "H:|-0-[view]-0-|"
        let vConstraintString = "V:|-0-[view]-0-|"
        let constraints = [hConstraintString, vConstraintString].flatMap {
            NSLayoutConstraint.constraints(withVisualFormat: $0, metrics: nil, views: views)
        }
        NSLayoutConstraint.activate(constraints)
    }

    func removeSubviews() {
        subviews.forEach { $0.removeFromSuperview() }
    }
}
