//
//  MessagesViewController.swift
//  cape_prototype
//
//  Created by Svitlana Moiseyenko on 3/11/16.
//  Copyright © 2016 Svitlana Moiseyenko. All rights reserved.
//

import Foundation
import UIKit

class MessagesViewController : UIViewController {
  
  @IBOutlet weak var messagesTable: UITableView!
  @IBOutlet weak var senderButton1: UIButton!
  @IBOutlet weak var senderButton2: UIButton!
  
  var post: Post?
  var messages = [ChatMessage]()
  var senderID1 = "" //SharedDelegate.sharedInstance.uid
  var senderID2 = "" //One of the user's id helper@gmail.com
  
  @IBAction func onSender1Click(sender: AnyObject) {
    MessagesGateway.createNewMessage(post!.postID, senderId: senderID1)
  }
  
  @IBAction func onSender2Click(sender: AnyObject) {
    MessagesGateway.createNewMessage(post!.postID, senderId: senderID2)
  }
  
  let cellIdentifierPoster = "poster_cell"
  let cellIdentifierHelper = "helper_cell"
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    navigationItem.title = "Messages"
    initMessageTable()
    
    senderID1 = SharedDelegate.sharedInstance.uid //me
    senderID2 = "8f9f7a95-5c3e-4eb5-bead-3b7e1b46e863"
    
    senderButton1.setTitle("Me", forState: UIControlState.Normal)
    senderButton2.setTitle("Tom", forState: UIControlState.Normal)
    
    //isIamPoster() ? "8f9f7a95-5c3e-4eb5-bead-3b7e1b46e863" : (post?.posterID)!
    //One of the user's id helper@gmail.com

//    if isIamPoster() {
//      senderButton1.setTitle("I'am poster", forState: UIControlState.Normal)
//      senderButton2.setTitle("Tom is helper", forState: UIControlState.Normal)
//    } else {
//      senderButton1.setTitle("I'am helper", forState: UIControlState.Normal)
//      senderButton2.setTitle("Tom is poster", forState: UIControlState.Normal)
//    }
    
  }
  
//  func isIamPoster() -> Bool {
//    if post!.posterID == senderID1 {
//      return true
//    }
//    return false
//  }
  
  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)
    MessagesGateway.getMessages(post!.postID, completion: {(messagesArray) -> Void in
      self.messages = messagesArray
      self.reloadMessages()
    })
  }
  
  private func initMessageTable() {
    messagesTable.reloadData()
  }
  
  private func reloadMessages() {
    self.messagesTable.reloadData()
  }
}

extension MessagesViewController: UITableViewDataSource, UITableViewDelegate {
  
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return messages.count
  }
  
  func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    return 50
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
    let cell: ChatMessageTableViewCell!
    let msgItem: ChatMessage = messages[indexPath.row]
    
    if  msgItem.senderID == senderID1 {
      cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifierPoster) as! ChatMessageTableViewCell
    } else {
      cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifierHelper) as! ChatMessageTableViewCell
    }
    
    cell.chatMessage = msgItem
    
    return cell
  }
  
  func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
    
  }
  
}
