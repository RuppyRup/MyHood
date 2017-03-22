//
//  AddPostVC.swift
//  MyHood
//
//  Created by Rupert Waldron on 21/03/2017.
//  Copyright © 2017 Rupert Waldron. All rights reserved.
//

import UIKit

class AddPostVC: UIViewController {

    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var descField: UITextField!
    @IBOutlet weak var postImg: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }

    
    @IBAction func addPicBtnPressed(_ sender: UIButton) {
        sender.setTitle("", for: .normal) // removes label when button is pressed
    }
    
    @IBAction func makePostBtnPressed(_ sender: UIButton) {
    }

    @IBAction func cancelBtnPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil) // dismisses the current view controller when button is pressed
    }
    
   

}
