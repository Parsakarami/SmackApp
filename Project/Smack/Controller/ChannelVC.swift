//
//  ChannelVC.swift
//  Smack
//
//  Created by Parsa on 11/9/18.
//  Copyright © 2018 Parsa. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController {
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var userImage: CircularImage!
    
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue){
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.revealViewController().rearViewRevealWidth = view.frame.size.width - 105
        NotificationCenter.default.addObserver(self, selector: #selector(ChannelVC.ChangeUserState(_:)), name: ADDUSER_NOTIFICATION, object: nil)
    }
    
    @objc func ChangeUserState(_ notification: Notification){
        if  AuthService.Instance.isLoggedIn{
            loginButton.setTitle(UserDataService.instance.name, for: .normal)
            userImage.image = UIImage(named:UserDataService.instance.avatarName)
            userImage.backgroundColor = UserDataService.instance.ReturnUIColor(components: UserDataService.instance.avatarColor)
        } else{
            loginButton.setTitle("Login", for: .normal)
            userImage.image = UIImage(named:"profile")
            userImage.backgroundColor = UIColor.clear
        }
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: To_Login, sender: nil)
    }
    
}
