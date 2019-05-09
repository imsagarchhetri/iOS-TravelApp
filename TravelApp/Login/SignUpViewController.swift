//
//  SignUpViewController.swift
//  TravelApp
//
//  Created by Sagar on 16/2/19.
//  Copyright © 2019 Sagar. All rights reserved.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {
    
    
    let welcomeLabel : UILabel = {
        let label = UILabel()
        let attributedLabel =  NSMutableAttributedString(string: "Create Account", attributes: [NSAttributedString.Key.font : UIFont.appRegularFont(size: 25),
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
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name"
        label.font = UIFont.appLightFont(size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let nameTextField: CustomTextField = {
        let textField = CustomTextField(padding: 0)
        textField.font = UIFont.appRegularFont(size: 20)
        textField.attributedPlaceholder = NSAttributedString(string: "Enter your name", attributes: [NSAttributedString.Key.font: UIFont.appLightFont(size: 20), NSAttributedString.Key.foregroundColor: UIColor.rgb(red: 214, green: 214, blue: 214, alpha: 1)])
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let horizontalLine1: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.rgb(red: 214, green: 214, blue: 214, alpha: 1)
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
        textField.autocapitalizationType = .none

        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.addTarget(self, action: #selector(handleTextInputchange), for: .editingChanged)
        return textField
    }()
    
    @objc func handleTextInputchange() {
        let isFormValid = emailTextField.text?.count ?? 0 > 0 && passwordTextField.text?.count ?? 0 > 0 && repeatPasswordTextField.text?.count ?? 0 > 0
        
        if isFormValid {
            signupButton.isEnabled = true
            signupButton.backgroundColor = UIColor.rgb(red: 86, green: 146, blue: 250, alpha: 1)
        } else {
            signupButton.isEnabled = false
            signupButton.backgroundColor = UIColor.rgb(red: 143, green: 169, blue: 243, alpha: 1)
        }
    }
    
    let horizontalLine2: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.rgb(red: 214, green: 214, blue: 214, alpha: 1)
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
        textField.isSecureTextEntry = true
        textField.addTarget(self, action: #selector(handleTextInputchange), for: .editingChanged)


        return textField
    }()
    let horizontalLine3: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.rgb(red: 214, green: 214, blue: 214, alpha: 1)
        return view
    }()
    let repeatPasswordLabel: UILabel = {
        let label = UILabel()
        label.text = "Repeat Password"
        label.font = UIFont.appLightFont(size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let repeatPasswordTextField: CustomTextField = {
        let textField = CustomTextField(padding: 0)
        textField.font = UIFont.appRegularFont(size: 20)
        textField.attributedPlaceholder = NSAttributedString(string: "Repeat password", attributes: [NSAttributedString.Key.font: UIFont.appLightFont(size: 20), NSAttributedString.Key.foregroundColor: UIColor.rgb(red: 214, green: 214, blue: 214, alpha: 1)])
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.isSecureTextEntry = true
        textField.addTarget(self, action: #selector(handleTextInputchange), for: .editingChanged)

        return textField
    }()
    let horizontalLine4: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.rgb(red: 214, green: 214, blue: 214, alpha: 1)
        return view
    }()
    
    let signupButton: UIButton = {
        let bt = UIButton(type: .system)
        bt.setTitle("Signup", for: .normal)
        bt.layer.cornerRadius = 27
        bt.clipsToBounds = true
        bt.titleLabel?.font = UIFont.appRegularFont(size: 12)
        bt.backgroundColor = UIColor.rgb(red: 143, green: 169, blue: 243, alpha: 1)
        bt.setTitleColor(.white, for: .normal)
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.isUserInteractionEnabled = true
        bt.addTarget(self, action: #selector(handleSignup), for: .touchUpInside)
        bt.isEnabled = false
        return bt
    }()
    
    let signupButton1: UIButton = {
        let bt = UIButton(type: .system)
        bt.setTitle("Signup", for: .normal)
        bt.titleLabel?.font = UIFont.appRegularFont(size: 12)
        bt.backgroundColor = UIColor.rgb(red: 86, green: 146, blue: 250, alpha: 1)
        bt.setTitleColor(.white, for: .normal)
        bt.translatesAutoresizingMaskIntoConstraints = false

        return bt
    }()
    
    
    
    @objc func handleSignup() {
        guard let email = emailTextField.text, email.count > 0 else { return }
        guard let password = passwordTextField.text, password.count > 0 else { return }
        guard let repeatPassword = repeatPasswordTextField.text, repeatPassword.count > 0 else { return }
        
        if password != repeatPassword {
            print("password did not match")
            return
        }

        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            if let err = error {
                print("Failed to create user:", err)
                return
            }
            
            print("Successfully created user:", result?.user.uid ?? "")
        }
    }
    
    lazy var loginView = UIView()
  

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        
        view.backgroundColor = .white
        
        let stackView = UIStackView(arrangedSubviews: [welcomeLabel, welcomeDescriptionLabel])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        stackView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 100, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: 50)
        
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(loginView)
        loginView.anchor(top: stackView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 450)
        loginView.addSubview(loginBackground)
        loginBackground.anchor(top: loginView.topAnchor, left: loginView.leftAnchor, bottom: loginView.bottomAnchor, right: loginView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        
        loginView.addSubview(formView)
        formView.anchor(top: loginView.topAnchor, left: loginView.leftAnchor, bottom: nil, right: loginView.rightAnchor, paddingTop: 52, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: 450)
        
        let nameStackView = setupformStackView(with: nameLabel, textField: nameTextField, horizontalLine: horizontalLine1)
        
        formView.addSubview(nameStackView)
        nameStackView.anchor(top: formView.topAnchor, left: formView.leftAnchor, bottom: nil, right: formView.rightAnchor, paddingTop: 10, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: 76)
        
        
        let emailStackView = setupformStackView(with: emailLabel, textField: emailTextField, horizontalLine: horizontalLine2)
        formView.addSubview(emailStackView)
        emailStackView.anchor(top: nameStackView.bottomAnchor, left: formView.leftAnchor, bottom: nil, right: formView.rightAnchor, paddingTop: 10, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: 76)
        
        let passwordStackView = setupformStackView(with: passwordLabel, textField: passwordTextField, horizontalLine: horizontalLine3)
        formView.addSubview(passwordStackView)
        passwordStackView.anchor(top: emailStackView.bottomAnchor, left: formView.leftAnchor, bottom: nil, right: formView.rightAnchor, paddingTop: 10, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: 76)
        
        let repeatPasswordStackView = setupformStackView(with: repeatPasswordLabel, textField: repeatPasswordTextField, horizontalLine: horizontalLine4)
        formView.addSubview(repeatPasswordStackView)
        repeatPasswordStackView.anchor(top: passwordStackView.bottomAnchor, left: formView.leftAnchor, bottom: nil, right: formView.rightAnchor, paddingTop: 10, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: 76)
        
        
        
        
        
        formView.addSubview(signupButton)
        signupButton.anchor(top: repeatPasswordStackView.bottomAnchor, left: formView.leftAnchor, bottom: nil, right: formView.rightAnchor, paddingTop: 20, paddingLeft: 50, paddingBottom: 0, paddingRight: 50, width: 0, height: 55)
        
        setupNotificationObservers()
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
    
    fileprivate func setupNotificationObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc fileprivate func handleKeyboardShow(notification: Notification) {
        guard let value = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        let keyboardFrame = value.cgRectValue
        let bottomSpace = view.frame.height - signupButton.frame.origin.y - signupButton.frame.height
        
        print(signupButton.frame.height)
        print("\(bottomSpace) BottomSpace")
        let difference =  bottomSpace - keyboardFrame.height
        print(difference)
        self.view.transform = CGAffineTransform(translationX: 0, y:  -difference - 8)
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
    
    @objc fileprivate func handleKeyboardHide() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.view.transform = .identity
        }, completion: nil)

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }

}
