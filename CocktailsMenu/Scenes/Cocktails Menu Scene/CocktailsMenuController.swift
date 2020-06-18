//
//  ViewController.swift
//  CocktailsMenu
//
//  Created by md760 on 18.06.2020.
//  Copyright © 2020 md760. All rights reserved.
//

import UIKit

final class CocktailsMenuController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var cocktailsTableView: UITableView!
    @IBOutlet weak var navigationHeaderView: NavigationHeaderView!
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    //MARK: - SetupUI
    private func setupUI() {
        navigationHeaderView.filterButton.isHidden = false
        navigationHeaderView.delegate = self
        cocktailsTableView.register(CocktailsCell.self, forCellReuseIdentifier: CocktailsCell.identifier)
    }

}

//MARK: - NavigationHeaderViewProtocol
extension CocktailsMenuController: NavigationHeaderViewProtocol {
    func leftButtonAction(_ sender: UIButton) {
        print(#function)
    }
    
    func rightButtonAction(_ sender: UIButton) {
        print(#function)
    }
}
