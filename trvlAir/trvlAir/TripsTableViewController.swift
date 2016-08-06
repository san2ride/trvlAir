//
//  TripsTableViewController.swift
//  trvlAir
//
//  Created by don't touch me on 8/5/16.
//  Copyright © 2016 trvl, LLC. All rights reserved.
//

import UIKit

class TripsTableViewController: UITableViewController {

    var currentAirport: Airport?
    var airportsArray = [Airport]()
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        var APIC = APIController()
        self.airportsArray = DataStore.sharedInstance.airportArray
        tableView.reloadData()
        
        
    }
    func reloadData() {
        self.airportsArray = DataStore.sharedInstance.airportArray
        
        reloadData()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.airportsArray.count
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! AirportCodeTableViewCell
        
        self.currentAirport = DataStore.sharedInstance.airportArray[indexPath.row]
        
        cell.airportNameLabel.text = self.currentAirport?.name
        cell.airportCodeLabel.text = self.currentAirport?.iata
        
        return cell
        
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        self.currentAirport = self.airportsArray[indexPath.row]
        self.performSegueWithIdentifier("AirportSegue", sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let controller = segue.destinationViewController as? AirportViewController
        
        controller?.theAirport = self.currentAirport
    }

}
