//
//  CocktailsCell.swift
//  CocktailsMenu
//
//  Created by md760 on 18.06.2020.
//  Copyright © 2020 md760. All rights reserved.
//

import UIKit

final class CocktailsCell: UITableViewCell {
    
    //MARK: - IBOutlets
    @IBOutlet private weak var cocktailImage: CustomUIImage!
    @IBOutlet private weak var cocktailTitle: UILabel!
    
    func configure(title: String?, image: String?) {
        self.cocktailTitle.text = title
        self.cocktailImage.setImageFromStringUrl = image
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        cocktailImage.image = nil
        cocktailTitle.text = nil
    }
    
}
