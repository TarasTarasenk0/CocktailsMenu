//
//  ViewController.swift
//  CocktailsMenu
//
//  Created by md760 on 18.06.2020.
//  Copyright © 2020 md760. All rights reserved.
//

import UIKit

final class CocktailsMenuController: UIViewController {

    @IBOutlet weak var navigationHeaderView: NavigationHeaderView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        navigationHeaderView.delegate = self
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
