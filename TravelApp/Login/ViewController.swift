//
//  ViewController.swift
//  TravelApp
//
//  Created by Sagar on 15/2/19.
//  Copyright © 2019 Sagar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let logoImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "Group 2")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "TravelApp"
        label.font = UIFont.appBoldFont(size: 35)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let dLabel = UILabel()
        dLabel.text = "Cool tagline goes here"
        dLabel.font = UIFont.appLightFont(size: 15)
        dLabel.textColor = UIColor.rgb(red: 124, green: 134, blue: 152, alpha: 1)
        dLabel.translatesAutoresizingMaskIntoConstraints = false

        return dLabel
    }()
    
    let facebookButton: ButtonWithImage = {
        let bt = ButtonWithImage(type: .system)
        bt.setTitle("CONNECT WITH FACEBOOK", for: .normal)
        bt.layer.cornerRadius = 25
        bt.titleLabel?.font = UIFont.appRegularFont(size: 12)
        bt.setImage(#imageLiteral(resourceName: "social-facebook").withRenderingMode(.alwaysOriginal), for: .normal)
        
        bt.clipsToBounds = true
        bt.backgroundColor = UIColor.rgb(red: 51, green: 100, blue: 183, alpha: 1)
        bt.setTitleColor(.white, for: .normal)
        bt.translatesAutoresizingMaskIntoConstraints = false
        return bt

    }()
    
    let emailButton: ButtonWithImage = {
        let bt = ButtonWithImage(type: .system)
        bt.setTitle("SIGN UP USING EMAIL", for: .normal)
        bt.titleLabel?.font = UIFont.appRegularFont(size: 12)
        bt.setImage(#imageLiteral(resourceName: "email").withRenderingMode(.alwaysOriginal), for: .normal)

        bt.layer.cornerRadius = 25
        bt.clipsToBounds = true
        bt.backgroundColor = UIColor.rgb(red: 86, green: 128, blue: 250, alpha: 1)
        bt.setTitleColor(.white, for: .normal)
        bt.translatesAutoresizingMaskIntoConstraints = false

        return bt
    }()
    
    let accountLabel: UILabel = {
        let label = UILabel()
        label.text = "I already have account"
        label.font = UIFont.appRegularFont(size: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let loginButton: UIButton = {
       let button = UIButton(type: .system)
        button.setTitle("LOGIN NOW", for: .normal)
        button.setTitleColor(UIColor.rgb(red: 32, green: 49, blue: 82, alpha: 1), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.appBoldFont(size: 13)
        button.addTarget(self, action: #selector(handleShowLogin), for: .touchUpInside)
        return button
    }()
    
    @objc func handleShowLogin() {
        let loginController = LoginViewController()
        navigationController?.pushViewController(loginController, animated: true)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        view.addSubview(logoImageView)
        
        logoImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        logoImageView.widthAnchor.constraint(equalToConstant: 130).isActive = true
        logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 129).isActive = true
        
       
        
        let stackView = UIStackView(arrangedSubviews: [titleLabel, descriptionLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.spacing = 5
        
        view.addSubview(stackView)
        stackView.anchor(top: logoImageView.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 40, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 80)
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        let emailStackView = UIStackView(arrangedSubviews: [facebookButton, emailButton])
        emailStackView.translatesAutoresizingMaskIntoConstraints = false
        emailStackView.axis = .vertical
        emailStackView.distribution = .fillEqually
        emailStackView.spacing = 15
        
        view.addSubview(emailStackView)
        emailStackView.anchor(top: stackView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 84, paddingLeft: 40, paddingBottom: 0, paddingRight: 40, width: 0, height: 120)
        
        
        let loginStackView = UIStackView(arrangedSubviews: [accountLabel, loginButton])
        loginStackView.translatesAutoresizingMaskIntoConstraints = false
        loginStackView.axis = .vertical
        loginStackView.distribution = .fillEqually
        loginStackView.alignment = .center
        loginStackView.spacing = 5
        
        view.addSubview(loginStackView)
        loginStackView.anchor(top: nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 20, paddingBottom: 49, paddingRight: 20, width: 0, height: 30)
    }


}

