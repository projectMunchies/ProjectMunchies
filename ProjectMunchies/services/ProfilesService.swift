//
//  ProfilesService.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 5/27/24.
//

import Foundation
import UIKit
import FirebaseAuth

class ProfilesService {
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
        let id = UUID().uuidString
        var newProfile = ProfileModel(
            id: id,
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
            "id": newProfile.id,
            "fullName": newProfile.fullName,
            "location": "",
            "description": "",
            "gender": "",
            "userId": Auth.auth().currentUser?.uid as Any,
            "messageThreadIds": [],
        ]
        
        try await profilesRespository.Create(newId: id, newProfile: docData)
        return newProfile
    }
}
