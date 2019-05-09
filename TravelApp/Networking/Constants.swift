//
//  Constants.swift
//  TravelApp
//
//  Created by Sagar on 25/2/19.
//  Copyright © 2019 Sagar. All rights reserved.
//

import Foundation

struct Contants {
    static let baseURL = "https://api.sygictravelapi.com/1.1/en/"
    
    struct APIHeaderToken {
        static let key = "37ThtRfFYU44y1x7QLGAm5XogMJokb9KLGnkIxp3"
    }
}

enum HTTPHeaderField: String {
    case contentType = "Content-Type"
    case apiKey = "x-api-key"
}

enum ContentType: String {
    case json = "application/json"
}
