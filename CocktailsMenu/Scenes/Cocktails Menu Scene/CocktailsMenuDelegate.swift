//
//  CocktailsMenuDelegate.swift
//  CocktailsMenu
//
//  Created by md760 on 18.06.2020.
//  Copyright © 2020 md760. All rights reserved.
//

import UIKit

//MARK: - UITableViewDelegate
extension CocktailsMenuController: UITableViewDelegate {
    
}

//MARK: - UITableViewDataSource
extension CocktailsMenuController: UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Placeholder"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return 3
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cocktailsCell = tableView.dequeueReusableCell(withIdentifier: CocktailsCell.identifier, for: indexPath) as! CocktailsCell
        cocktailsCell.backgroundColor = .red
        return cocktailsCell
    }
    
    
}
