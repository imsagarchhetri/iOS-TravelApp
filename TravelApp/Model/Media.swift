//
//  Media.swift
//  TravelApp
//
//  Created by Sagar on 7/4/19.
//  Copyright © 2019 Sagar. All rights reserved.
//

import Foundation


struct Media : Decodable {
    let id: String
    let url: String
    
}

struct MediaResult: Decodable  {
    let data: [String: [Media]]
    
    enum CodingKeys: String, CodingKey {
        case data
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        data = try container.decode([String: [Media]].self, forKey: .data)
        
    }
}
