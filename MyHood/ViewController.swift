//
//  ViewController.swift
//  MyHood
//
//  Created by Rupert Waldron on 20/03/2017.
//  Copyright © 2017 Rupert Waldron. All rights reserved.
//

import UIKit

// Additional class items are used for the table

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    //var posts = [Post]() // creates an array of type post which we created in the model class
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self  // Initialises the table
        tableView.dataSource = self
        
        // Listens for posts. Calls function onPostsLoaded
        
        DataService.instance.loadPosts() // load the posts when start tableview
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.onPostsLoaded(_:)), name: NSNotification.Name(rawValue: "postsLoaded"), object: nil)
        
        // Creates elements for the array
        
        //let post = Post(imagePath: "", title: "Post 1", description: "Post 1 Description")
        //let post2 = Post(imagePath: "", title: "Post 2", description: "I am the second post, Yippee!")
        //let post3 = Post(imagePath: "", title: "Post 3", description: "I am the most important post")
        
        // Adds elements to the array
        
        //posts.append(post)
        //posts.append(post2)
        //posts.append(post3)
        
        tableView.reloadData() // reloads the table to update the data
        
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Lines below posts to the cells in the Table
        //let post = posts[indexPath.row]
        let post = DataService.instance.loadedPosts[indexPath.row] // Use DataService array rather than dummy
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell") as? PostCell {
            cell.configureCell(post)
            return cell
        }
        return PostCell()
    }
    
    /*func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }*/
    
    // This sets the number of rows in the table to the number of rows in the array
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return posts.count
        return DataService.instance.loadedPosts.count // Use DataService array rather than dummy
    }
    
    func onPostsLoaded(_ notif: AnyObject) {
        tableView.reloadData()
    }
}

