//
//  Constants.swift
//  Smack
//
//  Created by Parsa on 11/12/18.
//  Copyright © 2018 Parsa. All rights reserved.
//

import Foundation

typealias CompletionHandler = (_ Success: Bool) -> ()

//Service URL constants
let BASE_URL = "http://localhost:3005/v1/"
let URL_REGISTER = "\(BASE_URL)account/register"
let URL_LOGIN = "\(BASE_URL)account/login"
let URL_USER_ADD = "\(BASE_URL)user/add"

//Segues
let To_Login = "loginSegue"
let To_Create_Account = "registerSegue"
let UNWIND = "unWindToChannel"

//Auth
let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"


//Request
let SIMPLE_HEADER = [
    "Content-Type": "application/json; charset=utf-8"
]

