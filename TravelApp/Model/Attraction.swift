//
//  Attraction.swift
//  TravelApp
//
//  Created by Sagar on 17/3/19.
//  Copyright © 2019 Sagar. All rights reserved.
//

import Foundation


struct Attraction: Decodable {
    let name: String
    let attractionId: String
    let imageUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case attractionId = "id"
        case imageUrl = "url"
    }
    
}


struct AttractionResult: Decodable {
    let data: [String: [Attraction]]
    
    enum CodingKeys: String, CodingKey {
        case data
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        data = try container.decode([String: [Attraction]].self, forKey: .data)
        
    }
}
