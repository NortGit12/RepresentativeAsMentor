//
//  StateDetailTableViewController.swift
//  RepresentativeAsMentor
//
//  Created by Jeff Norton on 10/17/16.
//  Copyright © 2016 JeffCryst. All rights reserved.
//

import UIKit

class StateDetailTableViewController: UITableViewController {
    
    //==================================================
    // MARK: - Properties
    //==================================================
    
    var state: String?
    var representatives: [Representative] = []
    
    //==================================================
    // MARK: - General
    //==================================================

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        if let state = state {
            
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
            
            RepresentativeController.searchRepresentatives(forState: state) { (representatives) in
                
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
                
                if let representatives = representatives {
                
                    self.representatives = representatives
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    //==================================================
    // MARK: - Table view data source
    //==================================================

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return representatives.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "stateDetailCell", for: indexPath) as? StateDetailTableViewCell else { return UITableViewCell() }

        let representative = representatives[indexPath.row]
        cell.representative = representative

        return cell
    }
    
    //==================================================
    // MARK: - Navigation
    //==================================================

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
    }
}
