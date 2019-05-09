//
//  SearchViewController.swift
//  TravelApp
//
//  Created by Sagar on 6/4/19.
//  Copyright © 2019 Sagar. All rights reserved.
//

import UIKit

class SearchViewController : UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var searchedString: String?
    var searchResults: [Destination] = [Destination]()
    
    override func viewDidLoad() {
            collectionView.backgroundColor = UIColor.rgb(red: 251, green: 251, blue: 251, alpha: 1)
        collectionView.register(SearchCell.self, forCellWithReuseIdentifier: "cellID")
        collectionView.register(SearchHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "headerId")
        
        
        
        APIClient.getQuery(destination: searchedString ?? "") { (result) in
            for search in result["places"] as! [Search] {
                APIClient.getCityDetails(cityIDs: search.id, completion: { (result) in
                    for destination in result["places"] as! [Destination]  {
                        let destination = Destination.init(id: destination.id, name: destination.name, nameSuffix: destination.nameSuffix, description: destination.description, media: destination.media)
                        self.searchResults.append(destination)
                        
                        DispatchQueue.main.async {
                            self.collectionView.reloadData()
                        }
                    }
                })
            }
        }
    }
    
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchResults.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath) as! SearchCell
        cell.layer.cornerRadius = 16
         cell.layer.masksToBounds = true
         cell.search = searchResults[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 30, height: 350)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 32
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 32, left: 0, bottom: 32, right: 0)
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headerId", for: indexPath) as! SearchHeader
        header.delegate = self
        header.searchLabel.text = searchedString
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width - 64, height: 70)
    }
    
    
    var destinationVC : DestinationViewController!
    var topConstraint: NSLayoutConstraint?
    var leadingConstraint: NSLayoutConstraint?
    var widthConstraint: NSLayoutConstraint?
    var heightConstraint: NSLayoutConstraint?
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let destinationVC = DestinationViewController()
        let destinationView = destinationVC.view!
        //let searchResultAtIndexPath = self.searchResults[indexPath.row]
        destinationVC.destination = self.searchResults[indexPath.row]

        let redView = destinationView
        view.addSubview(redView)

        redView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleRemoveRedView)))

        addChild(destinationVC)
        self.destinationVC = destinationVC
        
        guard let cell = collectionView.cellForItem(at: indexPath) else { return }
        
        //absolute coordinate of cell
        guard let startingFrame = cell.superview?.convert(cell.frame, to: nil) else { return }
        self.startingFrame = startingFrame
        //redView.frame = startingFrame
        
        redView.translatesAutoresizingMaskIntoConstraints = false
        self.topConstraint = redView.topAnchor.constraint(equalTo: view.topAnchor, constant: startingFrame.origin.y)
        self.leadingConstraint = redView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: startingFrame.origin.x)
        self.widthConstraint = redView.widthAnchor.constraint(equalToConstant: startingFrame.width)
        self.heightConstraint = redView.heightAnchor.constraint(equalToConstant: startingFrame.height)
        
        [topConstraint, leadingConstraint, widthConstraint, heightConstraint].forEach({$0?.isActive = true})
        self.view.layoutIfNeeded()

        
        redView.layer.cornerRadius = 16
        
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseOut, animations: {
            self.topConstraint?.constant = 0
            self.leadingConstraint?.constant = 0
            self.widthConstraint?.constant = self.view.frame.width
            self.heightConstraint?.constant = self.view.frame.height
            
            
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        
    }
    
    var startingFrame: CGRect?
    @objc func handleRemoveRedView(gesture: UITapGestureRecognizer) {
        //self.view.layoutIfNeeded()
        

        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseOut, animations: {
            self.destinationVC.scrollView.contentOffset = .zero

            //redView.frame = self.view.frame
            
            
            guard let startingFrame = self.startingFrame else { return }
            
            self.topConstraint?.constant = startingFrame.origin.y
            self.leadingConstraint?.constant = startingFrame.origin.x
            self.widthConstraint?.constant = startingFrame.width 
            self.heightConstraint?.constant = startingFrame.height
            
            self.view.layoutIfNeeded()

        }, completion: { _ in
            
            gesture.view?.removeFromSuperview()
            self.destinationVC.removeFromParent()
        })
    }
    
    
}




extension SearchViewController : searchDelegate {
    func cancelCurrentViewController() {
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
}
