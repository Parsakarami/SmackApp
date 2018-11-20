//
//  AuthService.swift
//  Smack
//
//  Created by Parsa on 11/17/18.
//  Copyright © 2018 Parsa. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class AuthService{
    static let Instance = AuthService()
    let defaults = UserDefaults.standard
    
    var isLoggedIn : Bool {
        get{
            return defaults.bool(forKey: LOGGED_IN_KEY)
        }
        set{
            defaults.set(newValue, forKey: LOGGED_IN_KEY)
        }
    }
    
    var authToken : String{
        get {
            return defaults.value(forKey: TOKEN_KEY) as! String
        }
        set{
            defaults.set(newValue, forKey: TOKEN_KEY)
        }
    }
    
    var userEmail : String{
        get {
            return defaults.value(forKey: USER_EMAIL) as! String
        }
        set{
            defaults.set(newValue, forKey: USER_EMAIL)
        }
    }
    
    func RegisterUser(email : String , password : String, completion: @escaping CompletionHandler)
    {
        let lowerCaseEmail = email.lowercased()
        
        let body : [String: Any] = [
            "email" : lowerCaseEmail,
            "password" : password
        ]
        
        Alamofire.request(URL_REGISTER, method: .post, parameters: body, encoding: JSONEncoding.default, headers: SIMPLE_HEADER).responseString { (response) in
                if response.result.error == nil {
                    completion(true)
                }
                else {
                    completion(false)
                    debugPrint(response.result.error as Any)
                }
        }
    }
    
    func Login(email: String, password: String, completion : @escaping CompletionHandler)
    {
        let lowerCaseEmail = email.lowercased()
        
        let body : [String: Any] = [
            "email" : lowerCaseEmail,
            "password" : password
        ]
        
        Alamofire.request(URL_LOGIN, method: .post, parameters: body, encoding: JSONEncoding.default, headers: SIMPLE_HEADER).responseJSON {
            (response) in
            if response.result.error == nil{
                
////////// Native Json Convert
                if  let jsonResult = response.result.value as? Dictionary<String, Any>
                {
                    if let email = jsonResult["user"] as? String{
                        self.userEmail = email
                    }
                    if let token = jsonResult["token"] as? String{
                        self.authToken = token
                    }
                
/////////// Swify Json
//                guard let responseData = response.data else { return }
//                let json = JSON(data : responseData)
//                self.userEmail = json["user"].stringValue
//                self.authToken = json["token"].stringValue
                
                self.isLoggedIn = true
                
                completion(true)
            }else{
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
}
    
    func CreateUser(name: String,email: String, avatarName : String, avatarColor: String,completion: @escaping CompletionHandler){
        
        let lowerCaseEmail = email.lowercased()
        
        let header = [
            "Content-Type": "application/json; charset=utf-8",
            "Authorization" : "Bearer \(AuthService.Instance.authToken)"
        ]
        
        let body : [String: Any] = [
            "email" : lowerCaseEmail,
            "name" : name,
            "avatarName" : avatarName,
            "avatarColor" : avatarColor
        ]
        
        Alamofire.request(URL_USER_ADD, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header).responseJSON{ (response) in
            if  response.result.error == nil {
                
                //Native convert
                if  let jsonResult = response.result.value as? Dictionary<String, Any>{
                    if let id = jsonResult["_id"] as? String{
                        
                        if let color = jsonResult["avatarColor"] as? String{
                        if let email = jsonResult["email"] as? String{
                            if let name = jsonResult["name"] as? String{
                                if let avatarName = jsonResult["avatarName"] as? String{
                    
                    UserDataService.instance.SetUserData(id: id, color: color, avatarName: name
                        , email: email, name: name)
                                    completion(true)
                                }
                            }
                        }
                    }
                }
                }
                
                //Swifty Json
//                guard let data = response.data else {return}
//                let json = JSON(data : data)
//                let id = json["_id"].stringValue
                
                completion(true)
            } else{
                completion(false)
            }
        }
        
    }
}
