//
//  APIClient.swift
//  TravelApp
//
//  Created by Sagar on 25/2/19.
//  Copyright © 2019 Sagar. All rights reserved.
//

import Alamofire

class APIClient {

    static func getPopularCities(completion: @escaping([String: Any?]) -> Void) {
        
            Alamofire.request(APIRouter.popularCities).responseJSON { (response) in


                if response.result.isSuccess {
                   do {
                        if let responseObj = response.value as? [String: Any] {
                            let resultArray = self.parseJSON(placesData: responseObj) as? CityResult
                            if let cityArray = resultArray {
                                print(cityArray.data)
                                completion(cityArray.data)
                            }
                        }
                    
                    }
                }
     
                if response.result.isFailure {
                    let error : Error = response.result.error!
                    completion(error as! [String : Any?])
                }
            }
    
    }
    
    static func getCityDetails(cityIDs: String, completion: @escaping([String: Any?]) -> Void) {
        Alamofire.request(APIRouter.destinationDetails(cityIds: cityIDs)).responseJSON { (response) in
            
            
            if response.result.isSuccess {
                do {
                    if let responseObj = response.value as? [String: Any?] {
                        let data = try JSONSerialization.data(withJSONObject: responseObj, options: .prettyPrinted)
                        let decodedData = try JSONDecoder().decode(DestinationResult.self, from: data)
                        print(decodedData)
                        completion(decodedData.data)
                    }
                    
                } catch {
                    print("Error while decoding: \(error)")
                }
            }
            
            if response.result.isFailure {
                let error : Error = response.result.error!
                print(error)
            }
        }
    }
    
    static func getAttractions(parentId: String, completion: @escaping([String: Any?]) -> Void) {
        Alamofire.request(APIRouter.attractions(parentId: parentId)).responseJSON { (response) in
           
            if response.result.isSuccess {
                do {
                    if let responseObj = response.value as? [String: Any?] {
                        print(responseObj)
                        let data = try JSONSerialization.data(withJSONObject: responseObj, options: .prettyPrinted)
                        let decodedData = try JSONDecoder().decode(AttractionResult.self, from: data)
                        completion(decodedData.data)
                    }
                    
                } catch {
                    print("Error while decoding: \(error)")
                }
            }
            
            if response.result.isFailure {
                let error : Error = response.result.error!
                print(error)
            }
        }
    }
    
    static func getQuery(destination: String, completion: @escaping([String: Any?]) -> Void) {
        Alamofire.request(APIRouter.query(destination: destination)).responseJSON { (response) in
            if response.result.isSuccess {
                do {
                    if let responseObj = response.value as? [String: Any?] {
                        print(responseObj)
                        let data = try JSONSerialization.data(withJSONObject: responseObj, options: .prettyPrinted)
                        let decodedData = try JSONDecoder().decode(SearchResult.self, from: data)
                        completion(decodedData.data)
                    }
                    
                } catch {
                    print("Error while decoding: \(error)")
                }
            }
            
            if response.result.isFailure {
                let error : Error = response.result.error!
                print(error)
            }
        }
    }
    
    static func getMedia(id: String, completion: @escaping([String: Any?]) -> Void) {
        Alamofire.request(APIRouter.media(id: id)).responseJSON { (response) in
            if response.result.isSuccess {
                do {
                    if let responseObj = response.value as? [String: Any?] {
                        print(responseObj)
                        let data = try JSONSerialization.data(withJSONObject: responseObj, options: .prettyPrinted)
                        let decodedData = try JSONDecoder().decode(DestinationResult.self, from: data)
                        completion(decodedData.data)
                    }
                    
                } catch {
                    print("Error while decoding: \(error)")
                }
            }
            
            if response.result.isFailure {
                let error : Error = response.result.error!
                print(error)
            }
        }

    }
    
  private static func parseJSON(placesData: [String: Any]) -> CityResult {
    var city: CityResult?
            do {
                let data = try JSONSerialization.data(withJSONObject: placesData, options: .prettyPrinted)
                let decodedData = try JSONDecoder().decode(CityResult.self, from: data) as CityResult
                city = decodedData
            } catch {
                print(error)
            
    }
    return city!

    }
}




