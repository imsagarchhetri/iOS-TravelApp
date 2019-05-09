//
//  APIRouter.swift
//  TravelApp
//
//  Created by Sagar on 25/2/19.
//  Copyright © 2019 Sagar. All rights reserved.
//

import Alamofire


enum APIRouter: URLRequestConvertible {
    case popularCities
    case destinationDetails(cityIds: String)
    case attractions(parentId: String)
    case query(destination: String)
    case media(id: String)
    
    // MARK:- HTTPMethod
    private var method: HTTPMethod {
        switch self {
        case .popularCities:
            return .get
        case .destinationDetails:
            return .get
        case .attractions:
            return .get
        case .query:
            return .get
        case .media:
            return .get
        }
        
        
    }
    
    // MARK:- Path
    private var path: String {
        switch self {
        case .popularCities:
            return "places/list"
        case .destinationDetails:
            return "places"
        case .attractions:
            return "places/list"
        case .query:
            return "places/list"
        case .media(let id):
            return "places/\(id)/media"
        }
    }
    
    //MARK:- Parameters
    private var parameters: Parameters? {
        switch self {
        case .popularCities:
            return ["limit": "10", "level": "city", "rating" : "10:","categories": "sightseeing|hiking"]
        case .destinationDetails(let cityIds):
            return ["ids" : cityIds]
        case .attractions(let parentId):
            return ["parent": parentId, "level": "poi"]
        case .query(let destination):
            return ["query": destination]
        case .media(_):
            return nil
        }
    }
    
    //MARK:- URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let url = try Contants.baseURL.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        //HTTP Method
        urlRequest.httpMethod = method.rawValue
        
        //Common Headers
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        urlRequest.addValue(Contants.APIHeaderToken.key, forHTTPHeaderField: HTTPHeaderField.apiKey.rawValue)
        
        //Parameters
        if let parameters = parameters {
        
                if var urlComponents = URLComponents(url: url.appendingPathComponent(path),
                                                     resolvingAgainstBaseURL: false), !parameters.isEmpty {
                    
                    urlComponents.queryItems = [URLQueryItem]()
                    //urlComponents.percentEncodedQuery = urlComponents.percentEncodedQuery?.replacingOccurrences(of: "%253A", with: ":")
                    for (key,value) in parameters {
                        
                        let queryItem = URLQueryItem(name: key,
                                                     value: "\(value)")
                    
                        urlComponents.queryItems?.append(queryItem)
                    }
                   
                   // urlComponents.percentEncodedQuery = urlComponents.percentEncodedQuery?.addingPercentEncoding(withAllowedCharacters: CharacterSet.init(charactersIn: ":"))
                    urlRequest.url = urlComponents.url
                
                    
              
            }
        }
        print("URL REQUEST", urlRequest)
        return urlRequest
    }
    
    
    
}
