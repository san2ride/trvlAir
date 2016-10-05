//
//  AirportViewController.swift
//  trvlAir
//
//  Created by don't touch me on 8/5/16.
//  Copyright © 2016 trvl, LLC. All rights reserved.
//

import UIKit

class AirportViewController: UIViewController {

    @IBOutlet weak var airportNameLabel: UILabel!
    @IBOutlet weak var airportCityLabel: UILabel!
    @IBOutlet weak var airportCodeLabel: UILabel!
    @IBOutlet weak var airportElevationLabel: UILabel!
    @IBOutlet weak var airportWebsiteLabel: UILabel!
    
    let APIC = APIController()
    var theAirport: Airport?
    var airportsArray = [Airport]()
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.airportNameLabel.text = theAirport?.name
        self.airportCityLabel.text = theAirport?.city
        self.airportCodeLabel.text = theAirport?.iata
        self.airportElevationLabel.text = theAirport?.elevation
        self.airportWebsiteLabel.text = theAirport?.website
        
        
    }
    
    @IBAction func airportButtonPressed(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "MapSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let controller = segue.destination as? MapViewController
        
        controller?.theAirportMap = self.theAirport
    }

}
