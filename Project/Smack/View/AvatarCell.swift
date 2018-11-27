//
//  AvatarCell.swift
//  Smack
//
//  Created by Parsa on 11/26/18.
//  Copyright © 2018 Parsa. All rights reserved.
//

import UIKit

enum AvatarType{
    case Fruit
    case Animal
}

class AvatarCell: UICollectionViewCell {
    
    @IBOutlet weak var avatarImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        SetupView()
    }
    
    func configureCell(index: Int, type: AvatarType){
        if type == AvatarType.Fruit{
            avatarImage.image = UIImage(named: "fruit\(index + 1)")
        }else{
            avatarImage.image = UIImage(named: "animal\(index + 1)")
        }
    }
    
    func SetupView() {
        self.clipsToBounds = true
    }
}
