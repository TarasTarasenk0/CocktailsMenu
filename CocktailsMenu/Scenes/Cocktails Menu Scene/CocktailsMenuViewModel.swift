//
//  CocktailsMenuViewModel.swift
//  CocktailsMenu
//
//  Created by md760 on 18.06.2020.
//  Copyright © 2020 md760. All rights reserved.
//

import Foundation

final class CocktailsMenuViewModel {
    
    enum DataError: String, Error, LocalizedError {
        case error  = "Error"
        case emptyCategories
        case emptyDrinks
        var localizedDescription: String { return rawValue }
    }
    
    struct DataSource {
        let category: String
        var drinks: [Drink]
    }
    
    //MARK: - Properties
    var reloadingTableView: ((DataError?) -> Void)?
    var page = 0
    var dataSource: [DataSource] = []
    var categories: [String] = []
    
    private func removeData() {
        dataSource.removeAll()
        page = 0
    }
    
    func getData() {
        getCategories() { error in
            if let error = error {
                self.reloadingTableView?(error)
                return
            }
            self.getDrinksBy(categoryPage: self.page) { error in
                if let error = error {
                    self.reloadingTableView?(error)
                    return
                }
                self.reloadingTableView?(nil)
            }
        }
    }
    
    private func getCategories(completion: @escaping (DataError?) -> Void) {
        APIService.getCategories { [weak self] result in
            guard let self = self else { return }
            if let categoriesArray = result?.categories {
                self.categories = categoriesArray.map { $0.strCategory }
                for category in categoriesArray {
                    let content = DataSource(category: category.strCategory, drinks: [])
                    self.dataSource.append(content)
                }
                self.sortDataSource()
                completion(nil)
            } else {
                completion(.emptyCategories)
            }
        }
    }

    func getDrinksBy(categoryPage: Int, completion: @escaping (DataError?) -> Void) {
        APIService.getCocktailBy(category: dataSource[categoryPage].category) { result in
            if let drinks = result?.drinks {
                self.dataSource[categoryPage].drinks = drinks
                if self.page + 1 < self.dataSource.count {
                    self.page += 1
                }
                completion(nil)
            } else {
                completion(.emptyDrinks)
            }
        }
    }
    
    func getDrinksBy(categories: [String]) {
        removeData()
        let group = DispatchGroup()
        for category in categories {
            group.enter()
            APIService.getCocktailBy(category: category) { drinks in
                let dataSource = DataSource(category: category, drinks: drinks?.drinks ?? [])
                self.dataSource.append(dataSource)
                group.leave()
            }
        }
        group.notify(queue: .main) {
            self.sortDataSource()
            self.reloadingTableView?(nil)
        }
    }
    
    func sortDataSource() {
        dataSource = dataSource.sorted { $0.category < $1.category }
    }
}
