//
//  Post.swift
//  MyHood
//
//  Created by Rupert Waldron on 20/03/2017.
//  Copyright © 2017 Rupert Waldron. All rights reserved.
//

import Foundation

// This is the model class of Post

class Post {
    
    fileprivate var _imagePath: String!
    fileprivate var _title: String!
    fileprivate var _postDesc: String!
    
    // get has been added to this getter to see what difference it makes
    var imagePath: String {
            return _imagePath
    }
    
    var title: String {
        return _title
    }
    
    var postDesc: String {
        return _postDesc
    }
    
    init(imagePath: String, title: String, description: String) {
        self._imagePath = imagePath
        self._title = title
        self._postDesc = description
    }
}
