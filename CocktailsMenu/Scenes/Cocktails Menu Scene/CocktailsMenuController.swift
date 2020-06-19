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
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        viewModel.reloadingTableView = { [weak self] error in
            if let error = error {
                //TODO: Alert
                print(error)
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
        tableView.register(UINib(nibName: CocktailsCell.identifier, bundle: nil), forCellReuseIdentifier: CocktailsCell.identifier)
    }

}

//MARK: - NavigationHeaderViewProtocol
extension CocktailsMenuController: NavigationHeaderViewProtocol {
    func leftButtonAction(_ sender: UIButton) {
        print(#function)
    }
    
    func rightButtonAction(_ sender: UIButton) {
        print(#function)
        let filterVC = FiltersViewController.instance(.filter)
        navigationController?.pushViewController(filterVC, animated: true)

    }
}
