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
    var totalLoadedDrinks = 0 {
        didSet {  uploadingNextDrinks() }
    }
    var dataSource: [DataSource] = []
    
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
                self.page += 1
                self.dataSource[categoryPage].drinks = drinks
                self.totalLoadedDrinks += drinks.count
                completion(nil)
            } else {
                completion(.emptyDrinks)
            }
        }
    }
    
    func uploadingNextDrinks() {
        if totalLoadedDrinks < 10 {
            getDrinksBy(categoryPage: page) { error in
                if let error = error {
                    self.reloadingTableView?(error)
                    return
                }
                self.reloadingTableView?(nil)
            }
        }
    }
}
