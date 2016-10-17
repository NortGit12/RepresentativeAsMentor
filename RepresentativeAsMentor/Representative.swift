//
//  Representative.swift
//  RepresentativeAsMentor
//
//  Created by Jeff Norton on 10/17/16.
//  Copyright © 2016 JeffCryst. All rights reserved.
//

import Foundation

class Representative {
    
    //==================================================
    // MARK: - Properties
    //==================================================
    
    private let keyName = "name"
    private let keyParty = "party"
    private let keyState = "state"
    private let keyDistrict = "district"
    private let keyPhone = "phone"
    private let keyOffice = "office"
    private let keyLink = "link"
    
    let name: String
    let party: String
    let state: String
    let district: String
    let phone: String
    let office: String
    let link: String
    
    //==================================================
    // MARK: - Initializers
    //==================================================
    
    init?(dictionary: [String : Any]) {
        
        guard let name = dictionary[keyName] as? String,
            let party = dictionary[keyParty] as? String,
            let state = dictionary[keyState] as? String,
            let district = dictionary[keyDistrict] as? String,
            let phone = dictionary[keyPhone] as? String,
            let office = dictionary[keyOffice] as? String,
            let link = dictionary[keyLink] as? String else { return nil }
        
        self.name = name
        self.party = party
        self.state = state
        self.district = district
        self.phone = phone
        self.office = office
        self.link = link
    }
}
