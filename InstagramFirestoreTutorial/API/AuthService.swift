//
//  AuthService.swift
//  InstagramFirestoreTutorial
//
//  Created by Tony Jung on 2021/03/15.
//

import UIKit
import Firebase

struct AuthCredentials {
    let email: String
    let password: String
    let fullname: String
    let username: String
    let profileImag: UIImage
}
struct AuthService {
    static func registerUser(withCredentials credentials: AuthCredentials) {
        print("DEBUG: Credentials are \(credentials)")
    }
}
