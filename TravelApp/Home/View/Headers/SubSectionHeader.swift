//
//  SubSectionHeader.swift
//  TravelApp
//
//  Created by Sagar on 21/2/19.
//  Copyright © 2019 Sagar. All rights reserved.
//

import UIKit

class SubSectionHeader: UICollectionViewCell {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Popular Destination"
        label.font = UIFont.appBoldFont(size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(titleLabel)
        titleLabel.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 3, paddingLeft: 3, paddingBottom: 3, paddingRight: 3, width: 0, height: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
