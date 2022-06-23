//
//  MainMenuHUD.swift
//  SlotsGameKit
//
//  Created by Evhenii Mahlena on 22.06.2022.
//

import UIKit
import SnapKit
import Combine

class MainMenuHUD: UIView {
    
    
    fileprivate var profileImage: UIImageView = {
        var profile = UIImageView()
        profile.image = UIImage(named: "Ellipse 16")
        return profile
    }()
    
    fileprivate var chestImage: UIImageView = {
        var img = UIImageView()
        img.image = UIImage(named: "chest")
        
        return img
    }()
    
    fileprivate var moneyView: UIView = {
       var view = UIView()
        view.backgroundColor = UIColor(named: "mainMoneyBack")
        view.layer.cornerRadius = 3
        return view
    }()
    
    lazy var moneyCount: UILabel = {
       var label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    
    
    fileprivate func setupView() {
        self.backgroundColor = .clear
        addSubviews()
    }
    
    
    
    fileprivate func addSubviews() {
        addSubview(profileImage)
        addSubview(moneyView)
        moneyView.addSubview(moneyCount)
        addSubview(chestImage)

        activareConstraints()
    }
    
    
    // MARK: -  activate constraints
    fileprivate func activareConstraints() {
        
        self.snp.makeConstraints { make in
            make.width.equalTo(self)
            make.height.equalTo(123)
        }
        
        profileImage.snp.makeConstraints { make in
            make.top.equalTo(self).offset(46)
            make.leading.equalTo(self).offset(34)
            make.size.equalTo(CGSize(width: 45, height: 45))
        }
        moneyView.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 131, height: 26))
            make.centerY.equalTo(profileImage)
            make.trailing.equalTo(self).offset(-34)
        }
        moneyCount.snp.makeConstraints { make in
            make.centerY.equalTo(moneyView)
            make.trailing.equalTo(moneyView).offset(-24)
            make.leading.equalTo(moneyView).offset(40)
            make.size.equalTo(CGSize(width: 67, height: 21))
        }
        chestImage.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 54, height: 45))
//            make.top.equalTo(self).offset(46)
            make.centerY.equalTo(moneyCount)
            make.trailing.equalTo(moneyCount.snp.leading).offset(-12)
        }
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
