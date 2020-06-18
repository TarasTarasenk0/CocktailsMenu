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
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//    if indexPath.s == photos.count - 1 && page <= 9 {
//        
//    }
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
        cocktailsCell.backgroundColor = .red
        return cocktailsCell
    }
}
