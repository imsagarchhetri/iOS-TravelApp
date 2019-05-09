//
//  SearchHeader.swift
//  TravelApp
//
//  Created by Sagar on 6/4/19.
//  Copyright © 2019 Sagar. All rights reserved.
//

import UIKit

protocol searchDelegate {
    func cancelCurrentViewController()
}

class SearchHeader : UICollectionViewCell {
    var delegate: searchDelegate?
    
    
    var defaultLabel: UILabel = {
       let label = UILabel()
        label.text = "SEARCH:"
        label.font = UIFont.appBoldFont(size: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var searchLabel: UILabel = {
        let label = UILabel()
        label.text = "Hong Kong"
        label.font = UIFont.appBoldFont(size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var cancelButton: UIButton = {
       let button =  UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "cancel").withRenderingMode(.alwaysOriginal), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleCancel), for: .touchUpInside)
        return button
    }()
    
    @objc func handleCancel() {
        
        print("Cancel Pressed")
        delegate?.cancelCurrentViewController()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
       
        isUserInteractionEnabled = true

        addSubview(defaultLabel)
        defaultLabel.anchor(top: topAnchor, left: nil, bottom: nil, right: nil, paddingTop: 15, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        defaultLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true

        addSubview(searchLabel)
        searchLabel.anchor(top: defaultLabel.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        searchLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        addSubview(cancelButton)
        cancelButton.anchor(top: nil, left: nil, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft:0, paddingBottom: 0, paddingRight: 35, width: 25, height: 25)
        cancelButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
      

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
