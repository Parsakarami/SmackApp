//
//  ChannelVC.swift
//  Smack
//
//  Created by Parsa on 11/9/18.
//  Copyright © 2018 Parsa. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController {
	
    override func viewDidLoad() {
        super.viewDidLoad()
        self.revealViewController().rearViewRevealWidth = view.frame.size.width - 105
    }
}