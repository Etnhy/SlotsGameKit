//
//  PlayingViewController.swift
//  SlotsGameKit
//
//  Created by Evhenii Mahlena on 21.06.2022.
//

import UIKit
import SnapKit

class PlayingViewController: ParentViewController {

    var gameName: String!

    fileprivate let spacingStackView: CGFloat = 30
    fileprivate let imagesNames: Int = 9
    

    
    lazy var images01: [UIImageView] = {
     var images = [UIImageView]()
        for i in 1...5 {
            var img = UIImageView()
            let num = Int.random(in: 1...imagesNames)
            img.image = UIImage(named: "\(gameName!)_\(num)@4x")
            images.append(img)
        }
        
       return images
    }()
    lazy var images02: [UIImageView] = {
     var images = [UIImageView]()
        for i in 1...5 {
            var img = UIImageView()
            let num = Int.random(in: 1...imagesNames)
            img.image = UIImage(named: "\(gameName!)_\(num)@4x")
            images.append(img)
        }
        
       return images
    }()
    
    lazy var images03: [UIImageView] = {
     var images = [UIImageView]()
        for i in 1...5 {
            var img = UIImageView()
            let num = Int.random(in: 1...imagesNames)
            img.image = UIImage(named: "\(gameName!)_\(num)@4x")
            images.append(img)
        }
        
       return images
    }()
    
        // MARK: -  slots stacks
    lazy var StackView01: UIStackView = {
        var top = UIStackView(arrangedSubviews: images01) //makePackImages(name: gameName!)
        top.axis = .horizontal
        top.distribution = .fillEqually
        
        top.spacing = spacingStackView
        return top
    }()
    
    lazy var StackView02: UIStackView = {
        var top = UIStackView(arrangedSubviews: images02)
        top.axis = .horizontal
        top.distribution = .fillEqually
        
        top.spacing = spacingStackView
        return top
    }()
    
    lazy var StackView03: UIStackView = {
        var top = UIStackView(arrangedSubviews: images03)
        top.axis = .horizontal
        top.distribution = .fillEqually
        
        top.spacing = spacingStackView
        return top
    }()
    
    lazy var mainStackView: UIStackView = {
        var top = UIStackView()
        top.axis = .vertical
        top.distribution = .fillEqually
        top.spacing = spacingStackView
        top.addArrangedSubview(StackView01)
        top.addArrangedSubview(StackView02)
        top.addArrangedSubview(StackView03)
        return top
    }()
    
    let winMoneyLabel: UILabel = {
        var label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .white
        return label
    }()

    lazy var rightMenu: RightMenu = {
        var menu = RightMenu()
        menu.spinButton.addTarget(self, action: #selector(spinAndAssignImages), for: .touchUpInside)
        return menu
    }()

    
    
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
//        spinner()
        
    }

    
    func addSubviews() {
        view.addSubview(mainStackView)
        view.addSubview(winMoneyLabel)
        view.addSubview(rightMenu)
        rightMenu.moneyLabel.text = "\(money)"
        activateConstraints()
        
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
        var firstSlots: [Int] = []
        var secondSlots: [Int] = []
        var thirdSlots: [Int] = []

        self.money -= 100
        rightMenu.moneyLabel.text = "\(money)"
        
        for i in images01 {
            let number = Int.random(in: 1...9)
            i.image = UIImage(named: "\(gameName!)_\(number)@4x")
            let duration = Double.random(in: 0.2...0.4 )
            UIView.transition(with: i, duration: duration , options: .transitionFlipFromTop, animations: nil, completion: nil)
            firstSlots.append(number)
        }
        
        
        for i in images02 {
            let number = Int.random(in: 1...9)
            i.image = UIImage(named: "\(gameName!)_\(number)@4x")
            let duration = Double.random(in: 0.2...0.4 )
            UIView.transition(with: i, duration: duration , options: .transitionFlipFromTop, animations: nil, completion: nil)
            secondSlots.append(number)
        }
        
        for i in images03 {
            let number = Int.random(in: 1...9)
            i.image = UIImage(named: "\(gameName!)_\(number)@4x")
            let duration = Double.random(in: 0.2...0.4 )
            UIView.transition(with: i, duration: duration , options: .transitionFlipFromTop, animations: nil, completion: nil)
            thirdSlots.append(number)
        }
        
        searchWin(slots: firstSlots)
        searchWin(slots: secondSlots)
        searchWin(slots: thirdSlots)
    }
    
    func searchWin(slots: [Int]) {
        if slots[0] == slots[1] && slots[1] == slots[2] && slots[2] == slots[3] && slots[3] == slots[4] {
            print("da dadb")
            self.money += 1000
            self.winMoneyLabel.text = "WIN +1000"
            self.rightMenu.moneyLabel.text = "\(money)"

            
        } else if slots[0] == slots[1] && slots[1] == slots[2] && slots[2] == slots[3] {
            self.money += 700
            self.winMoneyLabel.text = "WIN +700"
            self.rightMenu.moneyLabel.text = "\(money)"


        } else if slots[0] == slots[1] && slots[1] == slots[2] {
            self.money += 500
            self.winMoneyLabel.text = "WIN +500"
            self.rightMenu.moneyLabel.text = "\(money)"


        } else if slots[0] == slots[1] && slots[1] == slots[2] {
            self.money += 300
            self.winMoneyLabel.text = "WIN +300"
            self.rightMenu.moneyLabel.text = "\(money)"


        } else if slots[0] == slots[1]  {
            self.money += 200
            self.winMoneyLabel.text = "WIN +200"
            self.rightMenu.moneyLabel.text = "\(money)"

        }
    }
    
    fileprivate func makeLabels(_ money: Int) {
        
    }
    fileprivate func spinner() {
        for i in images01 {
            let number = Int.random(in: 1...9)
            i.image = UIImage(named: "\(gameName!)_\(number)@4x")
            let duration = Double.random(in: 0.2...0.4 )
            UIView.transition(with: i, duration: duration , options: .transitionFlipFromTop, animations: nil, completion: nil)
        }
        for i in images02 {
            let number = Int.random(in: 1...9)
            i.image = UIImage(named: "\(gameName!)_\(number)@4x")
            let duration = Double.random(in: 0.2...0.4 )
            UIView.transition(with: i, duration: duration , options: .transitionFlipFromTop, animations: nil, completion: nil)
        }
        for i in images03 {
            let number = Int.random(in: 1...9)
            i.image = UIImage(named: "\(gameName!)_\(number)@4x")
            let duration = Double.random(in: 0.2...0.4 )
            UIView.transition(with: i, duration: duration , options: .transitionFlipFromTop, animations: nil, completion: nil)
        }
    }

    
    // MARK: - constraints
    fileprivate func activateConstraints() {
        mainStackView.snp.makeConstraints { make in
            make.top.equalTo(view).offset(60)
            make.leading.equalTo(view).offset(103)
            make.trailing.equalTo(rightMenu.snp.leading).offset(-45)
            make.height.equalTo(300)
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
    
    func assignImages(number:Int, image:UIImageView) {
        switch number {
        case 1:
            image.image = UIImage(named: "\(gameName!)_\(number)@4x")
        case 2:
            image.image = UIImage(named: "\(gameName!)_\(number)@4x")
        case 3:
            image.image = UIImage(named: "\(gameName!)_\(number)@4x")
        case 4:
            image.image = UIImage(named: "\(gameName!)_\(number)@4x")
        case 5:
            image.image = UIImage(named: "\(gameName!)_\(number)@4x")
        case 6:
            image.image = UIImage(named: "\(gameName!)_\(number)@4x")
        case 7:
            image.image = UIImage(named: "\(gameName!)_\(number)@4x")
        case 8:
            image.image = UIImage(named: "\(gameName!)_\(number)@4x")
        case 9:
            image.image = UIImage(named: "\(gameName!)_\(number)@4x")
        default:
            print("error")
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
