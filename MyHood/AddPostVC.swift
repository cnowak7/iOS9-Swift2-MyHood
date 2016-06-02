//
//  AddPostVC.swift
//  MyHood
//
//  Created by Chris Nowak on 6/2/16.
//  Copyright © 2016 Chris Nowak Tho, LLC. All rights reserved.
//

import UIKit

class AddPostVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // IBOutlets
    
    @IBOutlet weak var postImageButton: UIButton!
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var descriptionField: UITextField!
    
    // Variables
    
    var imagePicker: UIImagePickerController!
    
    // View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        postImageView.layer.cornerRadius = self.postImageView.frame.size.width / 2
        postImageView.clipsToBounds = true
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
    }
    
    // IBActions
    
    @IBAction func addPictureButtonPressed(sender: UIButton) {
        self.presentViewController(self.imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func makePostButtonPressed(sender: AnyObject) {
        if let title = titleField.text, let description = descriptionField.text, let image = postImageView.image {
            
            let imagePath = DataService.sharedInstance.saveImageAndCreatePath(image)
            
            let post = Post(imagePath: imagePath, title: title, description: description)
            DataService.sharedInstance.addPost(post)
            dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    @IBAction func cancelButtonPressed(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    // UIImagePickerControllerDelegate
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        postImageView.image = image
        postImageButton.setTitle("", forState: .Normal)
    }
    
}
