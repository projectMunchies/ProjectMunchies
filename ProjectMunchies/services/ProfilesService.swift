//
//  ProfilesService.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 5/27/24.
//

import Foundation
import UIKit
import FirebaseAuth

class ProfilesService: ObservableObject {
    private let profilesRespository = ProfilesRepository()
    private let fbStorageRespository = FbStorageRepository()
    
    public func GetProfile(profileId: String) async throws -> ProfileModel {
        let responseProfile = try await profilesRespository.Get(profileId: profileId)
        let profileImage = try await fbStorageRespository.Get(profileId: responseProfile.id)
        
        var result = responseProfile
        result.profileImage = profileImage
        return result
    }
    
    public func CreateProfile() async throws -> ProfileModel {
        guard let userId = Auth.auth().currentUser?.uid else {
            throw NSError(domain: "ProfileService", code: 0, userInfo: [NSLocalizedDescriptionKey: "No authenticated user found"])
        }
        
        let newProfile = ProfileModel(
            id: "",  // Leave the id empty, as it will be generated in the repository
            fullName: Auth.auth().currentUser?.displayName ?? "",
            location: "",
            description: "",
            gender: "",
            age: "",
            fcmTokens: [],
            messageThreadIds: [],
            occupation: "",
            hobbies: [],
            reviewIds: [],
            isMockData: false,
            profileImage: UIImage()
        )
        
        let docData: [String: Any] = [
            "fullName": newProfile.fullName,
            "location": "",
            "description": "",
            "gender": "",
            "age": "",
            "fcmTokens": [],
            "messageThreadIds": [],
            "occupation": "",
            "hobbies": [],
            "reviewIds": [],
            "isMockData": false
        ]
        
        try await profilesRespository.Create(userId: userId, newProfile: docData)
        
        // Fetch the created profile to get the generated profile id
        let createdProfile = try await profilesRespository.Get(profileId: userId)
        return createdProfile
    }
}
