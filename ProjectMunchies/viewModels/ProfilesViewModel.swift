//
//  ProfilesViewModel.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 8/11/23.
//

import Foundation
import UIKit
import Firebase

class ProfilesViewModel: ObservableObject {
    private let service = ProfilesService()
    
    @Published var profileImage: UIImage = UIImage()
    @Published var userProfile: ProfileModel = emptyProfileModel
    @Published var isNewUser: Bool = false
    
    public func GetUserProfile() async throws {
        let userProfile =  try await service.GetProfile(profileId: Auth.auth().currentUser?.uid ?? "")
        
        if(userProfile.id != "") {
            self.userProfile = userProfile
        } else {
            if self.isNewUser {
                try await CreateUserProfile()
            }
        }
    }
    
    public func CreateUserProfile() async throws {
        let  createdProfile = try await service.CreateProfile()
        
        if(createdProfile.id != "") {
            self.userProfile = createdProfile
        }
        
    }
}

