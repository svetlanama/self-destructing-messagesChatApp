//
//  MessagesGateway.swift
//  cape_prototype
//
//  Created by Svitlana Moiseyenko on 3/12/16.
//  Copyright © 2016 Svitlana Moiseyenko. All rights reserved.
//

import Foundation

class MessagesGateway {

  class func getMessages(postID: String, completion: (messagesArray: [ChatMessage]) -> Void)  {
    MESSAGE_REF.observeEventType(.Value, withBlock: {
      snapshot in

      var localMessages = [ChatMessage]()
      for item in snapshot.children {
        let msgItem = item as! FDataSnapshot
        if postID == msgItem.value["PostID"] as? String {
        let chatmessageItem = ChatMessage(snapshot: msgItem)
        localMessages.append(chatmessageItem)
        }
      }
      
      print("messagesArray count: \(localMessages.count)")
      completion(messagesArray: localMessages)
      
      }, withCancelBlock: { error in
        print(error.description)
        completion(messagesArray: [ChatMessage]())
    })
    
  }
  
  class func createNewMessage(postID: String, senderId: String) {
   
    let r = Int(arc4random_uniform(UInt32(messages.count - 1)))
    let message = messages[r]
    let date = ""
    
    let chatMessageItem = ChatMessage(messageID: message, postID: postID, message: message, senderId: senderId, sentDate: date, last: 0, followup: 0, senderRead: 0, receiverRead: 0)
    MESSAGE_REF.childByAutoId().setValue(chatMessageItem.toAnyObject())
  }

}