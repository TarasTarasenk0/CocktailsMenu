//
//  FiltersCell.swift
//  CocktailsMenu
//
//  Created by md760 on 19.06.2020.
//  Copyright © 2020 md760. All rights reserved.
//

import UIKit

final class FiltersCell: UITableViewCell {
    
    //MARK: - IBOutlets
    @IBOutlet weak var filterTitle: UILabel!
    @IBOutlet weak var doneButton: UIButton!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        filterTitle.text = nil
    }
}
