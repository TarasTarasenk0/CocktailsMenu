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
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
//        if indexPath.row == viewModel.dataSource[indexPath.section].drinks.count - 1 && viewModel.page < 1 {
//            viewModel.uploadingNextDrinks()
//        }
    }
}
//MARK: - UITableViewDataSource
extension CocktailsMenuController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel.dataSource[section].category
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.dataSource[section].drinks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cocktailsCell = tableView.dequeueReusableCell(withIdentifier: CocktailsCell.identifier, for: indexPath) as! CocktailsCell
        cocktailsCell.cocktailTitle.text = viewModel.dataSource[indexPath.section].drinks[indexPath.row].strDrink
        cocktailsCell.cocktailImage.setImageFromStringUrl = viewModel.dataSource[indexPath.section].drinks[indexPath.row].strDrinkThumb
        return cocktailsCell
    }
}
