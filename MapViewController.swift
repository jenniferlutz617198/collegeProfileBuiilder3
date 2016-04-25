//
//  MapViewController.swift
//  collegeProfileBuilder1
//
//  Created by mobileapps on 4/22/16.
//  Copyright © 2016 JohnHerseyHighSchool. All rights reserved.
//

import UIKit
import MapKit


class MapViewController: UIViewController, UIActionSheetDelegate {
    var collegeLocation = String()
    @IBOutlet weak var myMapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        geocodeLocation(collegeLocation)
        var collegeLocationArray: [CLPlacemark]!
        
    }
    
    
    func createActionSheet(placemark: [CLPlacemark]) {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .ActionSheet)
        let actionsheet = UIActionSheet(title: "locations", delegate: self, cancelButtonTitle: "cancel", destructiveButtonTitle: nil)
        actionsheet.addButtonWithTitle(placemark[0].locality)
        self.presentViewController(alert, animated: true, completion: nil)
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
                    let annotation = MKPointAnnotation()
                    annotation.coordinate = (place.location?.coordinate)!
                    annotation.title = place.name
                    self.myMapView.addAnnotation(annotation)
                }

            }
            
        }
    }
}
