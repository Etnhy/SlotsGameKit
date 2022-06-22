//
//  SpinButton.swift
//  SlotsGameKit
//
//  Created by Evhenii Mahlena on 21.06.2022.
//

import UIKit

class SpinButton: UIButton {

    let leftArrow: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Vector")
        image.clipsToBounds = true
        return image
    }()
    let rightArrow: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Vector 2")
        image.clipsToBounds = true

        return image
    }()
    
    let mainImageButton: UIImageView = {
        var image = UIImageView()
        image.image = UIImage(named: "Ellipse 14")
        image.clipsToBounds = true
        return image
    }()
    let spinTitle: UILabel = {
        var text = UILabel()
        text.text = "SPIN"
        text.textColor = .white
        text.font = .systemFont(ofSize: 34, weight: .bold)
        return text
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(leftArrow)
        addSubview(rightArrow)
        addSubview(mainImageButton)
        addSubview( spinTitle )

        spinTitle.snp.makeConstraints { make in
            make.centerX.equalTo(self)
            make.centerY.equalTo(self)
        }
        
        leftArrow.snp.makeConstraints { make in
            make.leading.equalTo(self).offset(-47)
            make.top.equalTo(self).offset(-47)
            make.height.equalTo(128)
            make.width.equalTo(95)
        }
        rightArrow.snp.makeConstraints { make in
            make.trailing.equalTo(self).offset(47)
            make.bottom.equalTo(self).offset(47)
            make.height.equalTo(128)
            make.width.equalTo(95)

        }
        
        
        
        mainImageButton.snp.makeConstraints { make in
            make.centerX.equalTo(self)
            make.centerY.equalTo(self)
            
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
