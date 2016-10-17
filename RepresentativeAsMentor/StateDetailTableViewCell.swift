//
//  StateDetailTableViewCell.swift
//  RepresentativeAsMentor
//
//  Created by Jeff Norton on 10/17/16.
//  Copyright © 2016 JeffCryst. All rights reserved.
//

import UIKit

class StateDetailTableViewCell: UITableViewCell {
    
    //==================================================
    // MARK: - Properties
    //==================================================
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var partyLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var districtLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var urlLabel: UILabel!
    
    var representative: Representative? {
        didSet {
            updateViews()
        }
    }
    
    //==================================================
    // MARK: - Methods
    //==================================================
    
    func updateViews() {
        
        nameLabel.text = representative?.name
        partyLabel.text = representative?.party
        stateLabel.text = representative?.state
        districtLabel.text = representative?.district
        phoneLabel.text = representative?.phone
        urlLabel.text = representative?.link
    }

}
