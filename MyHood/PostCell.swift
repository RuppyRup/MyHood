//
//  PostCell.swift
//  MyHood
//
//  Created by Rupert Waldron on 20/03/2017.
//  Copyright © 2017 Rupert Waldron. All rights reserved.
//

import UIKit

// This class controls the table view

class PostCell: UITableViewCell {
    
    @IBOutlet weak var postImg: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descLbl: UILabel!

    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        postImg.layer.cornerRadius = 15 // make the posted images round
        
    }
    
    // configureCell takes in a Post type and then sets the table element label and text
    
    func configureCell(_ post: Post) {
        titleLbl.text = post.title
        descLbl.text = post.postDesc
        postImg.image = DataService.instance.imageForPath(post.imagePath)
    }

}
