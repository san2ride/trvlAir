//
//  AirportDataTableViewController.swift
//  trvlAir
//
//  Created by don't touch me on 3/14/17.
//  Copyright © 2017 trvl, LLC. All rights reserved.
//

import UIKit

class AirportDataTableViewController: UITableViewController {
    
    
    
    
    let APIC = APIController()
    var airportsArray = [Airport]()
    var theAirport: Airport?

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }
    
    



    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = ["Cell0", "Cell1", "Cell2", "Cell3", "Cell4"]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier", for: indexPath) as! AirportDataTableViewCell
        
        self.theAirport = DataStore.sharedInstance.airportArray[(indexPath as NSIndexPath).row]
        
        
            cell.nameDataLabel.text = theAirport?.name
            cell.cityDataLabel.text = theAirport?.city
            cell.iataDataLabel.text = theAirport?.iata
            cell.elevationDataLabel.text = theAirport?.elevation
            cell.websiteDataLabel.text = theAirport?.website
        
        return cell
        
    }
}





//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//}
