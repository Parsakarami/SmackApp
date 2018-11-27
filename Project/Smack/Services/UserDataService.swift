//
//  UserDataService.swift
//  Smack
//
//  Created by Parsa on 11/19/18.
//  Copyright © 2018 Parsa. All rights reserved.
//

import Foundation

class UserDataService{
    static let instance = UserDataService()
    
    public private(set) var id = ""
    public private(set) var avatarColor = ""
    public private(set) var avatarName = ""
    public private(set) var email = ""
    public private(set) var name = ""
    
    func SetUserData(id : String, color : String, avatarName : String,
                     email: String, name : String){
        self.id = id
        self.avatarColor = color
        self.avatarName = avatarName
        self.email = email
        self.name = name
    }
    
    func SetAvatarName(avatarName : String){
        self.avatarName = avatarName
    }
    
    func ReturnUIColor(components: String) -> UIColor{
        let scanner = Scanner(string: components)
        let skippedChar = CharacterSet(charactersIn: "[], ")
        let coma = CharacterSet.init(charactersIn: ",")
        
        scanner.charactersToBeSkipped = skippedChar
        
        var red,green,blue,alpha : NSString?
        scanner.scanUpToCharacters(from: coma, into: &red)
        scanner.scanUpToCharacters(from: coma, into: &green)
        scanner.scanUpToCharacters(from: coma, into: &blue)
        scanner.scanUpToCharacters(from: coma, into: &alpha)
        
        let defaultColor = UIColor.lightGray
        
        guard let rColor = red else {return defaultColor}
        guard let gColor = green else {return defaultColor}
        guard let bColor = blue else {return defaultColor}
        guard let aColor = alpha else {return defaultColor}
        
        let r = CGFloat(rColor.doubleValue)
        let g = CGFloat(gColor.doubleValue)
        let b = CGFloat(bColor.doubleValue)
        let a = CGFloat(aColor.doubleValue)
        
        let returnColor = UIColor(red: r, green: g, blue: b, alpha: a)
        
        return returnColor
    }
}
