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
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue) {}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.revealViewController().rearViewRevealWidth = view.frame.size.width - 105
    }

    
    @IBAction func loginButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: To_Login, sender: nil)
    }
    
}
