//
//  AppDelegate.swift
//  cape_prototype
//
//  Created by Svitlana Moiseyenko on 4/6/16.
//  Copyright © 2016 Svitlana Moiseyenko. All rights reserved.
//

import Foundation

final public class SharedDelegate{

  var userID: String! {
    get {
      return (NSUserDefaults.standardUserDefaults().objectForKey(UID) ?? "") as? String
    }
  }
  
  var isChatting: Bool = false
  
  static let sharedInstance = SharedDelegate()
  
  func startNewSession(uid: String)
  {
    self.setSessionInvalid();
    
    NSUserDefaults.standardUserDefaults().setObject(uid,forKey: UID)
    NSUserDefaults.standardUserDefaults().synchronize()
  }
  
  func isSessionActive() -> Bool {
    return userID != "" ? true : false
  }
  
  
  func setSessionInvalid(){
    
    if userID != "" {
      NSUserDefaults.standardUserDefaults().removeObjectForKey(UID)
    }
    NSUserDefaults.standardUserDefaults().synchronize()
  }
  
  //  func checkNetwork() -> Bool {
  //
  //    let reachability: Reachability! = Reachability.reachabilityForInternetConnection() as Reachability
  //    let networkStatus: Int = reachability.currentReachabilityStatus().rawValue
  //    return networkStatus != 0
  //  }
}
