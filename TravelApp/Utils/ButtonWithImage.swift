//
//  ButtonWithImage.swift
//  TravelApp
//
//  Created by Sagar on 15/2/19.
//  Copyright © 2019 Sagar. All rights reserved.
//

import UIKit

class ButtonWithImage: UIButton {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if imageView != nil {
            imageEdgeInsets = UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 35)
            titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)

        }
    }
}
