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
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var navigationHeaderView: NavigationHeaderView!
    
    //MARK: - Properties
    var categories = [String]()
    var filters = [String]()
    var applyFiltersCallBack: (([String]) -> Void)?
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        tableView.register(UINib(nibName: FiltersCell.identifier, bundle: nil), forCellReuseIdentifier: FiltersCell.identifier)
        navigationHeaderView.delegate = self
        navigationHeaderView.headerTitle.text = ConstName.filtersTitle
        navigationHeaderView.backButton.isHidden = false
        sortCategories()
    }
    
    @IBAction private func applyFilters(_ sender: UIButton) {
        getFiltersAndBack()
    }
    
    private func getFiltersAndBack() {
        navigationController?.popViewController(animated: true)
        applyFiltersCallBack?(filters)
    }
    private func sortCategories() {
        categories = categories.sorted { $0 < $1 }
    }
}

//MARK: - NavigationHeaderViewProtocol
extension FiltersViewController: NavigationHeaderViewProtocol {
    func leftButtonAction(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    func rightButtonAction(_ sender: UIButton) {}
}
