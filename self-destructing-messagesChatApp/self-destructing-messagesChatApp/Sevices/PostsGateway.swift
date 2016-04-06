//
//  DBGataway.swift
//  cape_prototype
//
//  Created by Svitlana Moiseyenko on 3/11/16.
//  Copyright © 2016 Svitlana Moiseyenko. All rights reserved.
//

import Foundation

class PostsGateway {
  
  

  class func getPosts(completion: (postsArray: [Post]) -> Void)  {

    POST_REF.observeEventType(.Value, withBlock: {
      snapshot in

      var localPosts = [Post]()
      for item in snapshot.children {
        let postItem = Post(snapshot: item as! FDataSnapshot)
        localPosts.append(postItem)
      }
      
      print("posts count: \(localPosts.count)")
      completion(postsArray: localPosts)
      
      }, withCancelBlock: { error in
        print(error.description)
        completion(postsArray: [Post]())
    })
    
  }
  
  class func createNewPost() {

    let r = Int(arc4random_uniform(UInt32(chatsTitles.count - 1)))
    let message = chatsTitles[r]
    let date = ""
    
    let postItem = Post(message: message, category: 0, postDate: date)
    POST_REF.childByAutoId().setValue(postItem.toAnyObject())
  }
  
  
  
}