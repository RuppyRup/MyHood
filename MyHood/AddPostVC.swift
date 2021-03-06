//
//  AddPostVC.swift
//  MyHood
//
//  Created by Rupert Waldron on 21/03/2017.
//  Copyright © 2017 Rupert Waldron. All rights reserved.
//

import UIKit

// additional class items are used to selecting images

class AddPostVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var descField: UITextField!
    @IBOutlet weak var postImg: UIImageView!
    
    var imagePicker: UIImagePickerController! //lets us pick images from phone
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        postImg.layer.cornerRadius = 120 // make the image round
        
        imagePicker = UIImagePickerController() // initialises image picker
        imagePicker.delegate = self

       
    }

    
    @IBAction func addPicBtnPressed(_ sender: UIButton) {
        sender.setTitle("", for: .normal) // removes label when button is pressed
        present(imagePicker, animated: true, completion: nil) //calls the image picker view controller
    }
    
    // if let is used to check if there is anything in the strings. Wont continue if nothing there
    
    @IBAction func makePostBtnPressed(_ sender: UIButton) { // when add post is pressed takes info from screen
        if let title = titleField.text, let desc = descField.text, let img = postImg.image {
            let imgPath = DataService.instance.saveImageAndCreatePath(img) // saves image and returns path
            let post = Post(imagePath: imgPath, title: title, description: desc)
            DataService.instance.addPost(post: post) // calls the addPost function from Dataservice class
            dismiss(animated: true, completion: nil) // dismiss screen and return to tableview
        }
    }

    @IBAction func cancelBtnPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil) // dismisses the current view controller when button is pressed
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        // When user selects a picture the picture is cast as selectedImage of type UIImage
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage // Need to update info.plist
            imagePicker.dismiss(animated: true, completion: nil)
        postImg.image = selectedImage // Update the post image with the selected image
    }

}
