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
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    var avatarName = "defualt"
    var avatarColor = "[0.5,0.5,0.5,1]"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SetupView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        spinner.isHidden = true
        
        UIView.animate(withDuration: 1){
        if UserDataService.instance.avatarName != "" {
            self.userImage.image = UIImage(named: UserDataService.instance.avatarName)
            self.avatarName = UserDataService.instance.avatarName
            }
        }
    }
    
    @IBAction func closeButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    
    @IBAction func pickAvatar(_ sender: Any) {
        performSegue(withIdentifier: To_Pick_Avatar, sender: nil)
    }
    
    @IBAction func pickBGColor(_ sender: Any) {
        var r = CGFloat(arc4random_uniform(255)) / 255
        var g = CGFloat(arc4random_uniform(255)) / 255
        var b = CGFloat(arc4random_uniform(255)) / 255
        var color = UIColor(red: r, green: g, blue: b, alpha: 1)
        
        self.avatarColor = "[\(r), \(g), \(b), 1]"
        UIView.animate(withDuration: 0.5){
        self.userImage.backgroundColor = color
        }
        
    }
    
    @IBAction func CreateAccount(_ sender: Any) {
        spinner.isHidden = false
        spinner.startAnimating()
        
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
                            self.spinner.stopAnimating()
                            self.performSegue(withIdentifier: UNWIND, sender: nil)
                            NotificationCenter.default.post(name: ADDUSER_NOTIFICATION, object: nil)
                        }
                    })
                }
              })
            }else{
              print("register user failed!")
            }
            self.spinner.stopAnimating()
        }
    }
    
    func SetupView(){
        self.spinner.isHidden = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(CreateAccountVC.handleTapScreen))
        
        view.addGestureRecognizer(tap)
    }
    
    @objc func handleTapScreen(){
        view.endEditing(true)
    }
    
}
