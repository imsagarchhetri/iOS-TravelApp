//
//  PopularCollectionViewCell.swift
//  TravelApp
//
//  Created by Sagar on 17/2/19.
//  Copyright © 2019 Sagar. All rights reserved.
//

import UIKit
import SDWebImage



class PopularCollectionViewCell: UICollectionViewCell {
    
    var popularCity: City? {
        didSet {
            self.nameLabel.text = popularCity?.name
            //self.destinationImageView.image = UIImage(named: (popularCity?.imageURL)!)
            self.destinationImageView.sd_setImage(with: URL(string: (popularCity?.imageURL) ?? ""), completed: nil)
        }
    }
    
    
    let destinationImageView: UIImageView = {
       let iv = UIImageView()
        iv.layer.cornerRadius = 4
        iv.clipsToBounds = true
        iv.contentMode = .scaleAspectFill
        iv.image = #imageLiteral(resourceName: "150")
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let nameView: UIView = {
        let view = UIView()
        //view.backgroundColor = UIColor.rgb(red: 32, green: 49, blue: 82, alpha: 0.6)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 4
        view.clipsToBounds = true
        //view.layer.borderColor = UIColor.rgb(red: 242, green: 242, blue: 242, alpha: 0.4).cgColor
        return view
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "HONG KONG"
        label.font = UIFont.appDemiBoldFont(size: 21)
        
        label.layer.shadowColor = UIColor.black.cgColor
        label.layer.shadowOpacity = 0.6
        label.layer.shadowOffset = CGSize(width: 0, height: 1)
        label.layer.shadowRadius = 2
        
        

        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()
    
  
    
    
    let numberOfHotelLabel : UILabel = {
        let label = UILabel()
        label.text = "254 Hotels available"
        label.font = UIFont.appLightFont(size: 14)
        label.textColor = UIColor.rgb(red: 124, green: 134, blue: 153, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let ratingView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.rgb(red: 32, green: 49, blue: 82, alpha: 0.8)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let ratingLabel: UILabel = {
        let label = UILabel()
        label.text = "8.2"
        label.font = UIFont.appRegularFont(size: 12)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addSubview(destinationImageView)
        destinationImageView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 5, paddingLeft: 5, paddingBottom: 5, paddingRight: 5, width: 0, height: 0)
        
        destinationImageView.addSubview(nameLabel)
        nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
        nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -35).isActive = true

        

//        let stackView = UIStackView(arrangedSubviews: [nameLabel])
//        stackView.axis = .vertical
//        stackView.distribution = .fillEqually
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        nameView.addSubview(stackView)
//
//
//        stackView.anchor(top: nameView.topAnchor, left: nameView.leftAnchor, bottom: nameView.bottomAnchor, right: nameView.rightAnchor, paddingTop: 4, paddingLeft: 15, paddingBottom: 4, paddingRight: 15, width: 0, height: 0)
//
//        destinationImageView.addSubview(ratingView)
//        ratingView.anchor(top: destinationImageView.topAnchor, left: nil, bottom: nil, right: destinationImageView.rightAnchor, paddingTop: 12, paddingLeft: 0, paddingBottom: 0, paddingRight: 15, width: 30, height: 30)
//        ratingView.layer.cornerRadius = 15
//        ratingView.layer.masksToBounds = true
//
//        ratingView.addSubview(ratingLabel)
//        ratingLabel.centerXAnchor.constraint(equalTo: ratingView.centerXAnchor).isActive = true
//        ratingLabel.centerYAnchor.constraint(equalTo: ratingView.centerYAnchor).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
