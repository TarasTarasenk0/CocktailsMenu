//
//  CustomImageView.swift
//  CocktailsMenu
//
//  Created by md760 on 19.06.2020.
//  Copyright © 2020 md760. All rights reserved.
//

import UIKit
import SDWebImage

final class CustomUIImage: UIImageView {
    var setImageFromStringUrl: String? {
        didSet {
            if let urlString = setImageFromStringUrl, let url = URL(string: urlString) {
                sd_setImage(with: url, placeholderImage: UIImage(named: "placeholder"),
                            options: SDWebImageOptions()) { _,_,_,_ in
                }
            } else {
                self.image = UIImage(named: "placeholder")
            }
        }
    }
}
