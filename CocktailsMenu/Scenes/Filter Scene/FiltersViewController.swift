//
//  FiltersViewController.swift
//  CocktailsMenu
//
//  Created by md760 on 19.06.2020.
//  Copyright © 2020 md760. All rights reserved.
//

import UIKit

final class FiltersViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var navigationHeaderView: NavigationHeaderView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationHeaderView.backButton.isHidden = false
    }
}

//MARK: - NavigationHeaderViewProtocol
extension FiltersViewController: NavigationHeaderViewProtocol {
    func leftButtonAction(_ sender: UIButton) {
           let cocktailsMenuVC = CocktailsMenuController.instance()
           navigationController?.pushViewController(cocktailsMenuVC, animated: true)
    }
    
    func rightButtonAction(_ sender: UIButton) {
        print(#function)
    }
}
