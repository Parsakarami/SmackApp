//
//  CircularImage.swift
//  Smack
//
//  Created by Parsa on 11/27/18.
//  Copyright © 2018 Parsa. All rights reserved.
//

import UIKit

@IBDesignable
class CircularImage: UIImageView {
    override func awakeFromNib() {
        super.awakeFromNib()
        SetupView()
    }
    
    func SetupView(){
        self.layer.cornerRadius = 12
        self.clipsToBounds = true
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        SetupView()
    }
}
