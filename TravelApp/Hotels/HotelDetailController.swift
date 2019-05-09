//
//  HotelDetailController.swift
//  TravelApp
//
//  Created by Sagar on 9/4/19.
//  Copyright © 2019 Sagar. All rights reserved.
//

import UIKit

class HotelDetailController: UIViewController {
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    let container: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let mainImageView: UIImageView = {
        let view = UIImageView()
        view.image = #imageLiteral(resourceName: "the-ritz-hotel-london-770270")
        view.contentMode = .scaleAspectFill
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        self.title = "Ritz Hotel"
        self.navigationController?.navigationBar.topItem?.title = ""
        setupNavigationBar()

        
        view.backgroundColor = .white
        
        scrollView.contentInset = UIEdgeInsets.zero
        scrollView.scrollIndicatorInsets = UIEdgeInsets.zero
        //scrollView.contentInset = UIEdgeInsets.init(top: -20, left: 0, bottom: 0, right: 0)
        scrollView.contentInsetAdjustmentBehavior = .never
        
        extendedLayoutIncludesOpaqueBars = true
        view.addSubview(scrollView)
        scrollView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        scrollView.contentSize = CGSize(width: self.view.frame.width, height: self.view.frame.height + 350)
        
        scrollView.addSubview(container)
        container.anchor(top: scrollView.topAnchor, left: scrollView.leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: self.view.frame.width, height: 350)
        
        container.addSubview(mainImageView)
        mainImageView.anchor(top: container.topAnchor, left: container.leftAnchor, bottom: container.bottomAnchor, right: container.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }
    
    fileprivate func setupNavigationBar() {
        let backImage = #imageLiteral(resourceName: "back_arrow").withRenderingMode(.alwaysOriginal)
        self.navigationController?.navigationBar.backIndicatorImage = backImage
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = backImage
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.isHidden = true
    }
    
    
}
