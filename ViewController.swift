//
//  ViewController.swift
//  searchLocation
//
//  Created by Felix 09 on 16/09/19.
//  Copyright © 2019 Felix. All rights reserved.
//

import UIKit
import MapKit
class ViewController: UIViewController,UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        locationText.delegate = self
        // Do any additional setup after loading the view.
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
       let geo = CLGeocoder()
        geo.geocodeAddressString(locationText.text!) { (placeMarks, error) in
            
            let placeMark = placeMarks?.first!
            let point = placeMark?.location?.coordinate
            let span = MKCoordinateSpan(latitudeDelta: 0.01,longitudeDelta: 0.01)
            let region = MKCoordinateRegion(center: point!, span: span)
            self.mapView.region = region
            let annotation = MKPointAnnotation()
            annotation.coordinate = point!
            self.mapView.addAnnotation(annotation)
        }
        
        return true
    }
    
    @IBOutlet var locationText: UITextField!
    @IBOutlet var mapView: MKMapView!
    
}

