//
//  HomeCollectionViewCell.swift
//  TravelApp
//
//  Created by Sagar on 21/2/19.
//  Copyright © 2019 Sagar. All rights reserved.
//

import UIKit



class HomeCollectionViewCell: UICollectionViewCell, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
   
    var pushDelegate: PushNavigation?
    var destinationArr: [Destination]?
    
    var popularCities:[City] =  [City]()
    let collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.backgroundColor = .white
        collectionView.layer.cornerRadius = 4
        collectionView.layer.masksToBounds = true
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    

    //let networkManager: NetworkManager = NetworkManager()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        collectionView.register(PopularCollectionViewCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView.delegate = self
        collectionView.dataSource = self
       
        addSubview(collectionView)
        collectionView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 10)
        destinationArr = [Destination]()
        apiCall()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return popularCities.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! PopularCollectionViewCell
        cell.popularCity = popularCities[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 154, height: 190)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let destinationViewController = DestinationViewController()
        destinationViewController.destination = self.destinationArr?[indexPath.row]
        //let homeController = HomeController()
        //homeController.navigationController?.pushViewController(destinationViewController, animated: true)
        self.pushDelegate?.performSegue(withDestination: (self.destinationArr?[indexPath.row])!)
    }
    
    
    fileprivate func apiCall() {
        APIClient.getPopularCities { (result) in
            var ids = [String]()
            let cityArray = result["places"] as! [City]
            for city in cityArray {
                ids.append(city.cityId)
            }
            
            let cityIds = ids.joined(separator: "|")
            APIClient.getCityDetails(cityIDs: cityIds) { (response) in
                let destinationArray = response["places"] as! [Destination]
                for destination in destinationArray {
                    let city = City(name: destination.name, imageURL: destination.media?.media?[0].url, cityId: destination.id)
                    self.popularCities.append(city)
                    self.destinationArr?.append(destination)
                    
                }
                DispatchQueue.main.async {
                    self.collectionView.reloadData()

                }
            }
        }
    }
 
    
}
