//
//  CreateAccountVC.swift
//  Smack
//
//  Created by Parsa on 11/12/18.
//  Copyright © 2018 Parsa. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        }
    
    @IBAction func closeButtonPressed(_ sender: Any) {
    performSegue(withIdentifier: UNWIND, sender: nil)
        
    }
}
