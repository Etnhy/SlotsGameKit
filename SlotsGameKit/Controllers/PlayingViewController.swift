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
    
    fileprivate var money: Int = 1000 {
        willSet {
            if money <= 0 {
                checkPrice()
            }
        }
    }

    fileprivate var spinPrice: Int = 50 {
        didSet {
            self.rightMenu.stepper.betweenTitle.text = "\(spinPrice)"
        }
    }
    
    
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
        menu.stepper.minusButton.addTarget(self, action: #selector(spinPriceDown), for: .touchUpInside)
        menu.stepper.plusButton.addTarget(self, action: #selector(spinPriceUp), for: .touchUpInside)
        
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
        AppUtility.lockOrientation(.landscapeRight, andRotateTo: .landscapeRight)
        setupView()
        
        view.backgroundColor = .cyan
        addSubviews()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        userDefaults.set(money, forKey: "money_count")
    }
    
    
    func addSubviews() {
        view.addSubview(mainStackView)
        view.addSubview(winMoneyLabel)
        view.addSubview(rightMenu)
        rightMenu.moneyLabel.text = "\(money)"
        self.rightMenu.stepper.betweenTitle.text = "\(spinPrice)"
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
            
            self.money -= spinPrice
        
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
            makeLabels(1000)
            
            
        } else if slots[0] == slots[1] && slots[1] == slots[2] && slots[2] == slots[3] {
            makeLabels(700)
            
            
        } else if slots[0] == slots[1] && slots[1] == slots[2] {
            makeLabels(500)
            
            
        } else if slots[0] == slots[1] && slots[1] == slots[2] {
            makeLabels(300)
            
            
        } else if slots[0] == slots[1]  {
            makeLabels(100)
        }
        
        
    }
    fileprivate func checkPrice() {
        
        let alert = UIAlertController(title: "Еще ?",
                                      message: "Если хочешь сыграть еще жми повторить.", preferredStyle: .alert)
        let repeatAction = UIAlertAction(title: "Повторить", style: .default) { alert in
            self.spinPrice = 50
            self.money = 1000
            self.winMoneyLabel.text = ""
            self.rightMenu.moneyLabel.text = "\(self.money)"
        }
        
        
        
        let cancel = UIAlertAction(title: "Уйти", style: .destructive) { alert in
            self.navigationController?.popToRootViewController(animated: true)

        }
        alert.addAction(repeatAction)
        alert.addAction(cancel)
            self.present(alert, animated: true)
    }
    
    // MARK: -  Actions
    @objc fileprivate func exitToMenu() {
        print("exit")
    }
    @objc fileprivate func spinPriceUp() {
        self.spinPrice = spinPrice * 2
    }
    @objc fileprivate func spinPriceDown() {
        self.spinPrice = spinPrice / 2
    }
    
    fileprivate func makeLabels(_ moneyInt: Int) {
        switch spinPrice {
        case 50...100:
            self.money += moneyInt
            self.winMoneyLabel.text = "WIN +\(moneyInt)"
            self.rightMenu.moneyLabel.text = "\(money)"
        case 200...400:
            self.money += moneyInt * 3
            self.winMoneyLabel.text = "WIN +\(moneyInt * 3)"
            print(moneyInt)
            self.rightMenu.moneyLabel.text = "\(money)"
            
        default: break
        }
        
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
            make.width.equalTo(440)
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
