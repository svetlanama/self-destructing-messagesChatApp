//
//  LoginViewController.swift
//  cape_prototype
//
//  Created by Svitlana Moiseyenko on 3/12/16.
//  Copyright © 2016 Svitlana Moiseyenko. All rights reserved.
//

import Foundation
import UIKit



class LoginViewController: UIViewController {
  
  @IBOutlet weak var txtEmail: UITextField!
  @IBOutlet weak var txtPass: UITextField!
  
  @IBAction func onLogin(sender: AnyObject) {
    loginUser()
  }
  
  
  @IBAction func onRegistration(sender: AnyObject) {
    self.performSegueWithIdentifier(Constants.Segues.toRegister, sender: nil)
  }
  
  @IBAction func onForgotPassword(sender: AnyObject) {
      self.performSegueWithIdentifier(Constants.Segues.toResetPassword, sender: nil)
  }

  func loginUser() {
    UserService.login(txtEmail.text!, pass: txtPass.text!) { successful, error in
      if successful {
        self.performSegueWithIdentifier(Constants.Segues.toUsers, sender: nil)
      } else {
        print("user login error: ", error?.code)
        AlertUtils.showAlert(self,
                             title: "",
                             message: "Login is failed .\(error?.description)",
                             buttons: ["OK": nil])
      }
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
//    if SharedDelegate.sharedInstance.isSessionActive() {
//      self.performSegueWithIdentifier(Constants.toPosts, sender: nil)
//    }
     SharedDelegate.sharedInstance.setSessionInvalid()
     initControls()
  }
  
  func initControls() {
    txtEmail.text = "cat@gmail.com"
    txtPass.text = "cat"
  }
}