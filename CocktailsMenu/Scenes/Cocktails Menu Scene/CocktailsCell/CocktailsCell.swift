//
//  CocktailsCell.swift
//  CocktailsMenu
//
//  Created by md760 on 18.06.2020.
//  Copyright © 2020 md760. All rights reserved.
//

import UIKit
import SDWebImage

class CocktailsCell: UITableViewCell {
    
    //MARK: - IBOutlets
    @IBOutlet weak var cocktailImage: CustomUIImage!
    @IBOutlet weak var cocktailTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
