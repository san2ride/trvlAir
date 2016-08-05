//
//  AirportViewController.swift
//  trvlRides
//
//  Created by don't touch me on 8/4/16.
//  Copyright © 2016 trvl, LLC. All rights reserved.
//

import UIKit

protocol AirportDelegate: class {
    func passAirport(theAirport: Airport)
}

class AirportViewController: UIViewController, AirportDelegate {
    
    @IBOutlet weak var airportNameLabel: UILabel!
    @IBOutlet weak var airpotCityLabel: UILabel!
    @IBOutlet weak var airportCodeLabel: UILabel!
    @IBOutlet weak var airportElevationLabel: UILabel!
    @IBOutlet weak var airportWebsiteLabel: UILabel!
    
    let APIC = APIController()
    var theAirport: Airport?
    

    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.APIC.delegate = self
        
    }

    func passAirport(theAirport: Airport) {
        self.airportNameLabel.text = theAirport.name
        self.airpotCityLabel.text = theAirport.city
        self.airportCodeLabel.text = theAirport.iata
        self.airportElevationLabel.text = theAirport.elevation
        self.airportWebsiteLabel.text = theAirport.website
        
    }
    
    

}
