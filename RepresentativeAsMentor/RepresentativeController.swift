//
//  RepresentativeController.swift
//  RepresentativeAsMentor
//
//  Created by Jeff Norton on 10/17/16.
//  Copyright © 2016 JeffCryst. All rights reserved.
//

import Foundation

class RepresentativeController {
    
    //==================================================
    // MARK: - Properties
    //==================================================
    
    static let baseURL = URL(string: "http://whoismyrepresentative.com/getall_reps_bystate.php")
    private static let keyState = "state"
    private static let keyOutput = "output"
    private static let keyResult = "results"
    
    //==================================================
    // MARK: - Methods
    //==================================================
    
    static func searchRepresentatives(forState state: String, completion: @escaping (_ representatives: [Representative]?) -> Void) {
        
        guard let url = self.baseURL else {
            NSLog("Error: Invalid URL")
            completion(nil)
            return
        }
        
        let urlParameters = [keyState : state, keyOutput: "json"]
        
        NetworkController.performRequest(for: url, httpMethod: .Get, urlParameters: urlParameters) { (data, error) in
            
            guard let data = data,
                let responseDataString = String(data: data, encoding: .utf8) else {
                    
                    NSLog("No data returned from network request.")
                    completion(nil)
                    return
            }
            
            guard let responseDictionary = (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)) as? [String : AnyObject]
                , let repDictionary = responseDictionary[keyResult] as? [[String : Any]]
                else {
                    
                    NSLog("Unable to serialize JSON. \nResponse: \(responseDataString)")
                    completion(nil)
                    return
            }
            
            let representatives = repDictionary.flatMap({ Representative(dictionary: $0) })
            completion(representatives)
        }
    }
}



















