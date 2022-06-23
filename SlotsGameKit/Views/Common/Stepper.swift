//
//  Stepper.swift
//  SlotsGameKit
//
//  Created by Evhenii Mahlena on 21.06.2022.
//

import UIKit
import SnapKit

class Stepper: UIView {

    let minusButton: UIButton = {
        var button = UIButton()
        var config = UIButton.Configuration.plain()
        config.image = UIImage(systemName: "minus")?.withRenderingMode(.alwaysOriginal).withTintColor(.white)
        button.configuration = config
        button.backgroundColor = UIColor(named: "stepperBackground")
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.red.cgColor
        return button
    }()
    
    let plusButton: UIButton = {
        var button = UIButton()
        var config = UIButton.Configuration.plain()
        config.image = UIImage(systemName: "plus")?.withRenderingMode(.alwaysOriginal).withTintColor(.white)
        button.configuration = config
        button.backgroundColor = UIColor(named: "stepperBackground")
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.red.cgColor
        return button
    }()
    
    lazy var betweenTitle: UILabel = {
        var label = UILabel()
        label.text = "100"
        label.textAlignment = .center
        label.textColor = .white
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.backgroundColor = UIColor(named: "stepperBackground")
        label.layer.cornerRadius = 8
        label.clipsToBounds = true
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.red.cgColor
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubview(minusButton)
        addSubview(betweenTitle)
        addSubview(plusButton)
        
        minusButton.snp.makeConstraints { make in
            make.top.equalTo(self)
            make.trailing.equalTo(betweenTitle.snp.leading).offset(-16)
            make.size.equalTo(CGSize(width: 33, height: 33))
        }
        betweenTitle.snp.makeConstraints { make in
            make.centerY.equalTo(self)
            make.top.equalTo(self)
            make.centerX.equalTo(self)
            make.size.equalTo(CGSize(width: 50, height: 33))

        }
        plusButton.snp.makeConstraints { make in
            make.centerY.equalTo(betweenTitle)
            make.top.equalTo(self)
            make.leading.equalTo(betweenTitle.snp.trailing).offset(16)
            make.size.equalTo(CGSize(width: 33, height: 33))

        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
