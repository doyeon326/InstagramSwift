//
//  ImageUploader.swift
//  InstagramFirestoreTutorial
//
//  Created by Tony Jung on 2021/03/15.
//

import FirebaseStorage

struct ImageUploader {
    static func uploadImage(image: UIImage, completion: @escaping(String) -> Void) {
        guard let imageData = image.jpegData(compressionQuality: 0.75) else { return }
        let filename = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile_images/\(filename)")
        
        ref.putData(imageData, metadata: nil, completion: { medadata, error in
            if let error = error {
                print("DEBUG: Failed to upload image \(error.localizedDescription)")
                return
            }
            
            ref.downloadURL(completion: { url, error in
                guard let imageURL = url?.absoluteString else { return }
                completion(imageURL)
            })
        })
    }
}
