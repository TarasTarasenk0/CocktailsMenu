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
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK: - IBActions
    @IBAction func doneButtonAction(_ sender: Any) {
    }
    
}
