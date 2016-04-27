//
//  MapViewController.swift
//  collegeProfileBuilder1
//
//  Created by mobileapps on 4/22/16.
//  Copyright © 2016 JohnHerseyHighSchool. All rights reserved.
//

import UIKit
import MapKit


class MapViewController: UIViewController, UIActionSheetDelegate, MKMapViewDelegate, CLLocationManagerDelegate {
    var collegeLocationArray = "Test"
    
    
    @IBOutlet weak var myMapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createActionSheet()
        var collegeLocation: String
        
    }
    func createActionSheet() {
        let actionsheet = UIAlertController(title: "Title", message: nil, preferredStyle: .ActionSheet)
        actionsheet.popoverPresentationController?.sourceView = self.view
        actionsheet.popoverPresentationController?.sourceRect = CGRect(x: 0, y: self.view.frame.height, width: self.view.frame.width, height: 100)
        let locationsButton = UIAlertAction(title: "college location", style: .Default) { (action) -> Void in
            geocodeLocation(print(collegeLocationArray))
            
//            var location = self.collegeLocationArray
//            var span = MKCoordinateSpanMake(1.0, 1.0)
//            var region = MKCoordinateRegionMake(<#T##centerCoordinate: CLLocationCoordinate2D##CLLocationCoordinate2D#>, <#T##span: MKCoordinateSpan##MKCoordinateSpan#>)
//            myMapView.setRegion(region, animated: true)
//            var pin = MKPointAnnotation()
//            pin.coordinate = location.coordinate
//            myMapView.addAnnotation(pin)
            
        }
        
        actionsheet.addAction(locationsButton)
        presentViewController(actionsheet, animated: true, completion: nil)
        
    }
    func geocodeLocation(collegeLocation: String) {
        let geocoder  =  CLGeocoder()
        geocoder.geocodeAddressString(collegeLocation) { (arrayOfPlacemarks, error) -> Void in
            if error != nil
            {
                print(error)
            }
            else
            {
                for place in arrayOfPlacemarks! {
                    print(place)
                    let annotation = MKPointAnnotation()
                    annotation.coordinate = (place.location?.coordinate)!
                    annotation.title = place.name
                    self.myMapView.addAnnotation(annotation)
                }
            }
        }
    }
}
