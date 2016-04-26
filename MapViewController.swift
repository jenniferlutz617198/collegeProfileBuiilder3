//
//  MapViewController.swift
//  collegeProfileBuilder1
//
//  Created by mobileapps on 4/22/16.
//  Copyright © 2016 JohnHerseyHighSchool. All rights reserved.
//

import UIKit
import MapKit


class MapViewController: UIViewController, UIActionSheetDelegate, MKMapViewDelegate {
    var collegeLocation = String()
    @IBOutlet weak var myMapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createActionSheet()
    }
    
    
    
    func createActionSheet() {
        let actionsheet = UIAlertController(title: "Title", message: nil, preferredStyle: .ActionSheet)
        actionsheet.popoverPresentationController?.sourceView = self.view
        actionsheet.popoverPresentationController?.sourceRect = CGRect(x: 0, y: self.view.frame.height, width: self.view.frame.width, height: 100)
        let locationsButton = UIAlertAction(title: "college location", style: .Default) { (action) -> Void in
            
        }
        
        actionsheet.addAction(locationsButton)
        presentViewController(actionsheet, animated: true, completion: nil)
        
        
        
        
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
}