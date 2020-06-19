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
        case error  = "Error" //TODO: - rename errors
        case emptyCategories
        case emptyDrinks
        var localizedDescription: String { return rawValue }
    }
    
    struct DataSource {
        let category: String
        var drinks: [Drink]
    }
    
    var reloadingTableView: ((DataError?) -> Void)?
    var page = 0
    var dataSource: [DataSource] = []
    var categories: [String] = []
    
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
        APIService.getCategories { [weak self] categories in
            guard let self = self else { return }
            if let categoriesArray = categories?.categories {
                self.categories = categoriesArray.map { $0.strCategory }
                for category in categoriesArray {
                    let content = DataSource(category: category.strCategory, drinks: [])
                    self.dataSource.append(content)
                }
                completion(nil)
            } else {
                completion(.emptyCategories)
            }
        }
    }
    
    
    
    private func getDrinksBy(categoryPage: Int, completion: @escaping (DataError?) -> Void) {
        APIService.getCocktailBy(category: dataSource[categoryPage].category) { drink in
            if let drinks = drink?.drinks {
                if self.dataSource.count <= categoryPage {
                    self.page += 1
                }
                self.dataSource[categoryPage].drinks = drinks
                completion(nil)
            } else {
                completion(.emptyDrinks)
            }
        }
    }
    
    func getDrinksBy(categories: [String]) {
        dataSource.removeAll()
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
            print(self.dataSource.count)
            self.reloadingTableView?(nil)
        }
    }
    
    func uploadingNextDrinks() {
        //guard self.page < 1 else { return }
        getDrinksBy(categoryPage: page) { error in
            if let error = error {
                self.reloadingTableView?(error)
                return
            }
            self.reloadingTableView?(nil)
        }
    }
}
