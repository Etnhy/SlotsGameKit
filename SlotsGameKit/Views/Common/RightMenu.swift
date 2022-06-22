//
//  RightMenu.swift
//  SlotsGameKit
//
//  Created by Evhenii Mahlena on 21.06.2022.
//

import UIKit
import SnapKit

class RightMenu: UIView {
        // MARK: - money label
    lazy var moneyLabel: UILabel = {
        var view = UILabel()
        view.text = "123 456"
        view.font = .systemFont(ofSize: 22, weight: .bold)
        view.textAlignment = .center
        return view
        
    }()
    // MARK: - other
    lazy var spinButton: SpinButton = {
        var button = SpinButton()
        button.addTarget(self, action: #selector(textset), for: .touchUpInside)
        return button
    }()
    
    let stepper: Stepper = {
        var step = Stepper()
        return step
    }()
    
    let topChest: UIImageView = {
       var view = UIImageView()
        view.image = UIImage(named: "chest")
        return view
    }()

    lazy var moneyView: UIView = {
       var view = UIView()
        view.backgroundColor = .orange
        view.layer.cornerRadius = 5
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.backgroundColor = .black.withAlphaComponent(0.5)
        
        addSubview(spinButton)
        addSubview(stepper)
        addSubview(topChest)
        addSubview(moneyView)
        moneyView.addSubview(moneyLabel)
        setGradientMoneyView()

        activateConstraints()
    }
    
    override func layoutSubviews() {
        self.roundCorners(corners: [.topLeft], radius: 60)
    }
    @objc func textset() {
        print("works")
    }
    fileprivate func activateConstraints() {
        stepper.snp.makeConstraints { make in

            make.bottom.equalTo(self).offset(-31)
            make.leading.equalTo(self).offset(20)
            make.trailing.equalTo(self).offset(-20)
        }
        spinButton.snp.makeConstraints { make in
            make.top.equalTo(topChest.snp.bottom).offset(90)
            make.centerX.equalTo(stepper)
        }
        topChest.snp.makeConstraints { make in
            make.top.equalTo(self).offset(20)
            make.centerX.equalTo(spinButton)
        }
        moneyView.snp.makeConstraints { make in
            make.top.equalTo(topChest).offset(67)
            make.centerX.equalTo(topChest)
            make.size.equalTo(CGSize(width: 170, height: 30))
        }
        moneyLabel.snp.makeConstraints { make in
            make.centerX.equalTo(moneyView)
            make.centerY.equalTo(moneyView)
            make.size.equalTo(CGSize(width: 160, height: 28))

        }
        
    }
    fileprivate func setGradientMoneyView() {
        let gradient: CAGradientLayer = CAGradientLayer()

        gradient.colors = [UIColor(named: "moneyGradientEnd")!.cgColor, UIColor(named: "moneyGradientStart")!.cgColor]
        gradient.locations = [0.0 , 1.0]
        gradient.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradient.frame = CGRect(x: 0.0, y: 0.0, width: moneyView.frame.size.width, height: moneyView.frame.size.height)

        moneyView.layer.insertSublayer(gradient, at: 0)

    }
}

extension RightMenu {
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
         let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
         let mask = CAShapeLayer()
         mask.path = path.cgPath
         layer.mask = mask
     }
}
