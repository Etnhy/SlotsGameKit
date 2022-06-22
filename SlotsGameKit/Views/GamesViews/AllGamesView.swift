//
//  AllGamesView.swift
//  SlotsGameKit
//
//  Created by Evhenii Mahlena on 22.06.2022.
//

import UIKit
import SnapKit

class AllGamesView: UIView {
    

    lazy var firstGame: PopulateGameView = {
       var view = PopulateGameView()
        return view
    }()
    /* second game container + image */
    lazy var secondGame: UIImageView = {
       var view = UIImageView()
        view.image = UIImage(named: "lightning")?.withRenderingMode(.alwaysOriginal)
        view.layer.cornerRadius = 10
        return view
    }()
    lazy var secondGameContainer: UIView = {
       var view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        view.layer.cornerRadius = 10
        return view
    }()
    /* ----------------------------- */

    /* third game container + image */
    lazy var thirdGame: UIImageView = {
       var view = UIImageView()
        view.image = UIImage(named: "light")
        view.layer.cornerRadius = 10
        
        return view
    }()
    
    lazy var thirdGameContainer: UIView = {
       var view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        view.layer.cornerRadius = 10
        return view
    }()
    /* ----------------------------- */

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
        setupView()
        
    }
    
    fileprivate func setupView() {
        addSubviews()
    }

    
    fileprivate func addSubviews() {
        addSubview(firstGame)
        
        addSubview(secondGameContainer)
        secondGameContainer.addSubview(secondGame)
        
        addSubview(thirdGameContainer)
        thirdGameContainer.addSubview(thirdGame)
        activateConstraints()
    }
    

    fileprivate func activateConstraints() {
        firstGame.snp.makeConstraints { make in
            make.top.equalTo(self)
            make.leading.equalTo(self)
            make.trailing.equalTo(self)
            make.height.equalTo(165)
        }
        
        /* second game */
        secondGameContainer.snp.makeConstraints { make in
            make.top.equalTo(firstGame.snp.bottom).offset(20)
            make.leading.equalTo(self).offset(34)
            make.size.equalTo(CGSize(width: 165, height: 165))
        }
        secondGame.snp.makeConstraints { make in
            make.top.equalTo(secondGameContainer).offset(13.95)
            make.leading.equalTo(secondGameContainer).offset(26.78)
            make.trailing.equalTo(secondGameContainer).offset(-27.78)
            make.bottom.equalTo(secondGameContainer.snp.bottom).offset(-13.34)
        }
        
        /* third game */
        thirdGameContainer.snp.makeConstraints { make in
            make.top.equalTo(firstGame.snp.bottom).offset(20)
            make.trailing.equalTo(self).offset(-34)
            make.size.equalTo(CGSize(width: 165, height: 165))
        }
        thirdGame.snp.makeConstraints { make in
            make.top.equalTo(thirdGameContainer).offset(28)
            make.leading.equalTo(thirdGameContainer).offset(52)
            make.trailing.equalTo(thirdGameContainer).offset(-38)
            make.bottom.equalTo(thirdGameContainer.snp.bottom).offset(-28.57)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

