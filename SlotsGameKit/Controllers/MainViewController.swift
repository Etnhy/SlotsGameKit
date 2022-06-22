//
//  ViewController.swift
//  SlotsGameKit
//
//  Created by Evhenii Mahlena on 21.06.2022.
//

import UIKit
import SnapKit


class MainViewController: ParentViewController {
    
    
    let topView: MainMenuHUD = {
        var hud = MainMenuHUD()
        return hud
    }()
    
    lazy var chooseGameView: ChooseGame = {
        var game = ChooseGame()
        //        game.popularButton.addTarget(self, action: #selector(selectGamesButton(_:)), for: .touchUpInside)
        //
        //        game.allgamesButton.addTarget(self, action: #selector(selectGamesButton(_:)), for: .touchUpInside)
        
        // populate games target
        game.populate.containerImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(goToFirstGame(_:))))
        
        //all games targets
        game.allGames.firstGame.containerImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(goToFirstGame(_:))))
        game.allGames.secondGameContainer.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(goToSecondGame(_:))))
        game.allGames.thirdGameContainer.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(goToThirdGame(_:))))
        
        return game
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        navigationController?.navigationBar.isHidden = true
        
        setupView()
    }
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        self.topView.moneyCount.text = "\(money)"
//
//    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.topView.moneyCount.text = "\(userDefaults.object(forKey: "money_count") ?? 1000)"
    }
    
    
    
    fileprivate func setupView() {
        
        view.backgroundColor = UIColor(named: "background")!
//        self.topView.moneyCount.text = "\(money)"
        addSubviews()
    }
    
    
    
    fileprivate func addSubviews() {
        view.addSubview(topView)
        view.addSubview(chooseGameView)
        
        
        activateConstraints()
    }
    
    // MARK: - Actions
    //    @objc fileprivate func goToPlay() {
    //
    //    }
    //
    //    @objc fileprivate func selectGamesButton(_ sender: UIButton) {
    //        print(sender.tag)
    //    }
    
    @objc func goToFirstGame(_ sender: UITapGestureRecognizer) {
        print("first game")
        let firstGameVC = PlayingViewController(gameName: "first")
        navigationController?.pushViewController(firstGameVC, animated: true)
    }
    @objc func goToSecondGame(_ sender: UITapGestureRecognizer) {
        print("second game")
        let firstGameVC = PlayingViewController(gameName: "second")
        navigationController?.pushViewController(firstGameVC, animated: true)
        
    }
    
    @objc func goToThirdGame(_ sender: UITapGestureRecognizer) {
        print("third game")
        let firstGameVC = PlayingViewController(gameName: "third")
        navigationController?.pushViewController(firstGameVC, animated: true)
        
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
    // MARK: - rotate
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    fileprivate func configureViewRotation() {
        let value = UIInterfaceOrientation.portrait.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        
    }
}

