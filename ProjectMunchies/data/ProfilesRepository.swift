//
//  ProfilesRepository.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 5/27/24.
//

import Foundation
import UIKit
import Firebase

class ProfilesRespository: ObservableObject{
    let db = Firestore.firestore()
    
    public func Get(profileId: String ,completed: @escaping (_ profile: ProfileModel) -> Void) {
        var profile = emptyProfileModel
        
        db.collection("profiles")
            .whereField("userId", isEqualTo: profileId as String)
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                    completed(emptyProfileModel)
                } else {
                    for document in querySnapshot!.documents {
                        let data = document.data()
                        if !data.isEmpty{
                            profile = ProfileModel(id: data["id"] as? String ?? "", fullName: data["fullName"] as? String ?? "", location: data["location"] as? String ?? "", description: data["description"] as? String ?? "", gender: data["gender"] as? String ?? "", age: data["age"] as? String ?? "", fcmTokens: data["fcmTokens"] as? [String] ?? [], messageThreadIds: data["messageThreadIds"] as? [String] ?? [],occupation: data["occupation"] as? String ?? "", hobbies: data["hobbies"] as? [String] ?? [], reviewIds: data["reviewIds"] as? [String] ?? [], isMockData: data["isMockData"] as? Bool ?? false, profileImage: UIImage())
                        }
                    }
                    completed(profile)
                }
            }
    }
    
    public func Create(newId: String, newProfile: [String: Any], completed: @escaping (_ createdProfile: [String: Any]) -> Void) {
        let docRef = db.collection("profiles").document(newId)
        let emptyDocData: [String: Any] = [:]
        
        docRef.setData(newProfile) {error in
            if let error = error{
                print("Error creating new userProfile: \(error)")
                completed(emptyDocData)
            } else {
                print("Successfully created userProfile!")
                completed(newProfile)
            }
        }
    }
}

//protocol Repository {
//    func get() -> Pro
//}


