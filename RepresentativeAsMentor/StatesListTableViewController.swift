//
//  StatesListTableViewController.swift
//  RepresentativeAsMentor
//
//  Created by Jeff Norton on 10/17/16.
//  Copyright © 2016 JeffCryst. All rights reserved.
//

import UIKit

class StatesListTableViewController: UITableViewController {
    
    //==================================================
    // MARK: - General
    //==================================================

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    //==================================================
    // MARK: - Table view data source
    //==================================================

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return States.all.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "stateListCell", for: indexPath)

        let state = States.all[indexPath.row]
        
        cell.textLabel?.text = state

        return cell
    }
    
    //==================================================
    // MARK: - Navigation
    //==================================================

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // How are we getting there?
        if segue.identifier == "listToDetailSegue" {
            
            // Where are we going?
            if let stateDetailTableViewController = segue.destination as? StateDetailTableViewController,
                let indexPath = tableView.indexPathForSelectedRow {
                
                
                // What do we need to pack?
                let state = States.all[indexPath.row]
                
                
                // Are we finished packing?
                stateDetailTableViewController.state = state
            }
        }
    }
    

}
