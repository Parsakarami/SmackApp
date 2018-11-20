//
//  CreateAccountVC.swift
//  Smack
//
//  Created by Parsa on 11/12/18.
//  Copyright © 2018 Parsa. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    //Outlet
    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var userImage: UIImageView!
    
    var avatarName = "defualt"
    var avatarColor = "[0.5,0.5,0.5,1]"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func closeButtonPressed(_ sender: Any) {
    performSegue(withIdentifier: UNWIND, sender: nil)
    }
    
    @IBAction func pickAvatar(_ sender: Any) {
    }
    @IBAction func pickBGColor(_ sender: Any) {
    }
    @IBAction func CreateAccount(_ sender: Any) {
        guard let user = usernameText.text, usernameText.text != "" else { return }
        guard let email = emailText.text, emailText.text != "" else { return }
        guard let password = passwordText.text,  passwordText.text != "" else { return }
        
        AuthService.Instance.RegisterUser(email: email, password: password)
        { (success) in
            if success{
              AuthService.Instance.Login(email: email, password: password, completion: {(loginSuccess) in
                if loginSuccess{
                    print("the user logged in! token : \(AuthService.Instance.authToken)")
                    AuthService.Instance.CreateUser(name: user, email: email, avatarName: self.avatarName, avatarColor: self.avatarColor, completion: {(success) in
                        if  success {
                            self.performSegue(withIdentifier: UNWIND, sender: nil)
                        }
                    })
                }
              })
            }else{
              print("register user failed!")
            }
        }
    }
    
    
    
}
