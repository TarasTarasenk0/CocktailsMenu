//
//  CocktailsMenuDelegate.swift
//  CocktailsMenu
//
//  Created by md760 on 18.06.2020.
//  Copyright © 2020 md760. All rights reserved.
//

import UIKit
import ProgressHUD

//MARK: - UITableViewDelegate
extension CocktailsMenuController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let nextSectionIndex = indexPath.section + 1
        guard nextSectionIndex < viewModel.dataSource.count else { return }
        if indexPath.row == viewModel.dataSource[indexPath.section].drinks.count - 1 &&
            viewModel.dataSource[nextSectionIndex].drinks.isEmpty
        {
            ProgressHUD.show()
            viewModel.getDrinksBy(categoryPage: indexPath.section + 1) { error in
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    ProgressHUD.dismiss()
                }
            }
        }
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
        let cell = tableView.dequeueReusableCell(withIdentifier: CocktailsCell.identifier, for: indexPath) as! CocktailsCell
        let title = viewModel.dataSource[indexPath.section].drinks[indexPath.row].strDrink
        let image = viewModel.dataSource[indexPath.section].drinks[indexPath.row].strDrinkThumb
        cell.configure(title: title, image: image)
        return cell
    }
}
