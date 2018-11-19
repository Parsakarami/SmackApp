//
//  RoundedButton.swift
//  Smack
//
//  Created by Parsa on 11/19/18.
//  Copyright © 2018 Parsa. All rights reserved.
//

import UIKit
@IBDesignable
class RoundedButton: UIButton {
    
    @IBInspectable var cornerRedious : CGFloat = 3.0 {
        didSet{
            self.layer.cornerRadius = cornerRedious
        }
    }
    
    override func awakeFromNib() {
        self.setupView()
    }
    
    func setupView(){
        self.layer.cornerRadius = cornerRedious
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.setupView()
    }
}
