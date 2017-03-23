//
//  Post.swift
//  MyHood
//
//  Created by Rupert Waldron on 20/03/2017.
//  Copyright © 2017 Rupert Waldron. All rights reserved.
//

import Foundation

// This is the model class of Post

class Post: NSObject, NSCoding { // class post will inherit from these classes to encode and decode
    
    override init() {
        
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self._imagePath, forKey: "imagePath") // provides key for each property to be encoded
        aCoder.encode(self._postDesc, forKey: "description")
        aCoder.encode(self._title, forKey: "title")
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init()
        self._imagePath = aDecoder.decodeObject(forKey: "imagePath") as? String //decode as type String
        self._title = aDecoder.decodeObject(forKey: "title") as? String
        self._postDesc = aDecoder.decodeObject(forKey: "description") as? String
    }
    
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
