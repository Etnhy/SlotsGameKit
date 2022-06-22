//
//  ParentViewController.swift
//  SlotsGameKit
//
//  Created by Evhenii Mahlena on 22.06.2022.
//

import UIKit

class ParentViewController: UIViewController {

    let userDefaults = UserDefaults.standard

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavBar()
    }
    
    fileprivate func setupNavBar() {
        navigationController?.navigationBar.backgroundColor = .clear
        setBackButton()
        
        
    }
    fileprivate func setBackButton() {
        let backButtonItem = UIImage(named: "btn_back")?.withRenderingMode(.alwaysOriginal)
        self.navigationController?.navigationBar.backIndicatorImage = backButtonItem
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = backButtonItem
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }

}
