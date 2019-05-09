//
//  HomeController.swift
//  TravelApp
//
//  Created by Sagar on 16/2/19.
//  Copyright © 2019 Sagar. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation


class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var cityName = ""
    var locationManager = CLLocationManager()
    let authorizationStatus = CLLocationManager.authorizationStatus()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
        
        
        setupNavigationBar()
        collectionView.backgroundColor = .white
        if #available(iOS 11, *) {
            collectionView.contentInsetAdjustmentBehavior = .never
        }
        collectionView.register(HomeHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "headerId")
        collectionView.register(SubSectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "headerId1")
        collectionView.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: "cellId")
    
        
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        configureLocationServices()
        

        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.isHidden = true
    }
    
    
    
    fileprivate func setupNavigationBar() {
        let backImage = #imageLiteral(resourceName: "back_arrow").withRenderingMode(.alwaysOriginal)
        self.navigationController?.navigationBar.backIndicatorImage = backImage
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = backImage
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.isHidden = true
        UINavigationBar.appearance().isTranslucent = false
    }
    

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 380)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if indexPath.row == 0 {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headerId", for: indexPath) as! HomeHeader
            header.navigationtoSearch = self
            header.delegate = self
            return header
        } else {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headerId1", for: indexPath) as! SubSectionHeader
            return header

        }
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! HomeCollectionViewCell
        cell.pushDelegate = self
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width, height: 200)
    }
   
}


extension HomeController: PushNavigation {
   
    func performSegue(withDestination destination: Destination) {
        let destinationVC = DestinationViewController()
        destinationVC.destination = destination
        self.navigationController?.pushViewController(destinationVC, animated: true)

    }
    
    
   

    
}

extension HomeController: PresentNavigation {
    func performSegueToSearch(withSearch search: String) {
        let searchVC = SearchViewController(collectionViewLayout: UICollectionViewFlowLayout())
        searchVC.searchedString = search
        self.present(searchVC, animated: true, completion: nil)
    }
    
}

extension HomeController: CLLocationManagerDelegate {
    func configureLocationServices() {
        if authorizationStatus == .notDetermined {
            locationManager.requestAlwaysAuthorization()
            
        } else {
            return
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            print("User location is: ", location)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == CLAuthorizationStatus.denied {
            showLocationDisablePopUp()
        }
    }
    
    fileprivate func showLocationDisablePopUp() {
        let alertController = UIAlertController(title: "Background Location Access Disabled", message: "In order to retrieve restaurant near you we need your location", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        let openAction = UIAlertAction(title: "Open Settings", style: .default) { (action) in
            if let url = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
        alertController.addAction(openAction)
        self.present(alertController, animated: true, completion: nil)
        
        
    }
}

extension HomeController: HomeHeaderProtocol {
    func pushHotelController() {
        self.navigationController?.pushViewController(HotelController(collectionViewLayout: UICollectionViewFlowLayout()), animated: true)
    }
}
