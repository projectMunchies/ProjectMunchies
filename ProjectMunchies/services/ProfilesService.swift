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
    
    private let profilesRespository = ProfilesRespository()
    private let fbStorageRespository = FbStorageRespository()
    
    public func getProfile(profileId: String, completed: @escaping (_ profileResult: ProfileModel) -> Void) {
        profilesRespository.Get(profileId: profileId) { [self](responseProfile) -> Void in
            if responseProfile.id != "" {
                fbStorageRespository.Get(profileId: responseProfile.id) {(uiImage) -> Void in
                    if uiImage.size.width != 0 {
                        var result = responseProfile
                        result.profileImage = uiImage
                        completed(result)
                    }
                }
            }
        }
    }
    
    public func createProfile(completed: @escaping (_ profileResult: ProfileModel) -> Void) {
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
        
        profilesRespository.Create(newId: id, newProfile: docData) {(responseProfile) -> Void in
            if !responseProfile.isEmpty {
              // create new profile image
                
            }
        }
    
    }
}
