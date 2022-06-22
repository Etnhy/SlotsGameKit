//
//  ViewController.swift
//  SlotsGameKit
//
//  Created by Evhenii Mahlena on 21.06.2022.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    

    let topView: MainMenuHUD = {
        var hud = MainMenuHUD()
        return hud
    }()
    
    let chooseGameView: ChooseGame = {
        var game = ChooseGame()
        
        return game
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    
    fileprivate func setupView() {
        view.backgroundColor = UIColor(named: "background")!
        
        addSubviews()
    }
    fileprivate func addSubviews() {
        view.addSubview(topView)
        view.addSubview(chooseGameView)
        
        activateConstraints()
    }
    
    // MARK: - Actions
    @objc fileprivate func goToPlay() {
        
    }
    // MARK: - activateConstraints()

    fileprivate func activateConstraints() {
        topView.snp.makeConstraints { make in
            make.top.equalTo(view)
            make.leading.trailing.equalTo(view)
        }
        chooseGameView.snp.makeConstraints { make in
            make.top.equalTo(topView.snp.bottom).offset(0)
            make.leading.trailing.equalTo(view)
            make.bottom.equalTo(view)
        }
    }

}

