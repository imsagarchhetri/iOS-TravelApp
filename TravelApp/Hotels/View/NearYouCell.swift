//
//  NearYouCell.swift
//  TravelApp
//
//  Created by Sagar on 9/4/19.
//  Copyright © 2019 Sagar. All rights reserved.
//

import UIKit

class NearYouCell : UICollectionViewCell {
    
    let cellBgView : ViewWithShadow = {
       let view = ViewWithShadow()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    let hotelImageView : UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "the-ritz-hotel-london-770270")
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
        
    }()
    
    let nameLabel: UILabel = {
       let label = UILabel()
        label.text = "Ritz Hotel"
        label.font = UIFont.appBoldFont(size: 19)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let locationLabel: UILabel = {
        let label = UILabel()
        label.text = "Sydney, Australia"
        label.textColor = UIColor.rgb(red: 124, green: 134, blue: 152, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.appRegularFont(size: 13)
        return label
    }()
    
    let ratingLabel: UILabel = {
        let label = UILabel()
        label.text = "Customers Rating:"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.appRegularFont(size: 12)
        return label
    }()
    
    lazy var emptyStarImageView:  UIImageView  = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "iconfinder_star_172558").withRenderingMode(.alwaysOriginal)
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    lazy var halfStarImageView:  UIImageView  = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.tintColor = UIColor.rgb(red: 124, green: 134, blue: 152, alpha: 1)

        iv.image = #imageLiteral(resourceName: "iconfinder_star-half_383217").withRenderingMode(.alwaysOriginal)
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    lazy var fullStarImageView1:  UIImageView  = {
        let iv = UIImageView()
        iv.tintColor = UIColor.rgb(red: 124, green: 134, blue: 152, alpha: 1)
        iv.image = #imageLiteral(resourceName: "iconfinder_star_3018558").withRenderingMode(.alwaysOriginal)
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    lazy var fullStarImageView2:  UIImageView  = {
        let iv = UIImageView()
        iv.tintColor = UIColor.rgb(red: 124, green: 134, blue: 152, alpha: 1)
        iv.image = #imageLiteral(resourceName: "iconfinder_star_3018558").withRenderingMode(.alwaysOriginal)
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    lazy var fullStarImageView3:  UIImageView  = {
        let iv = UIImageView()
        iv.tintColor = UIColor.rgb(red: 124, green: 134, blue: 152, alpha: 1)
        iv.image = #imageLiteral(resourceName: "iconfinder_star_3018558")
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        addSubview(cellBgView)
        cellBgView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 10, paddingLeft: 15, paddingBottom: 10, paddingRight: 15, width: 0, height: 0)
        
        cellBgView.addSubview(hotelImageView)
        hotelImageView.anchor(top: cellBgView.topAnchor, left: cellBgView.leftAnchor, bottom: cellBgView.bottomAnchor, right: nil, paddingTop: 10, paddingLeft: 10, paddingBottom: 10, paddingRight: 0, width: 125, height: 0)
        
        cellBgView.addSubview(nameLabel)
        nameLabel.anchor(top: cellBgView.topAnchor, left: hotelImageView.rightAnchor, bottom: nil, right: cellBgView.rightAnchor, paddingTop: 10, paddingLeft: 15, paddingBottom: 0, paddingRight: 15, width: 0, height: 0)
        
        cellBgView.addSubview(locationLabel)
        locationLabel.anchor(top: nameLabel.bottomAnchor, left: hotelImageView.rightAnchor, bottom: nil, right: cellBgView.rightAnchor, paddingTop: 2, paddingLeft: 15, paddingBottom: 0, paddingRight: 15, width: 0, height: 0)
        
        
        
        let starStackView = UIStackView(arrangedSubviews: [fullStarImageView1, fullStarImageView2, fullStarImageView3, halfStarImageView, emptyStarImageView])
        starStackView.spacing = 3
        starStackView.axis = .horizontal
        starStackView.distribution = .fillEqually
        starStackView.translatesAutoresizingMaskIntoConstraints = false

        
        cellBgView.addSubview(starStackView)
        starStackView.anchor(top: nil, left: hotelImageView.rightAnchor, bottom: cellBgView.bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 15, paddingBottom: 15, paddingRight: 0, width: 100, height: 25)
        
        cellBgView.addSubview(ratingLabel)
        ratingLabel.anchor(top: nil, left: hotelImageView.rightAnchor, bottom: starStackView.topAnchor, right: cellBgView.rightAnchor, paddingTop: 0, paddingLeft: 15, paddingBottom: 2, paddingRight: 15, width: 0, height: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
