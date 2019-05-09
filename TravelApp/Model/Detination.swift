//
//  Detination.swift
//  TravelApp
//
//  Created by Sagar on 26/2/19.
//  Copyright © 2019 Sagar. All rights reserved.
//

import Foundation



struct Destination: Decodable {
    
    struct Description: Decodable {
        let text: String
        let link: String?

    }
    
    struct MediaResult: Decodable {
        let media: [Media]?
        
    }
    
    struct Media: Decodable {
        let url: String
    }
    
    let id: String
    let name: String
    let nameSuffix: String
    let description: Description?
    let media: MediaResult?
    

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case nameSuffix = "name_suffix"
        case description
        case media = "main_media"
    }
    
}

struct DestinationResult: Decodable {
    let data: [String: [Destination]]
    let statusCode : Int
    let server_timestamp: String
    
    enum CodingKeys: String, CodingKey {
        case data
        case statusCode = "status_code"
        case server_timestamp
    }
    
    init(from decoder:Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        statusCode = try container.decode(Int.self, forKey: .statusCode)
        server_timestamp = try container.decode(String.self, forKey: .server_timestamp)
        data = try container.decode([String: [Destination]].self, forKey: .data)
    }
}
