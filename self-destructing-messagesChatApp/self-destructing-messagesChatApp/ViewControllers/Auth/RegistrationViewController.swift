//
//  RegistrationViewController.swift
//  cape_prototype
//
//  Created by Svitlana Moiseyenko on 3/13/16.
//  Copyright © 2016 Svitlana Moiseyenko. All rights reserved.
//

import Foundation
import UIKit

class RegistrationViewController: UIViewController {
  
  @IBOutlet weak var txtEmail: UITextField!
  @IBOutlet weak var txtPass: UITextField!
  @IBOutlet weak var txtName: UITextField!

  @IBAction func onRegistration(sender: AnyObject) {
    registerUser()
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    txtEmail.text = "cat@gmail.com"
    txtPass.text = "cat"
    txtName.text = "Cat"
  }
  
  func registerUser() {
    
    let user: User = User(email:  txtEmail.text!, name: txtName.text!, photoFile: "")
    let userDic = user.toAnyObject() as! Dictionary<String, AnyObject>
    
    UserService.registerUser(userDic, password: txtPass.text!){ (successful, error) ->
      Void in
      
      if successful {
        self.performSegueWithIdentifier(Constants.Segues.toUsers, sender: nil)
      } else {
        print("user registered error: ", error?.code)
        AlertUtils.showAlert(self,
                             title: "",
                             message: "Registration is failed .\(error?.description)",
                             buttons: ["OK": nil])
      }
    }
  }
  
}