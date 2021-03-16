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
    static func logUserIn(withEmail email: String, password: String, completion: AuthDataResultCallback?) {
        Auth.auth().signIn(withEmail: email, password: password, completion: completion)
    }
    static func registerUser(withCredentials credentials: AuthCredentials, completion: @escaping(Error?) -> Void) {
        print("DEBUG: Credentials are \(credentials)")
        ImageUploader.uploadImage(image: credentials.profileImag) { ( imageUrl ) in
            Auth.auth().createUser(withEmail: credentials.email, password: credentials.password, completion: { result, error in
                if let error = error {
                    print("DEBUG: Failed to register user \(error.localizedDescription)")
                    return
                }
                guard let uid = result?.user.uid else { return }
                let data: [String: Any] = ["email" : credentials.email,
                                           "fullname" : credentials.fullname,
                                           "profileImageUrl" : imageUrl,
                                           "uid": uid,
                                           "username": credentials.username
                                            ]
                COLLECTION_USERS.document(uid).setData(data, completion: completion)
            })
        }
    }
}
