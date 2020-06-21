//
//  FiltersDelegate.swift
//  CocktailsMenu
//
//  Created by md760 on 19.06.2020.
//  Copyright © 2020 md760. All rights reserved.
//

import UIKit

//MARK: - UITableViewDelegate
extension FiltersViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! FiltersCell
        cell.doneButton.isHidden.toggle()
        let category = cell.filterTitle.text!
        if filters.contains(category) {
            if let index = filters.firstIndex(of: category) {
                filters.remove(at: index)
            }
        } else {
            filters.append(category)
        }
    }
}

//MARK: - UITableViewDataSource
extension FiltersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let filtersCell = tableView.dequeueReusableCell(withIdentifier: FiltersCell.identifier, for: indexPath) as! FiltersCell
        let category = categories[indexPath.row]
        filtersCell.filterTitle.text = category
        filtersCell.doneButton.isHidden = !filters.contains(category)
        return filtersCell
    }
}
