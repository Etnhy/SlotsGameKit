//
//  PopulateGameView.swift
//  SlotsGameKit
//
//  Created by Evhenii Mahlena on 22.06.2022.
//

import UIKit
import SnapKit

class PopulateGameView: UIView {
    
    
    let containerImage: UIView = {
        var view = UIView()
        view.backgroundColor = .brown
        view.layer.cornerRadius = 10
        return view
    }()
    
    
    let backgroundImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Rectangle 1")
        image.clipsToBounds = true
        image.layer.cornerRadius = 10
        image.backgroundColor = .black
        return image
    }()
    
    let fairyImage: UIImageView = {
       var img = UIImageView()
        img.image = UIImage(named: "fairy-theme 1")
        return img
    }()
    
    let starImage: UIImageView = {
       var image = UIImageView()
        image.image = UIImage(named: "first_9@4x")
        return image
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    fileprivate func setupView() {
        self.backgroundColor = .clear
        addSubview(containerImage)

        
        
        containerImage.addSubview(backgroundImage)
        containerImage.addSubview(fairyImage)
        containerImage.addSubview(starImage)
        activateConstraints()
        
    }
    fileprivate func activateConstraints() {
        containerImage.snp.makeConstraints { make in
            make.top.equalTo(self)
            make.leading.equalTo(self).offset(34)
            make.trailing.equalTo(self).offset(-34)
            make.height.equalTo(165)
        }
        
        backgroundImage.snp.makeConstraints { make in
            make.leading.trailing.equalTo(containerImage)
            make.top.bottom.equalTo(containerImage)
        }
        fairyImage.snp.makeConstraints { make in
            make.trailing.equalTo(containerImage)
            make.top.equalTo(containerImage)
            make.bottom.equalTo(containerImage)
            make.width.equalTo(264)
        }
        starImage.snp.makeConstraints { make in
            make.centerY.equalTo(containerImage)
            make.leading.equalTo(containerImage).offset(33)
            make.size.equalTo(CGSize(width: 124, height: 118))
        }
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
