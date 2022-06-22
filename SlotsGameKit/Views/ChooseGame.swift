//
//  ChooseGame.swift
//  SlotsGameKit
//
//  Created by Evhenii Mahlena on 22.06.2022.
//

import UIKit
import SnapKit


class ChooseGame: UIView {

    fileprivate var viewsHidden = false
    
    let containerView: UIView =  {
        var view = UIView()
        return view
    }()
    
    lazy var popularButton: ButtonSeparator = {
        var button = ButtonSeparator()
        
        button.setTitle("Popular", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        button.tag = 0
        button.separatorView.isHidden = false
        
        button.addTarget(self, action: #selector(isButtonTapped(_:)), for: .touchUpInside)
        button.addTarget(self, action: #selector(changeViews(_:)), for: .touchUpInside)

        return button
    }()
    
    lazy var allgamesButton: ButtonSeparator = {
        var button = ButtonSeparator()
        button.setTitle("All Games", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        button.tag = 1
        button.setTitleColor(UIColor(named: "unselectedButtonColor"), for: .normal)
        
        button.addTarget(self, action: #selector(isButtonTapped(_:)), for: .touchUpInside)
        button.addTarget(self, action: #selector(changeViews(_:)), for: .touchUpInside)

        return button
    }()
    
    
    lazy var populate: PopulateGameView = {
        var populate = PopulateGameView()
        populate.isHidden = false
        return populate
    }()
    
    lazy var allGames: AllGamesView = {
        var allGames = AllGamesView()
        allGames.isHidden = true

        return allGames
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    
    fileprivate func setupView() {
        self.backgroundColor = UIColor(named: "secondBackground")!
        self.layer.cornerRadius = 32
        
        addSubviews()
    }
    // MARK: -  add subviews
    fileprivate func addSubviews() {
        addSubview(popularButton)
        addSubview(allgamesButton)
        addSubview(populate)
        addSubview(allGames)
        activateConstraints()
    }
    // MARK: - Action
    @objc fileprivate  func isButtonTapped(_ sender: UIButton) {
        if sender == popularButton || sender == allgamesButton {
            if sender.tag == 0 {
                popularButton.separatorView.isHidden = false
                popularButton.setTitleColor(UIColor.white, for: .normal)
                
                allgamesButton.separatorView.isHidden = true
                allgamesButton.setTitleColor(UIColor(named: "unselectedButtonColor"), for: .normal)

            } else if sender.tag == 1 {
                popularButton.separatorView.isHidden = true
                popularButton.setTitleColor(UIColor(named: "unselectedButtonColor"), for: .normal)


                allgamesButton.separatorView.isHidden = false
                allgamesButton.setTitleColor(UIColor.white, for: .normal)

            }
        }
    }
    @objc fileprivate func changeViews(_ sender: UIButton) {
        if sender.tag == 0 {
            populate.isHidden = false
            allGames.isHidden = true
        } else {
            populate.isHidden = true
            allGames.isHidden = false

        }
        
    }
    
    // MARK: - constraints
    fileprivate func activateConstraints() {
        popularButton.snp.makeConstraints { make in
            make.top.equalTo(self).offset(29)
            make.leading.equalTo(81)
            make.size.equalTo(CGSize(width: 80, height: 24))
        }
        allgamesButton.snp.makeConstraints { make in
            make.top.equalTo(self).offset(29)
            make.trailing.equalTo(-81)
            make.size.equalTo(CGSize(width: 100, height: 24))
        }
        
        populate.snp.makeConstraints { make in
            make.top.equalTo(popularButton.snp.bottom).offset(42)
            make.leading.trailing.equalTo(self)
            make.bottom.equalTo(self)
        }
        allGames.snp.makeConstraints { make in
            make.top.equalTo(allgamesButton.snp.bottom).offset(42)
            make.leading.trailing.equalTo(self)
            make.bottom.equalTo(self)

        }
        
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


class ButtonSeparator: UIButton {
    
    var separatorView: UIView = {
        var view = UIView()
        view.backgroundColor = UIColor(named: "separatorView")
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(separatorView)
        
        separatorView.snp.makeConstraints { make in
            make.bottom.equalTo(self).offset(6)
            make.centerX.equalTo(self)
            make.size.equalTo(CGSize(width: 60, height: 6))
        }
        separatorView.isHidden = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
