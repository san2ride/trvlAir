//
//  TripsTableViewController.swift
//  trvlAir
//
//  Created by don't touch me on 8/5/16.
//  Copyright © 2016 trvl, LLC. All rights reserved.
//

import UIKit

class TripsTableViewController: UITableViewController {
    let kAirport = "kAirport"
    var currentAirport: Airport?
    var airportsArray = [Airport]()

    @IBAction func toggleEditingMode(sender: AnyObject) {
        
        // If you're currently in editing mode...
        if isEditing {
            // Chane text of button to inform user of state
            sender.setTitle("Edit", for: .normal)
            
            // Turn off editing mode
            setEditing(false, animated: true)
        }
        else {
            // Change text of button to inform user of state
            sender.setTitle("Done", for: .normal)
            
            // Enter editing mode
            setEditing(true, animated: true)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.airportsArray = DataStore.sharedInstance.airportArray
        tableView.reloadData()
        
        
    }
    func reloadData() {
        self.airportsArray = DataStore.sharedInstance.airportArray
        
        reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.airportsArray.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! AirportCodeTableViewCell
        
        currentAirport = DataStore.sharedInstance.airportArray[indexPath.row]
        
        cell.airportNameLabel.text = self.currentAirport?.name
        cell.airportCodeLabel.text = self.currentAirport?.iata
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.currentAirport = self.airportsArray[(indexPath as NSIndexPath).row]
        self.performSegue(withIdentifier: "AirportSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let controller = segue.destination as? AirportViewController
        
        controller?.theAirport = self.currentAirport
    }
    

    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {

            self.airportsArray.remove(at: (indexPath as NSIndexPath).row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)        
    }
    
}
