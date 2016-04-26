//
//  DetailsViewController.swift
//  collegeProfileBuilder1
//
//  Created by student3 on 2/26/16.
//  Copyright © 2016 JohnHerseyHighSchool. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var collegeLocationArray = String()
    var newCollege = College()
    var website = String()
    var picker = UIImagePickerController()
    var chooseImage = UIImage()
    
    var isImage: Bool?
    
    @IBOutlet weak var webstieButton: UIButton!
    @IBOutlet weak var websiteTextField: UITextField!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var numberOfStudentsTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.text = newCollege.name
        locationTextField.text = newCollege.location
        numberOfStudentsTextField.text = newCollege.numberOfStudents
        logoImageView.image = UIImage(named: newCollege.image)
        websiteTextField.text = newCollege.webpage
        self.picker.delegate = self
        
        
    }
    
    
        
    
    
    
    
    
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "webSegue"
        {
            let NVC = segue.destinationViewController as! collegeWebpageViewController
            NVC.website = newCollege.webpage
            

        }
        else if segue.identifier == "mapSegue"
        {
            let NVC = segue.destinationViewController as! MapViewController
            NVC.collegeLocation = newCollege.location
        }
        

    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        var chooseImage = UIImage()
        self.picker.dismissViewControllerAnimated(true) { () -> Void in
            chooseImage = info[UIImagePickerControllerOriginalImage] as! UIImage
            self.logoImageView.image = chooseImage
            
        }
    }
        
    }
    @IBAction func onChooseButtonPressed(sender: UIButton) {
        let actionsheet = UIAlertController(title: "Choose a photo from photo library", message: nil, preferredStyle: .ActionSheet)
        actionsheet.popoverPresentationController?.sourceView = self.view
        actionsheet.popoverPresentationController?.sourceRect = CGRect(x: 0, y: self.view.frame.height, width: self.view.frame.width, height: 100)
        let librarybutton = UIAlertAction(title: "Photo Library", style: .Default) { (action) -> Void in
            self.picker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
            self.presentViewController(self.picker, animated: true, completion: nil)
            
        }
        actionsheet.addAction(librarybutton)
        presentViewController(actionsheet, animated: true, completion: nil)
        
    }
}
