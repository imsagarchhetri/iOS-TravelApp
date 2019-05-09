//
//  DestinationViewController.swift
//  TravelApp
//
//  Created by Sagar on 18/2/19.
//  Copyright © 2019 Sagar. All" rights reserved.
//

import UIKit
import SDWebImage

class DestinationViewController: UIViewController, UIScrollViewDelegate {
    
    var destination: Destination? {
        didSet {
            nameLabel.text = destination?.name
            descriptionLabel.text = destination?.description?.text
            //mainImageView.sd_setImage(with: URL(string: destination?.media?.media?[0].url ?? ""), completed: nil)
            mainImageView.sd_setImage(with: URL(string: destination?.media?.media?[0].url ?? ""), placeholderImage: #imageLiteral(resourceName: "image_placeholder_png_698412"), options: [], completed: nil)
        }
    }
    
    var attractions: [Attraction] = [Attraction]()
    //var destination: [Destination] = [Destination]()
    
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
        view.image = #imageLiteral(resourceName: "hong_kong")
        view.contentMode = .scaleAspectFill
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true
        return view
    }()
    
    let backButton: UIButton = {
       let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "Group").withRenderingMode(.alwaysOriginal), for: .normal)
        button.addTarget(self, action: #selector(handleBack), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
    
        return button
    }()
    
    @objc func handleBack() {
        print("Button Tap Tap")
        self.navigationController?.popViewController(animated: true)
    }
    
    
    let nameLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.appBoldFont(size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    
    
    
    
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
    
        let descriptionString = "Hong Kong is an autonomous territory, and former British colony, in southeastern China. Its vibrant, densely populated urban centre is a major port and global financial hub with a skyscraper-studded skyline. Central (the business district) features architectural landmarks like I.M. Pei’s Bank of China Tower. Hong Kong is also a major shopping destination, famed for bespoke tailors and Temple Street Night Market."
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 5
        let attString = NSMutableAttributedString(string: descriptionString)
        attString.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attString.length))
        //attString.addAttribute(.font, value: UIFont.appRegularFont(size: 13), range: NSMakeRange(0, attString.length))
        label.numberOfLines = 0
        label.attributedText = attString
        label.lineBreakMode = .byWordWrapping
            label.font = UIFont.appRegularFont(size: 13)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let attractionLabel: UILabel = {
        let label = UILabel()
        label.text = "Popular attractions"
        label.font = UIFont.appBoldFont(size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    var collectionView: UICollectionView!


    fileprivate func setupViews() {
        view.backgroundColor = .white
        
        scrollView.contentInset = UIEdgeInsets.zero
        scrollView.scrollIndicatorInsets = UIEdgeInsets.zero
        scrollView.contentInset = UIEdgeInsets.init(top: -20, left: 0, bottom: 0, right: 0)
        setupNavigationBar()
        scrollView.delegate = self
        
        
        extendedLayoutIncludesOpaqueBars = true
        view.addSubview(scrollView)
        scrollView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        scrollView.contentSize = CGSize(width: self.view.frame.width, height: self.view.frame.height + 350)
        
        scrollView.addSubview(container)
        container.anchor(top: scrollView.topAnchor, left: scrollView.leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: self.view.frame.width, height: 350)
        
        container.addSubview(mainImageView)
        mainImageView.anchor(top: container.topAnchor, left: container.leftAnchor, bottom: container.bottomAnchor, right: container.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        mainImageView.addSubview(backButton)
        backButton.anchor(top: mainImageView.topAnchor, left: mainImageView.leftAnchor, bottom: nil, right: nil, paddingTop: 35, paddingLeft: 15, paddingBottom: 0, paddingRight: 0, width: 25, height: 25)
        
        scrollView.addSubview(nameLabel)
        nameLabel.anchor(top: mainImageView.bottomAnchor, left: mainImageView.leftAnchor, bottom: nil, right: mainImageView.rightAnchor , paddingTop: 15, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: 20)
        
        scrollView.addSubview(descriptionLabel)
        descriptionLabel.anchor(top: nameLabel.bottomAnchor, left: mainImageView.leftAnchor, bottom: nil, right: mainImageView.rightAnchor , paddingTop:10, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: 0)
        
        scrollView.addSubview(attractionLabel)
        attractionLabel.anchor(top: descriptionLabel.bottomAnchor, left: mainImageView.leftAnchor, bottom: nil, right: mainImageView.rightAnchor , paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: 0)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(AttractionViewCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isPagingEnabled = true
        collectionView.backgroundColor = .white
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 10)
        //collectionView.register(self, forCellWithReuseIdentifier: "cellId")
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.addSubview(collectionView)
        collectionView.anchor(top: attractionLabel.bottomAnchor, left: container.leftAnchor, bottom: nil, right: container.rightAnchor, paddingTop: 5, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 230)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setupViews()
        
        getAttractionsFromServer()
    }
    
    
    fileprivate func getAttractionsFromServer() {
        APIClient.getAttractions(parentId: destination?.id ?? "") { (result) in
            var ids = [String]()
            for attraction in result["places"] as! [Any] {
                self.attractions.append(attraction as! Attraction)
            }
            
            for attraction in self.attractions {
                ids.append(attraction.attractionId)
            }
            
            let attractionId = ids.joined(separator: "|")
            APIClient.getCityDetails(cityIDs: attractionId) { (response) in
            self.attractions = [Attraction]()

            let attractionArray = response["places"] as! [Destination]
            for attraction in attractionArray {
                //                    let city = City(name: destination.name, imageURL: destination.media?.media?[0].url, cityId: destination.id)

                let attraction = Attraction(name: attraction.name, attractionId: attraction.id, imageUrl: attraction.media?.media?[0].url)
                self.attractions.append(attraction)

            }
            DispatchQueue.main.async {

                self.collectionView.reloadData()
            }
            
        }
        }
    }
    
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let contentOffsetY = scrollView.contentOffset.y
        let contentOffsetX = scrollView.contentOffset.x

        //print("Content offset:", contentOffsetY)
        let height = container.frame.height  - contentOffsetY
        //print("Height:", height)
        self.navigationController?.navigationBar.alpha = 1


        if contentOffsetY > 0 {
            let offset = contentOffsetY / 310
            //print("Image Offset:", offset)
        
            
            
            if height < 60 {
                let color = UIColor(red: 1, green: 1, blue: 1, alpha: offset)

                UIView.animate(withDuration: 0.2) {
                    self.navigationController?.navigationBar.isHidden = false
                    self.navigationController?.view.backgroundColor = UIColor.rgb(red: 234, green: 234, blue: 234, alpha: 1)


                    
                    self.navigationController?.navigationBar.isTranslucent = false
                    self.navigationController?.navigationBar.topItem?.title = self.destination?.name
                }
                
                    self.navigationController?.navigationBar.alpha = offset
                                  self.navigationController?.navigationBar.barTintColor = color
                                  self.navigationController?.navigationBar.backgroundColor = color
            
                
               
              
               
               // print("Reached")

                return
                
            }
            else {
                self.navigationController?.navigationBar.isHidden = true
                return
            }
            
        }
        
        let minimumHeight = min(height, 375)

        mainImageView.frame = CGRect(x: 0, y: contentOffsetY, width: container.frame.width, height: minimumHeight)
        
        
        view.superview?.layoutIfNeeded()
    }
    
//    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
//        let layout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
//        let cellWidthIncludingSpacing = layout.itemSize.width + layout.minimumLineSpacing
//
//        var offset = targetContentOffset.pointee
//        let index = (offset.x + scrollView.contentInset.left) / cellWidthIncludingSpacing
//        let roundIndex = round(index)
//
//        offset = CGPoint(x: roundIndex * cellWidthIncludingSpacing - scrollView.contentInset.left, y: -scrollView.contentInset.top)
//        targetContentOffset.pointee = offset
//    }
    
  
    
    
    

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

extension DestinationViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return attractions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! AttractionViewCell
        cell.nameLabel.text = attractions[indexPath.row].name
        cell.imageView.sd_setImage(with: URL(string: attractions[indexPath.row].imageUrl!), completed: nil)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = 160
        let height = 200
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 11
    }
    
    
}
