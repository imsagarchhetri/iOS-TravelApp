//
//  exploreCollectionViewCell.swift
//  TravelApp
//
//  Created by Sagar on 17/2/19.
//  Copyright © 2019 Sagar. All rights reserved.
//

import UIKit

class exploreCollectionViewCell: UICollectionViewCell {
    
    
    let photoImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = #imageLiteral(resourceName: "sydney")
        iv.layer.cornerRadius = 4
        iv.clipsToBounds = true

        return iv
    }()
    
    let titleLabel: UILabel = {
       let label = UILabel()
        label.text = "SYDNEY"
        label.font = UIFont.appBoldFont(size: 17)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let outerLayer: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.rgb(red: 37, green: 37, blue: 37, alpha: 0.4)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(photoImageView)
        
      
        photoImageView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        photoImageView.addSubview(outerLayer)
        outerLayer.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        addSubview(titleLabel)
        titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
