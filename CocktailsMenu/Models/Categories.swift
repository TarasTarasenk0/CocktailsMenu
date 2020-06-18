//
//  Categories.swift
//  CocktailsMenu
//
//  Created by md760 on 18.06.2020.
//  Copyright © 2020 md760. All rights reserved.
//

import Foundation

struct Categories: Codable {
    let categories: [Category]
    
    enum CodingKeys: String, CodingKey {
      case categories = "drinks"
    }
}

struct Category: Codable {
    let strCategory: String
}
