//
//  SearchCell.swift
//  TravelApp
//
//  Created by Sagar on 6/4/19.
//  Copyright © 2019 Sagar. All rights reserved.
//

import UIKit

class SearchCell: UICollectionViewCell {
    
    var search: Destination? {
        didSet {
            nameLabel.text = search?.name
            cityLabel.text = search?.nameSuffix
            let mediaUrl = search?.media?.media?[0].url
//            let finalUrlString = Helper.getUrlWithSize(urlString: mediaUrl ?? "", withWidth: "900", andWithHeight: "600")
//            if finalUrlString != "" {
//                imageView.sd_setImage(with: URL(string: finalUrlString ), completed: nil)
//
//            } else {
                //imageView.sd_setImage(with: URL(string: mediaUrl ?? "" ), completed: nil)
            if let url = mediaUrl {
                imageView.sd_setImage(with: URL(string: url ), placeholderImage: #imageLiteral(resourceName: "scope_placeholder"), options: [], completed: nil)

            } else {
                imageView.image = #imageLiteral(resourceName: "no_image_to_show_")
            
            }
            //}
        }
    }
    
    var imageView : UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = #imageLiteral(resourceName: "hong_kong")
        iv.clipsToBounds = true
        return iv
    }()
    
    var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Hong Kong"
        label.font = UIFont.appBoldFont(size: 22)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var cityLabel: UILabel = {
        let label = UILabel()
        label.text = "Hong Kong, China"
        label.font = UIFont.appRegularFont(size: 14)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var gradientView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        //view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        //view.backgroundColor = .black
        

        
        
        return view
    }()

    
    let cellBgView : ViewWithShadow = {
        let view = ViewWithShadow()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
     
        addSubview(cellBgView)
        cellBgView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 10, paddingRight: 0, width: 0, height: 0)
        
       cellBgView.addSubview(imageView)
        imageView.anchor(top: cellBgView.topAnchor, left: cellBgView.leftAnchor, bottom: cellBgView.bottomAnchor, right: cellBgView.rightAnchor, paddingTop: 5, paddingLeft: 5, paddingBottom: 5, paddingRight: 5, width: 0, height: 0)
        
        imageView.addSubview(gradientView)
        gradientView.anchor(top: nil, left: imageView.leftAnchor, bottom: imageView.bottomAnchor, right: imageView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 100)
        let gradient = CAGradientLayer()
        
        gradient.frame = self.bounds
        let blackColor = UIColor.rgb(red: 25, green: 25, blue: 25, alpha: 1)
        gradient.colors = [UIColor.clear.cgColor, UIColor.clear.cgColor, UIColor.clear.cgColor, UIColor.clear.cgColor, blackColor.cgColor, blackColor.cgColor]
        gradient.locations = [0.0, 0.15, 0.25, 0.75, 0.85, 1.0]
        
        gradientView.layer.addSublayer(gradient)
        
      
        
        gradientView.addSubview(cityLabel)
        cityLabel.anchor(top: nil, left: gradientView.leftAnchor, bottom: gradientView.bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 15, paddingBottom: 5, paddingRight: 0, width: 0, height: 0)
        
        gradientView.addSubview(nameLabel)
        nameLabel.anchor(top: nil, left: gradientView.leftAnchor, bottom: cityLabel.topAnchor       , right: nil, paddingTop: 5, paddingLeft: 15, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
