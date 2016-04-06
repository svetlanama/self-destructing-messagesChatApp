//
//  Constants.swift
//  self-destructing-messagesChatApp
//
//  Created by Svitlana Moiseyenko on 4/6/16.
//  Copyright © 2016 Svitlana Moiseyenko. All rights reserved.
//

import Foundation

let UID = "UID"
let BASE_URL = "https://self-destructing-app.firebaseio.com"

class Constants {
  
  struct Segues {
    internal static let toUsers = "toUsers"
    internal static let toChatRoom = "toChatRoom"
    internal static let toProfile = "toProfile"
    internal static let toRegister = "toRegister"
    internal static let toResetPassword = "toResetPassword"
  }

  struct Refs {
    internal static  let base = Firebase(url: "\(BASE_URL)")
    internal static  let user = Firebase(url: "\(BASE_URL)/users")
    internal static  let message = Firebase(url: "\(BASE_URL)/chatmessage")
    internal static  let chatRoom = Firebase(url: "\(BASE_URL)/chatroom")
  }
  
}



