//
//  ChooseGame.swift
//  SlotsGameKit
//
//  Created by Evhenii Mahlena on 22.06.2022.
//

import UIKit
import SnapKit


class ChooseGame: UIView {

    
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
        return button
    }()
    
    lazy var allgamesButton: ButtonSeparator = {
        var button = ButtonSeparator()
        button.setTitle("All Games", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        button.tag = 1
        button.addTarget(self, action: #selector(isButtonTapped(_:)), for: .touchUpInside)
        button.setTitleColor(UIColor.white.withAlphaComponent(0.4), for: .normal)
        return button
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
        activateConstraints()
    }
    // MARK: - Action
    @objc fileprivate  func isButtonTapped(_ sender: UIButton) {
        if sender == popularButton || sender == allgamesButton {
            if sender.tag == 0 {
                popularButton.separatorView.isHidden = false
                popularButton.setTitleColor(UIColor.white, for: .normal)
                
                allgamesButton.separatorView.isHidden = true
                allgamesButton.setTitleColor(UIColor.white.withAlphaComponent(0.4), for: .normal)

            } else if sender.tag == 1 {
                popularButton.separatorView.isHidden = true
                popularButton.setTitleColor(UIColor.white.withAlphaComponent(0.4), for: .normal)


                allgamesButton.separatorView.isHidden = false
                allgamesButton.setTitleColor(UIColor.white, for: .normal)

            }
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
