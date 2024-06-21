//
//  ProfilesRepository.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 5/27/24.
//

import Foundation
import UIKit
import Firebase

class ProfilesRepository: ObservableObject{
    let db = Firestore.firestore()
    
    public func Get(profileId: String) async throws -> ProfileModel {
        var profile = ProfileModel.emptyProfileModel
        let snapshot = try await db.collection("profiles")
            .whereField("userId", isEqualTo: profileId as String)
            .getDocuments()
        
        snapshot.documents.forEach { documentSnapshot in
            let documentData = documentSnapshot.data()
            
            profile.id = documentData["id"] as! String
            profile.fullName = documentData["fullName"] as! String
            profile.location = documentData["location"] as? String ?? ""
            profile.description = documentData["description"] as? String ?? ""
            profile.gender = documentData["gender"] as! String
            profile.age = documentData["age"] as! String
            profile.fcmTokens = documentData["fcmTokens"] as? [String] ?? []
            profile.messageThreadIds = documentData["messageThreadIds"] as? [String] ?? []
            profile.occupation = documentData["occupation"] as? String ?? ""
            profile.hobbies = documentData["hobbies"] as? [String] ?? []
            profile.reviewIds = documentData["reviewIds"] as? [String] ?? []
            profile.isMockData = documentData["isMockData"] as? Bool ?? false
        }
        return profile
    }
    
    public func Create(userId: String, newProfile: [String: Any]) async throws {
        do {
            let newProfileId = UUID().uuidString
            var updatedProfile = newProfile
            updatedProfile["userId"] = userId
            updatedProfile["id"] = newProfileId
            
            let docRef = db.collection("profiles").document(newProfileId)
            try await docRef.setData(updatedProfile)
            print("Profile created successfully in Firestore")
        } catch {
            print("Error creating profile in Firestore: \(error.localizedDescription)")
            throw error
        }
    }
}
