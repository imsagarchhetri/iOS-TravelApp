//
//  PushNavigationProtocol.swift
//  TravelApp
//
//  Created by Sagar on 6/4/19.
//  Copyright © 2019 Sagar. All rights reserved.
//

import UIKit

protocol PushNavigation {
    func performSegue(withDestination destination: Destination )
    
}

protocol PresentNavigation {
    func performSegueToSearch(withSearch search: String)

}



