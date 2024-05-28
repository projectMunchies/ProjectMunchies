//
//  ProfilesViewModel.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 8/11/23.
//

import Foundation
import Firebase
import FirebaseAuth

class ProfilesViewModel: ObservableObject {
    private let profilesService = ProfilesService()
     
    @Published var profileImage: UIImage = UIImage()
    @Published var lastDoc: DocumentSnapshot!
    @Published var userProfile: ProfileModel = ProfileModel(
        id: "",
        fullName: "",
        location: "",
        description: "",
        gender: "",
        age: "",
        fcmTokens: [],
        messageThreadIds: [],
        occupation: "" ,
        hobbies: [],
        reviewIds: [],
        isMockData: false,
        profileImage: UIImage()
    )
    
    public func getUserProfile(completed: @escaping (_ proflie: ProfileModel) -> Void) {
        profilesService.getProfile(profileId: Auth.auth().currentUser?.uid ?? "") {(userProfile) -> Void in
            if(userProfile.id != "") {
                self.userProfile = userProfile
                completed(userProfile)
            }
        }
    }
    
    public func createUserProfile() {
        profilesService.createProfile() {(createdProfile) -> Void in
            if(createdProfile.id != "") {
                self.userProfile = createdProfile
            }
        }
    }
    
    public func getProfile(requestId: String, completed: @escaping (_ proflie: ProfileModel) -> Void) {
        profilesService.getProfile(profileId: requestId) {(userProfile) -> Void in
            if(userProfile.id != "") {
                self.userProfile = userProfile
                completed(userProfile)
            }
        }
    }
}

