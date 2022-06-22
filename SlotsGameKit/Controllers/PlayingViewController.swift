//
//  PlayingViewController.swift
//  SlotsGameKit
//
//  Created by Evhenii Mahlena on 21.06.2022.
//

import UIKit
import SnapKit

class PlayingViewController: ParentViewController {

    
    fileprivate let spacingStackView: CGFloat = 30
    
    
        // MARK: -  slots stacks
    lazy var StackView01: UIStackView = {
        var top = UIStackView(arrangedSubviews: makePackImages(name: gameName!))
        top.axis = .vertical
        top.distribution = .fillEqually
        
        top.spacing = spacingStackView
        return top
    }()
    
    lazy var StackView02: UIStackView = {
        var top = UIStackView(arrangedSubviews: makePackImages(name: gameName!))
        top.axis = .vertical
        top.distribution = .fillEqually
        
        top.spacing = spacingStackView
        return top
    }()
    
    lazy var StackView03: UIStackView = {
        var top = UIStackView(arrangedSubviews: makePackImages(name: gameName!))
        top.axis = .vertical
        top.distribution = .fillEqually
        
        top.spacing = spacingStackView
        return top
    }()
    
    lazy var StackView04: UIStackView = {
        var top = UIStackView(arrangedSubviews: makePackImages(name: gameName!))
        top.axis = .vertical
        top.distribution = .fillEqually
        
        top.spacing = spacingStackView
        return top
    }()
    
    lazy var StackView05: UIStackView = {
        var top = UIStackView(arrangedSubviews: makePackImages(name: gameName!))
        top.axis = .vertical
        top.distribution = .fillEqually
        
        top.spacing = spacingStackView
        return top
    }()
    
    lazy var mainStackView: UIStackView = {
        var top = UIStackView()
        top.axis = .horizontal
        top.distribution = .fillEqually
        top.spacing = spacingStackView
        top.addArrangedSubview(StackView01)
        top.addArrangedSubview(StackView02)
        top.addArrangedSubview(StackView03)
        top.addArrangedSubview(StackView04)
        top.addArrangedSubview(StackView05)
        return top
    }()
    
    let winMoneyLabel: UILabel = {
        var label = UILabel()
        label.text = "WIN +500"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .white
        return label
    }()

    let rightMenu: RightMenu = {
        var menu = RightMenu()
        return menu
    }()

    
    var gameName: String!
    
    init(gameName: String?) {
        self.gameName = gameName
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()

        view.backgroundColor = .cyan
        addSubviews()
        
    }

    
    func addSubviews() {
        view.addSubview(mainStackView)
        view.addSubview(winMoneyLabel)
        view.addSubview(rightMenu)
        activateConstraints()
    }
    
    func makePackImages(name: String) -> [UIImageView] { //name: String! = "first"
        var images = [UIImageView]()
        for  _ in 0...2 {
            let view = UIImageView()
            let randomNubmer = Int.random(in: 1...9)
            view.image = UIImage(named: "\(name)_\(randomNubmer)@4x")?.withRenderingMode(.alwaysOriginal)
            images.append(view)
        }
        return images
    }



    
    fileprivate func setupView() {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "efU5dyHvuHCfGY7kCXnZry 1")
        view.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(view)
            make.top.bottom.equalTo(view)
        }
    }
        // MARK: - Actions
    @objc func spinAndAssignImages() {
         
     }
    
    fileprivate func activateConstraints() {
        mainStackView.snp.makeConstraints { make in
            make.top.equalTo(view).offset(60)
            make.leading.equalTo(view).offset(103)
            make.trailing.equalTo(rightMenu.snp.leading).offset(-45)
        }
        winMoneyLabel.snp.makeConstraints { make in
            make.top.equalTo(mainStackView.snp.bottom).offset(15)
            make.centerX.equalTo(mainStackView)
        }
        rightMenu.snp.makeConstraints { make in
            make.top.equalTo(view)
            make.trailing.equalTo(view)
            make.bottom.equalTo(view)
            make.leading.equalTo(mainStackView.snp.trailing).offset(45)
        }
    }
    
    
    
// MARK: - rotate

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscapeLeft
    }

    override var shouldAutorotate: Bool {
        return true
    }

    fileprivate func configureViewRotation() {
        let value = UIInterfaceOrientation.landscapeLeft.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")

    }
}
