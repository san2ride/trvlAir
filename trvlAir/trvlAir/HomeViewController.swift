//
//  HomeViewController.swift
//  trvlAir
//
//  Created by don't touch me on 8/5/16.
//  Copyright © 2016 trvl, LLC. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var airportCodeText: UITextField!
    
    var APIC = APIController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        self.airportCodeText.resignFirstResponder()
        
        return true
    }

    
    @IBAction func searchAirportPressed(sender: UIButton) {
        
        if let destination = airportCodeText.text {
            APIC.retrieveCode(destination)
            
        }
    }
    
    
}
