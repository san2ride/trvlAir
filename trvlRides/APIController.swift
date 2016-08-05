//
//  APIController.swift
//  trvlRides
//
//  Created by don't touch me on 8/2/16.
//  Copyright © 2016 trvl, LLC. All rights reserved.
//

import UIKit

class APIController {
    
//    weak var delegate: AirportDelegate?
    
    let headers = [
        "content-type": "application/json",
        "accept": "application/json",
        "apc-auth": "a8740e2d7f",
        "apc-auth-secret": "06efdea5056580b",
        "cache-control": "no-cache",
        "postman-token": "aca04bf5-0a14-fd9b-5a38-2be24b24d7b3"
    ]
    
    
    func retrieveCode(searchedData: String) {
        
        let request = NSMutableURLRequest(URL: NSURL(string: "https://www.air-port-codes.com/api/v1/single?iata=\(searchedData)")!,
                                          cachePolicy: .UseProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        
        request.HTTPMethod = "POST"
        request.allHTTPHeaderFields = headers
        
        let session = NSURLSession.sharedSession()
        let dataTask = session.dataTaskWithRequest(request, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error)
            } else {
                
                if let data = data {
                    
                    do {
                       
                        if let dict = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments) as? [String:AnyObject] {
                            print(dict)
                            if let airportDict = dict["airport"] as? JSONDictionary {
                                
                                let airport = Airport(dict: airportDict)
                                                                print("Airport")
                                
                                dispatch_async(dispatch_get_main_queue(), {
                                    DataStore.sharedInstance.airportArray.append(airport)
                                    
                                })
                                

                            }
                            
                        }
                        
                    } catch {
                        print("couldnt parse")
                    }
                }
            }
            
        })
        dataTask.resume()
    }
    
}
