//
//  DataService.swift
//  MyHood
//
//  Created by Rupert Waldron on 22/03/2017.
//  Copyright © 2017 Rupert Waldron. All rights reserved.
//

import Foundation
import UIKit

// Create Singleton to make a single instance of data globally accessable

class DataService {
    
    static let instance = DataService() // created and instantiated an instance of DataService
    
    private var _loadedPosts = [Post]() // create an array of type Post
    
    var loadedPosts: [Post] {
        return _loadedPosts //use a getter to access the private variable
    }
    
    func savePosts() {
        let postsData = NSKeyedArchiver.archivedData(withRootObject: _loadedPosts) // transforms array into data
        UserDefaults.standard.set(postsData, forKey: "posts") // saves data to a key called "posts"
        UserDefaults.standard.synchronize() // saves the data to disc
    }
    
    func loadPosts() {
        if let postsData = UserDefaults.standard.object(forKey: "posts") as? Data { // load archived data
            if let postsArray = NSKeyedUnarchiver.unarchiveObject(with: postsData) as? [Post] {
                _loadedPosts = postsArray //un-archive and cast to an array of type Post
            }
        }
        NotificationCenter.default.post(Notification(name: Notification.Name(rawValue: "postsLoaded"), object: nil)) // This will signal whenever posts have been loaded. Need listener in ViewController
    }
    
    func saveImageAndCreatePath(image: UIImage) {
        
    }
    
    func imageForPath(path: String) {
        
    }
    
    func addPost(post: Post) {
        _loadedPosts.append(post)  // add the post to the _loadedPosts array
        savePosts()  // save the posts
        loadPosts()  // load the posts
    }
    
}
