//
//  AttractionViewCell.swift
//  TravelApp
//
//  Created by Sagar on 19/2/19.
//  Copyright © 2019 Sagar. All rights reserved.
//

import UIKit

class AttractionViewCell: UICollectionViewCell {
    
    let imageView: UIImageView = {
       let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "buddha")
        iv.contentMode = .scaleAspectFill
        iv.layer.cornerRadius = 4
        iv.layer.masksToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Tian Tan Buddha"
        label.font = UIFont.appRegularFont(size: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.shadowOffset = .zero
        layer.shadowColor = UIColor.rgb(red: 195, green: 195, blue: 195, alpha: 1).cgColor
        layer.shadowOpacity = 0.60
        layer.cornerRadius = 4
    
        
        addSubview(imageView)
        imageView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 160)
        
        addSubview(nameLabel)
        nameLabel.anchor(top: imageView.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 3, paddingLeft: 3, paddingBottom: 3, paddingRight: 3, width: 0, height: 0)
        backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
