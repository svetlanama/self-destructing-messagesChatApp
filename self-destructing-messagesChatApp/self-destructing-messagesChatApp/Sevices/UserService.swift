//
//  UserGateway.swift
//  cape_prototype
//
//  Created by Svitlana Moiseyenko on 3/12/16.
//  Copyright © 2016 Svitlana Moiseyenko. All rights reserved.
//

import Foundation

class UserService {
  
  
  class func getUser(userID: String, completion: (user: User?) -> Void)  {
    
 Constants.Refs.user.childByAppendingPath(userID).observeSingleEventOfType(.Value, withBlock: { snapshot in
      let user = User(snapshot: snapshot)
      completion(user: user)
      }, withCancelBlock: { error in
        print(error.description)
        completion(user: nil)
    })
  }
  
  class func registerUser(userDic: [String: AnyObject], password: String, completion: (successful: Bool, error: NSError?) -> Void) {
    
    let email = userDic["Email"] as? String ?? ""
    Constants.Refs.base.createUser(email, password: password) {  error, result in
      if error != nil {
        
        print("registration failed: %@", error)
        completion(successful: false, error: error)
      } else {
        
        Constants.Refs.base.authUser(email, password: password, withCompletionBlock: {
          err, authData in
          if error != nil {
            completion(successful: false, error: error)
            
          } else {
            
            print("provider: %@" +  authData.provider)
            var user = userDic
            user["provider"] = authData.provider!
            
            self.createNewAccount(authData.uid, user: user)
            SharedDelegate.sharedInstance.startNewSession(authData.uid)
            completion(successful: true, error: nil)
          }
        })
      }
    }
  }
  
  class func login(email: String, pass: String, completion: (successful: Bool, error: NSError?) -> Void) {
    Constants.Refs.base.authUser(email, password: pass, withCompletionBlock: {
      error, authData in
      if error != nil {
        print("login failed: %@", error)
        completion(successful: false, error: error)
      } else {
        SharedDelegate.sharedInstance.startNewSession(authData.uid)
        completion(successful: true, error: nil)
      }
    })
  }
  
  
  class func createNewAccount(uid: String, user: Dictionary<String, AnyObject>) {
    Constants.Refs.user.childByAppendingPath(uid).setValue(user)
    print("uraaa user registered: ")
  }
  
  class func resetPassword(email: String, completion: (successful: Bool, error: NSError?) -> Void ) {
    Constants.Refs.base.resetPasswordForUser(email) { (error) -> Void in
      if error != nil {
        print("reset pass failed: %@", error)
        completion(successful: false, error: error)
      } else {
        completion(successful: true, error: nil)
      }
    }
  }
  
  class func logout() {
    SharedDelegate.sharedInstance.setSessionInvalid()
    Constants.Refs.base.unauth()
  }
  
  
}