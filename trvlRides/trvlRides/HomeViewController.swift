//
//  HomeViewController.swift
//  trvlRides
//
//  Created by don't touch me on 8/2/16.
//  Copyright © 2016 trvl, LLC. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var airportCodeText: UITextField!
    
    
    var APIC = APIController()

    override func viewDidLoad() {
        super.viewDidLoad()

     
                
    }
    
    @IBAction func searchAirportPressed(sender: UIButton) {
        
        if let destination = airportCodeText.text {
            
            APIC.retrieveCode(destination)
            print(destination)
        }
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        self.airportCodeText.resignFirstResponder()
        return true
    }

    
    
    
        
}
