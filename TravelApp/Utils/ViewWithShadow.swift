//
//  GradientView.swift
//  TravelApp
//
//  Created by Sagar on 9/4/19.
//  Copyright © 2019 Sagar. All rights reserved.
//

import UIKit

class ViewWithShadow : UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.shadowColor = UIColor.rgb(red: 93, green: 93, blue: 96, alpha: 0.6).cgColor
        layer.shadowOpacity = 0.3
        layer.shadowRadius = 3
        layer.shadowOffset = CGSize(width: 1, height: 2)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
