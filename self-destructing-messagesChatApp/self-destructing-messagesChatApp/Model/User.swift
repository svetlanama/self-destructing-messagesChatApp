//
//  User.swift
//  cape_prototype
//
//  Created by Svitlana Moiseyenko on 3/12/16.
//  Copyright © 2016 Svitlana Moiseyenko. All rights reserved.
//

import Foundation

enum UserKeys: String {
  
  case kName = "Name"
  case kEmail = "Email"
  case kPhotoFile = "PhotoFile"
}

struct User {
  
  let userID: String!
  let name: String!
  let email: String!
  let photoFile: String!
  
  let ref: Firebase?
  
  init (email: String, name: String, photoFile: String) {
    
    self.userID = nil
    self.name = name
    self.email = email
    self.photoFile = photoFile
    self.ref = nil
  }
  
  init(snapshot: FDataSnapshot) {
    userID = snapshot.key
    name = snapshot.value[UserKeys.kName.rawValue] as! String
    email = snapshot.value[UserKeys.kEmail.rawValue] as! String
    photoFile = snapshot.value[UserKeys.kPhotoFile.rawValue] as! String
    ref = snapshot.ref
  }
  
  func toAnyObject() -> AnyObject {
    return [
      UserKeys.kEmail.rawValue: email,
      UserKeys.kName.rawValue: name,
      UserKeys.kPhotoFile.rawValue: photoFile
    ]
  }

  
}

 
