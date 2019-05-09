//
//  City.swift
//  TravelApp
//
//  Created by Sagar on 23/2/19.
//  Copyright © 2019 Sagar. All rights reserved.
//

import Foundation


struct City: Codable  {
    let name: String
    let imageURL : String?
    let cityId: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case imageURL = "url"
        case cityId = "id"
    }
    
    
}

struct CityResult {
    let statusCode : Int
    let server_timestamp: String
    let data : [String: [City]]
    
}


extension CityResult: Codable {
    enum CodingKeys: String, CodingKey {
        case data
        case statusCode = "status_code"
        case server_timestamp
    }
  
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
         statusCode = try container.decode(Int.self, forKey: .statusCode)
         server_timestamp = try container.decode(String.self, forKey: .server_timestamp)
         data =  try container.decode([String:[City]].self, forKey: .data)

    }
    
    
    func encode(to encoder: Encoder) throws {
        var container =  encoder.container(keyedBy: CodingKeys.self)
        try container.encode(data, forKey: .data)

    }

    
}

