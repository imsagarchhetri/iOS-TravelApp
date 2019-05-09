//
//  HomeHeader.swift
//  TravelApp
//
//  Created by Sagar on 17/2/19.
//  Copyright © 2019 Sagar. All rights reserved.
//

import UIKit

protocol HomeHeaderProtocol {
    func pushHotelController()
}


class HomeHeader: UICollectionViewCell, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    var navigationtoSearch: PresentNavigation?
    var delegate: HomeHeaderProtocol?

    
    let greetingLabel: UILabel = {
        let label = UILabel()
        let attributedLabel = NSMutableAttributedString.init(string: "Howdy, ", attributes: [NSAttributedString.Key.font: UIFont.appRegularFont(size: 13)])
        attributedLabel.append(NSAttributedString.init(string: "Sagar", attributes: [NSAttributedString.Key.font: UIFont.appRegularFont(size: 14)]))
        label.attributedText = attributedLabel
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let locationLabel: UILabel = {
        let label = UILabel()
        let attributedLabel = NSMutableAttributedString.init(string: "You are in ", attributes: [NSAttributedString.Key.font: UIFont.appRegularFont(size: 13)])
        attributedLabel.append(NSAttributedString.init(string: "Sydney, Australia", attributes: [NSAttributedString.Key.font: UIFont.appRegularFont(size: 13), NSAttributedString.Key.foregroundColor: UIColor.rgb(red: 32, green: 49, blue: 82, alpha: 1)]))
        label.attributedText = attributedLabel
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let heroImageView: UIImageView  = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = #imageLiteral(resourceName: "bg1")
        iv.contentMode = .scaleAspectFill
        iv.isUserInteractionEnabled = true
        return iv
    }()
    
    let searchTextField : CustomTextField = {
        let tf = CustomTextField(padding: 40)
        tf.leftViewMode = .always
        let imageView = UIImageView(frame: CGRect(x: 15, y: 0, width: 16, height: 16))
        imageView.image = #imageLiteral(resourceName: "search")
        tf.leftView = imageView
        tf.layer.cornerRadius = 15
        tf.returnKeyType = .search
        
        tf.attributedPlaceholder = NSAttributedString.init(string: "Search for a destination", attributes: [NSAttributedString.Key.font: UIFont.appRegularFont(size: 15), NSAttributedString.Key.foregroundColor: UIColor.rgb(red: 124, green: 134, blue: 152, alpha: 1)])
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.borderStyle = .roundedRect
        tf.autocapitalizationType = .none
        return tf
    }()
    
    let exploreLabel: UILabel = {
        let label = UILabel()
        label.text = "Explore"
        label.font = UIFont.appBoldFont(size: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let popularLabel: UILabel = {
        let label = UILabel()
        label.text = "Popular Destination"
        label.font = UIFont.appBoldFont(size: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let hotelView : UIView = {
        let view = UIView()
        view.layer.cornerRadius = 4
        view.backgroundColor = .white
        view.layer.shadowColor = UIColor.rgb(red: 93, green: 93, blue: 96, alpha: 0.6).cgColor
        view.layer.shadowOpacity = 0.3
        view.layer.shadowRadius = 3
        view.layer.shadowOffset = CGSize(width: 1, height: 2)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let hotelIconLabel: UILabel = {
        let label = UILabel()
        label.text = "Hotels"
        label.font = UIFont.appRegularFont(size: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var hotelButton: UIButton = {
       let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "Fill 260"), for: .normal)
        button.addTarget(self, action: #selector(showHotelController), for: .touchUpInside)
    
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let restaurantIconLabel: UILabel = {
        let label = UILabel()
        label.text = "Restaurants"
        label.font = UIFont.appRegularFont(size: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let restaurantButton: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "Fill 188"), for: .normal)
        button.tintColor = UIColor.rgb(red: 86, green: 128, blue: 250, alpha: 1)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let hotelView1 : UIView = {
        let view = UIView()
        view.layer.cornerRadius = 4
        view.backgroundColor = .white
        view.layer.shadowColor = UIColor.rgb(red: 93, green: 93, blue: 96, alpha: 0.6).cgColor
        view.layer.shadowOpacity = 0.3
        view.layer.shadowRadius = 3
        view.layer.shadowOffset = CGSize(width: 1, height: 2)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    let destinationIconLabel: UILabel = {
        let label = UILabel()
        label.text = "Destinations"
        label.font = UIFont.appRegularFont(size: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let destinationButton: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "Fill 244"), for: .normal)
        button.tintColor = UIColor.rgb(red: 86, green: 128, blue: 250, alpha: 1)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    let hotelView3 : UIView = {
        let view = UIView()
        view.layer.cornerRadius = 4
        view.backgroundColor = .white
        view.layer.shadowColor = UIColor.rgb(red: 93, green: 93, blue: 96, alpha: 0.6).cgColor
        view.layer.shadowOpacity = 0.3
        view.layer.shadowRadius = 3
        view.layer.shadowOffset = CGSize(width: 1, height: 2)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let hotelView4 : UIView = {
        let view = UIView()
        view.layer.cornerRadius = 4
        view.backgroundColor = .white
        view.layer.shadowColor = UIColor.rgb(red: 93, green: 93, blue: 96, alpha: 0.6).cgColor
        view.layer.shadowOpacity = 0.3
        view.layer.shadowRadius = 3
        view.layer.shadowOffset = CGSize(width: 1, height: 2)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let hotelView5 : UIView = {
        let view = UIView()
        view.layer.cornerRadius = 4
        view.backgroundColor = .white
        view.layer.shadowColor = UIColor.rgb(red: 93, green: 93, blue: 96, alpha: 0.6).cgColor
        view.layer.shadowOpacity = 0.3
        view.layer.shadowRadius = 3
        view.layer.shadowOffset = CGSize(width: 1, height: 2)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let icon: UIImageView = {
       let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "garage").withRenderingMode(.alwaysOriginal)
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    
    
    let cellId = "cellId"
    
    var collectionView: UICollectionView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        heroImageView.frame.origin.y = -UIApplication.shared.statusBarFrame.origin.y
//        let greetingStackView = UIStackView(arrangedSubviews: [greetingLabel, locationLabel])
//        addSubview(greetingStackView)
//        greetingStackView.axis = .vertical
//        greetingStackView.spacing = 4
//        greetingStackView.distribution = .fillEqually
//        greetingStackView.translatesAutoresizingMaskIntoConstraints = false
//
//        addSubview(heroImageView)
//
//        greetingStackView.anchor(top: safeAreaLayoutGuide.topAnchor, left: leftAnchor, bottom: nil, right: profileImageView.leftAnchor, paddingTop: 5, paddingLeft: 20, paddingBottom: 0, paddingRight: 5, width: 0, height: 40)
//
//        profileImageView.anchor(top: nil, left: greetingStackView.rightAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 15, paddingBottom: 0, paddingRight: 15, width: 34, height: 34)
//        profileImageView.centerYAnchor.constraint(equalTo: greetingStackView.centerYAnchor).isActive = true
//        profileImageView.layer.cornerRadius = 17
//        profileImageView.layer.masksToBounds = true
       // backgroundColor = UIColor.rgb(red: 250, green: 250, blue: 250, alpha: 1)
        backgroundColor = .white
        addSubview(heroImageView)
        
        heroImageView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 10, paddingRight: 0, width: 0, height: 300)
        
        heroImageView.addSubview(searchTextField)
        searchTextField.delegate = self
        
        

        searchTextField.anchor(top: heroImageView.topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 55, paddingLeft: 25, paddingBottom: 0, paddingRight: 25, width: 0, height: 55)
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        hotelView.addSubview(hotelButton)
        hotelView.addSubview(hotelIconLabel)
        hotelButton.centerXAnchor.constraint(equalTo: hotelView.centerXAnchor).isActive = true
        hotelIconLabel.centerXAnchor.constraint(equalTo: hotelView.centerXAnchor).isActive = true
        hotelButton.anchor(top: hotelView.topAnchor, left: nil, bottom: nil, right: nil, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 18, height: 36)
        hotelIconLabel.anchor(top: hotelButton.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 5, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        hotelView1.addSubview(restaurantButton)
        hotelView1.addSubview(restaurantIconLabel)
        restaurantButton.centerXAnchor.constraint(equalTo: hotelView1.centerXAnchor).isActive = true
        restaurantIconLabel.centerXAnchor.constraint(equalTo: hotelView1.centerXAnchor).isActive = true
        restaurantButton.anchor(top: hotelView1.topAnchor, left: nil, bottom: nil, right: nil, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 18, height: 36)
        restaurantIconLabel.anchor(top: restaurantButton.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 5, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        hotelView3.addSubview(destinationButton)
        hotelView3.addSubview(destinationIconLabel)
        destinationButton.centerXAnchor.constraint(equalTo: hotelView3.centerXAnchor).isActive = true
        destinationIconLabel.centerXAnchor.constraint(equalTo: hotelView3.centerXAnchor).isActive = true
        destinationButton.anchor(top: hotelView3.topAnchor, left: nil, bottom: nil, right: nil, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 18, height: 36)
        destinationIconLabel.anchor(top: destinationButton.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 5, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        
        let stackView1 = UIStackView(arrangedSubviews: [hotelView, hotelView1, hotelView3])
        stackView1.axis = .horizontal
        stackView1.distribution = .fillEqually
        stackView1.spacing = 10
        stackView1.translatesAutoresizingMaskIntoConstraints = false
        
        
        addSubview(stackView1)
        stackView1.anchor(top: heroImageView.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: -40, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 260, height: 80)
        stackView1.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
//        let stackView2 = UIStackView(arrangedSubviews: [hotelView4, hotelView5])
//        stackView2.axis = .horizontal
//        stackView2.distribution = .fillEqually
//        stackView2.spacing = 10
//        stackView2.translatesAutoresizingMaskIntoConstraints = false
//        addSubview(stackView2)
//
//        stackView2.anchor(top: stackView1.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 0, paddingBottom: 5, paddingRight: 0, width: 170, height: 80)
//        stackView2.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
//addSubview(exploreLabel)
//        exploreLabel.anchor(top: searchTextField.bottomAnchor, left: leftAnchor, bottom: collectionView.topAnchor, right: rightAnchor, paddingTop: 15, paddingLeft: 15, paddingBottom: 0, paddingRight: 15, width: 0, height: 0)
        

        addSubview(popularLabel)
        popularLabel.anchor(top: stackView1.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 15, paddingLeft: 15, paddingBottom: 0, paddingRight: 15, width: 0, height: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! exploreCollectionViewCell
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 100, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    

    
    
}

extension HomeHeader: UITextFieldDelegate {
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()

            if textField.text?.count != 0 {
                let searchString = textField.text?.lowercased()
                navigationtoSearch?.performSegueToSearch(withSearch: searchString ?? "")
            }
        
        return true
    }
    
    private func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.selectedTextRange = textField.textRange(from: textField.beginningOfDocument, to: textField.endOfDocument)


    }
}


extension HomeHeader {
    @objc func showHotelController() {
        delegate?.pushHotelController()
    }
}
