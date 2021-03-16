//
//  UserService.swift
//  InstagramFirestoreTutorial
//
//  Created by Tony Jung on 2021/03/16.
//

import Foundation
import Firebase

struct UserService {
    static func fetchUser(completion: @escaping(User) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        COLLECTION_USERS.document(uid).getDocument(completion: {
            snapshot, error in
            guard let dictionary = snapshot?.data() else { return }
            let user = User(dictionary: dictionary)
            completion(user)
            print("DEBUG: Snapshot in \(snapshot?.data())")
        })
    }
}
