//
//  Search.swift
//  TravelApp
//
//  Created by Sagar on 6/4/19.
//  Copyright © 2019 Sagar. All rights reserved.
//

import Foundation

struct Search : Decodable {
    let id: String
    let name: String
    let name_suffix: String
    let url: String?
    
}


struct SearchResult: Decodable  {
    let data: [String: [Search]]
    
    enum CodingKeys: String, CodingKey {
        case data
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        data = try container.decode([String: [Search]].self, forKey: .data)
        
    }
}
