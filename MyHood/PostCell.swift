//
//  PostCell.swift
//  MyHood
//
//  Created by Rupert Waldron on 20/03/2017.
//  Copyright © 2017 Rupert Waldron. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {
    
    @IBOutlet weak var postImg: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descLbl: UILabel!

    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(_ post: Post) {
        titleLbl.text = post.title
        descLbl.text = post.postDesc
    }

}
