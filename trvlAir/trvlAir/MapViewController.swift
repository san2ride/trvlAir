//
//  MapViewController.swift
//  trvlAir
//
//  Created by don't touch me on 8/5/16.
//  Copyright © 2016 trvl, LLC. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    
    var theAirportMap: Airport?
    var locationManager = CLLocationManager()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        self.addPin(theAirportMap!)
        
    }
    
    func addPin(_ airport : Airport) {
        
        let latitude: Double = Double( (self.theAirportMap?.latitude)! )!
        let longitude: Double = Double( (self.theAirportMap?.longitude)! )!
        let name: String = ""
        let iata: String = ""
        
        let location = CLLocationCoordinate2D(
            latitude: latitude,
            longitude: longitude
        )
        
        let annotation = MKPointAnnotation()
        
        annotation.coordinate = location
        annotation.title = title
        annotation.subtitle = iata
        
        self.mapView.addAnnotation(annotation)
    }
    
    func mapView(_ mapView: MKMapView?, didSelect view: MKAnnotationView?) {
        let appleMapsURL = "http://maps.apple.com/?q=\(view?.annotation?.coordinate.latitude),\(view?.annotation?.coordinate.longitude)"
        UIApplication.shared.openURL(URL(string: appleMapsURL)!)
    }
    
    
}
