//
//  APIServices.swift
//  CocktailsMenu
//
//  Created by md760 on 18.06.2020.
//  Copyright © 2020 md760. All rights reserved.
//

import Foundation

enum APIService {
    static func getCocktailBy(category: String, completion: @escaping ((_ model: Drinks?) -> Void)) {
        let link = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=" + category.replacingOccurrences(of: " ", with: "_")
        guard let url = URL(string: link) else {
            completion(nil)
            return }
        URLSession.shared.dataTask(with: URLRequest(url: url), completionHandler: { data, response, error in
            guard error == nil, let data = data else {
                completion(nil)
                return
            }
            let model = try? JSONDecoder().decode(Drinks.self, from: data)
            completion(model)
        }).resume()
    }
    
    static func getCategories(completion: @escaping (_ model: Categories?) -> Void) {
        let link = "https://www.thecocktaildb.com/api/json/v1/1/list.php?c=list"
        guard let url = URL(string: link) else {
            completion(nil)
            return }
        URLSession.shared.dataTask(with: URLRequest(url: url), completionHandler: { data, response, error in
            guard error == nil, let data = data else {
                completion(nil)
                return
            }
            let model = try? JSONDecoder().decode(Categories.self, from: data)
            completion(model)
        }).resume()
    }
}
