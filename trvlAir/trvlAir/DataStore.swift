//
//  DataStore.swift
//  trvlAir
//
//  Created by don't touch me on 8/5/16.
//  Copyright © 2016 trvl, LLC. All rights reserved.
//

import UIKit

class DataStore: NSObject {
    
    static let sharedInstance = DataStore()
    override fileprivate init() {}
    
    var currentAirport = Airport()
    var airportArray = [Airport]()
    
}
