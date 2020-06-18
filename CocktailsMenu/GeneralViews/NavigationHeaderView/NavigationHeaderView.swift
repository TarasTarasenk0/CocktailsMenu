//
//  NavigationHeaderView.swift
//  CocktailsMenu
//
//  Created by md760 on 18.06.2020.
//  Copyright © 2020 md760. All rights reserved.
//

import UIKit

protocol NavigationHeaderViewProtocol: class {
    func leftButtonAction(_ sender: UIButton)
    func rightButtonAction(_ sender: UIButton)
}

final class NavigationHeaderView: UIView {
    
    //MARK: - IBOutlets
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var filterButton: UIButton!
    
    //MARK: - Properties
    weak var delegate: NavigationHeaderViewProtocol?

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
        
    }
    
    func setupUI() {
        xibSetup()
        backButton.isHidden = true
        filterButton.isHidden = true
    }
    
    @IBAction func leftButtonAction(_ sender: UIButton) {
        delegate?.leftButtonAction(sender)
    }
    
    @IBAction func rightButtonAction(_ sender: UIButton) {
        delegate?.rightButtonAction(sender)
    }
}