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
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var navigationHeaderView: NavigationHeaderView!
    
    //MARK: - Property
    let viewModel = CocktailsMenuViewModel()
    var checkedCategory = [String]()
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        checkInternet()
        viewModel.reloadingTableView = { [weak self] error in
            if let error = error {
                self?.showAlert(ConstName.errorMessage, message: error.errorDescription)
                return
            }
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        viewModel.getData()
    }
    
    //MARK: - SetupUI
    private func setupUI() {
        navigationHeaderView.filterButton.isHidden = false
        navigationHeaderView.delegate = self
        navigationHeaderView.headerTitle.text = "Drinks"
        tableView.register(UINib(nibName: CocktailsCell.identifier, bundle: nil), forCellReuseIdentifier: CocktailsCell.identifier)
    }
}

//MARK: - NavigationHeaderViewProtocol
extension CocktailsMenuController: NavigationHeaderViewProtocol {
    func leftButtonAction(_ sender: UIButton) {}
    
    func rightButtonAction(_ sender: UIButton) {
        let filterVC = FiltersViewController.instance(.filter)
        filterVC.categories = viewModel.categories
        filterVC.filters = checkedCategory
        filterVC.applyFiltersCallBack = { [weak self] categories in
            self?.checkedCategory = categories
            if categories.isEmpty {
                self?.viewModel.getData()
            } else {
                self?.viewModel.getDrinksBy(categories: categories)
            }
        }
        navigationController?.pushViewController(filterVC, animated: true)
    }
}


