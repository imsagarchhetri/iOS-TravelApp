//
//  LoginViewController.swift
//  TravelApp
//
//  Created by Sagar on 15/2/19.
//  Copyright © 2019 Sagar. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    let welcomeLabel : UILabel = {
        let label = UILabel()
        let attributedLabel =  NSMutableAttributedString(string: "Welcome Back", attributes: [NSAttributedString.Key.font : UIFont.appRegularFont(size: 25),
            NSAttributedString.Key.foregroundColor: UIColor.rgb(red: 32, green: 49, blue: 82, alpha: 1)])
        label.attributedText = attributedLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let welcomeDescriptionLabel : UILabel = {
        let label = UILabel()
        let attributedLabel =  NSMutableAttributedString(string: "Please enter your credentials in the form below:", attributes: [NSAttributedString.Key.font : UIFont.appLightFont(size: 13), NSAttributedString.Key.foregroundColor: UIColor.rgb(red: 124, green: 134, blue: 152, alpha: 1)])
        
        label.attributedText = attributedLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let loginBackground: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "sample_image").withAlignmentRectInsets(UIEdgeInsets(top: 15, left: 0, bottom: 0, right: 0))
        iv.contentMode = .scaleAspectFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        
        iv.clipsToBounds = true
        return iv
    }()
    
    let formView : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
        
    }()
    
    let emailLabel: UILabel = {
        let label = UILabel()
        label.text = "Email"
        label.font = UIFont.appLightFont(size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let emailTextField: CustomTextField = {
        let textField = CustomTextField(padding: 0)
        textField.font = UIFont.appRegularFont(size: 20)
        textField.attributedPlaceholder = NSAttributedString(string: "Enter email address", attributes: [NSAttributedString.Key.font: UIFont.appLightFont(size: 20), NSAttributedString.Key.foregroundColor: UIColor.rgb(red: 214, green: 214, blue: 214, alpha: 1)])
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.autocapitalizationType = .none
        textField.addTarget(self, action: #selector(handleTextInputchange), for: .editingChanged)

        return textField
    }()
    
    let horizontalLine: UIView = {
        let view = UIView()

        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.rgb(red: 214, green: 214, blue: 214, alpha: 1)
        view.layoutMargins =  UIEdgeInsets(top: 5, left: 0, bottom: 0, right: 0)
        return view
    }()
    
    let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Password"
        label.font = UIFont.appLightFont(size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let passwordTextField: CustomTextField = {
        let textField = CustomTextField(padding: 0)
        textField.font = UIFont.appRegularFont(size: 20)
        textField.attributedPlaceholder = NSAttributedString(string: "Enter password", attributes: [NSAttributedString.Key.font: UIFont.appLightFont(size: 20), NSAttributedString.Key.foregroundColor: UIColor.rgb(red: 214, green: 214, blue: 214, alpha: 1)])
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.addTarget(self, action: #selector(handleTextInputchange), for: .editingChanged)
        textField.isSecureTextEntry = true
        return textField
    }()
    
    @objc func handleTextInputchange() {
        let isFormValid = emailTextField.text?.count ?? 0 > 0 && passwordTextField.text?.count ?? 0 > 0
        
        if isFormValid {
            LoginButton.isEnabled = true
            LoginButton.backgroundColor = UIColor.rgb(red: 86, green: 146, blue: 250, alpha: 1)
        } else {
            LoginButton.isEnabled = false
            LoginButton.backgroundColor = UIColor.rgb(red: 143, green: 169, blue: 243, alpha: 1)
        }
    }
    let horizontalLine1: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.rgb(red: 214, green: 214, blue: 214, alpha: 1)
        view.layoutMargins =  UIEdgeInsets(top: 15, left: 0, bottom: 0, right: 0)

        return view
    }()
    
    
    
    let LoginButton: ButtonWithImage = {
        let bt = ButtonWithImage(type: .system)
        bt.setTitle("LOGIN", for: .normal)
        bt.layer.cornerRadius = 27
        bt.titleLabel?.font = UIFont.appRegularFont(size: 12)
                bt.backgroundColor = UIColor.rgb(red: 143, green: 169, blue: 243, alpha: 1)
        bt.isEnabled = false
        bt.setTitleColor(.white, for: .normal)
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        return bt
    }()
    
    @objc func handleLogin() {
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if let err = error {
                print("Failed to sign in with email", err)
            }
            
            
            print("Successfully logged back in with user:",  result?.user.uid ?? "")
          //  guard let mainTabBarController = UIApplication.shared.keyWindow?.rootViewController as? MainTabBarController else { return }
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    let accountLabel: UILabel = {
        let label = UILabel()
        label.text = "Don't have an account yet?"
        label.font = UIFont.appRegularFont(size: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let signUpButon: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("SIGN UP NOW", for: .normal)
        button.setTitleColor(UIColor.rgb(red: 32, green: 49, blue: 82, alpha: 1), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.appBoldFont(size: 13)
        button.addTarget(self, action: #selector(handleShowSignup), for: .touchUpInside)
        return button
    }()
    lazy var loginView = UIView()

    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        setupNavigationBar()
        
        
        let stackView = UIStackView(arrangedSubviews: [welcomeLabel, welcomeDescriptionLabel])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        stackView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 100, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: 50)
        
        let loginView = UIView()
        loginView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(loginView)
        loginView.anchor(top: stackView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 385)
        loginView.addSubview(loginBackground)
        loginBackground.anchor(top: loginView.topAnchor, left: loginView.leftAnchor, bottom: loginView.bottomAnchor, right: loginView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        
        loginView.addSubview(formView)
        formView.anchor(top: loginView.topAnchor, left: loginView.leftAnchor, bottom: nil, right: loginView.rightAnchor, paddingTop: 52, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: 277)
        
        
        let emailStackView = setupformStackView(with: emailLabel, textField: emailTextField, horizontalLine: horizontalLine)
        
       formView.addSubview(emailStackView)
  emailStackView.anchor(top: formView.topAnchor, left: formView.leftAnchor, bottom: nil, right: formView.rightAnchor, paddingTop: 10, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: 76)
        
        let passwordStackView = setupformStackView(with: passwordLabel, textField: passwordTextField, horizontalLine: horizontalLine1)
        formView.addSubview(passwordStackView)

        passwordStackView.anchor(top: emailStackView.bottomAnchor, left: formView.leftAnchor, bottom: nil, right: formView.rightAnchor, paddingTop: 10, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: 76)

        loginView.addSubview(LoginButton)
        LoginButton.anchor(top: formView.bottomAnchor, left: loginView.leftAnchor, bottom: nil, right: loginView.rightAnchor, paddingTop: -27, paddingLeft: 50, paddingBottom: 0, paddingRight: 50, width: 0, height: 55)
        
        let signupStackView = UIStackView(arrangedSubviews: [accountLabel, signUpButon])
        signupStackView.translatesAutoresizingMaskIntoConstraints = false
        signupStackView.axis = .vertical
        signupStackView.distribution = .fillEqually
        signupStackView.alignment = .center
        signupStackView.spacing = 5
        
        view.addSubview(signupStackView)
        signupStackView.anchor(top: nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 20, paddingBottom: 49, paddingRight: 20, width: 0, height: 30)
        
      setupTapGesture()
    }
    
    //MARK:- Setup Functions
    fileprivate func setupNavigationBar() {
        let backImage = #imageLiteral(resourceName: "back_arrow").withRenderingMode(.alwaysOriginal)
        self.navigationController?.navigationBar.backIndicatorImage = backImage
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = backImage
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.topItem?.title = ""
    }
    
    fileprivate func setupformStackView(with label: UILabel, textField: UITextField, horizontalLine: UIView) -> UIStackView{
        let formStackView = UIStackView(arrangedSubviews: [label,textField, horizontalLine])
        formStackView.axis = .vertical
        formStackView.translatesAutoresizingMaskIntoConstraints = false
        horizontalLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
        horizontalLine.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 55).isActive = true


        return formStackView
    }
    
    
    @objc func handleShowSignup() {
        let signupController = SignUpViewController()
        navigationController?.pushViewController(signupController, animated: true)
    }
    
    fileprivate func setupTapGesture() {
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTapDismiss)))
    }
    
    @objc fileprivate func handleTapDismiss() {
        self.view.endEditing(true)
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.view.transform = .identity
        }, completion: nil)
    }
    
   
    
   



}
