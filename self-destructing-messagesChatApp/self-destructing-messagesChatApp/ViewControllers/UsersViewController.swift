//
//  RoomsViewController.swift
//  self-destructing-messagesChatApp
//
//  Created by Svitlana Moiseyenko on 4/6/16.
//  Copyright © 2016 Svitlana Moiseyenko. All rights reserved.
//

import Foundation
import UIKit

class UsersViewController: UIViewController {
  
  //@IBOutlet weak var userTable: UITableView!
  private var users: [User]? {
    didSet {
      //userTable.reloadData()

    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    navigationItem.title = "Users"
//    let rightButton = UIBarButtonItem(title: "Profile", style: .Plain, target: self, action: "onProfile")
//    navigationItem.rightBarButtonItem = rightButton
    
    
    initRoomsTable()
  }
  
  private func initRoomsTable() {
    
  }
  

  
}

/*
extension UsersViewController: UITableViewDataSource, UITableViewDelegate {
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return  posts.count
  }
  
  func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    return 78
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier(Constants.CellIds.cellIdentifierPost)! as! PostTableCell
    
    cell.delegate = self
    cell.post = posts[indexPath.row]
    return cell
  }
  
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    
    //selectedPost = posts[indexPath.row]
    //self.performSegueWithIdentifier(Constants.toMessages, sender: nil)
  }
  
  func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    if editingStyle == .Delete {
      let postItem = posts[indexPath.row]
      postItem.ref?.removeValue()
    }
  }
  
  func scrollViewDidScroll(scrollView: UIScrollView) {
    //    self.limit += 1
    //    self.posts.removeAll()
    //    getPosts()
  }
  
}*/