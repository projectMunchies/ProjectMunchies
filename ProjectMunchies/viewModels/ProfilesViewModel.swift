//
//  ProfilesViewModel.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 8/11/23.
//

import Foundation
import UIKit
import Firebase
import FirebaseStorage
import FirebaseAuth

class ProfilesViewModel: ObservableObject {
    
    private let profilesRespository = ProfilesRespository()
    private let fbStorageRespository = FbStorageRespository()
    private let profilesService = ProfilesService()
     
    @Published var profileImage: UIImage = UIImage()
    @Published var userProfile: ProfileModel = ProfileModel(id: "", fullName: "", location: "", description: "", gender: "",age: "", fcmTokens: [], messageThreadIds: [], occupation: "" , hobbies: [], reviewIds: [], isMockData: false, profileImage: UIImage())
    @Published var foodFilter: FoodFilterModel = FoodFilterModel(id: "",userProfileId: "",category: "Cuisine", type: "Pick", gender: "Pick", location: "Pick", ageRangeFrom: "18", ageRangeTo: "70", timeStamp: Date())
    @Published var userFoodFilter: FoodFilterModel = FoodFilterModel(id: "",userProfileId: "",category: "Cuisine", type: "Pick", gender: "Pick", location: "Pick", ageRangeFrom: "18", ageRangeTo: "70", timeStamp: Date())
    @Published var foodFilters: [FoodFilterModel] = []
    @Published var lastDoc: DocumentSnapshot!
    
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

