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

@MainActor class ProfilesViewModel: ObservableObject {
    private let service = ProfilesService()
    let storage = Storage.storage()
    @Published var userProfile: ProfileModel = emptyProfileModel
    @Published var isNewUser: Bool = false
    
    public func GetUserProfile() async throws {
        let userProfile =  try await service.GetProfile(userID: Auth.auth().currentUser?.uid ?? "")
        if(userProfile.id != "") {
            self.userProfile = userProfile
            getProfileImage(profileId: userProfile.id)
        } else {
            if isNewUser {
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
    
    public func getProfileImage(profileId: String) {
        let imageRef = storage.reference().child("\(String(describing: profileId))"+"/images/image.jpg")
        
        // Download in memory with a maximum allowed size of 2MB (2 * 1024 * 1024 bytes)
        imageRef.getData(maxSize: Int64(2 * 1024 * 1024)) { data, error in
            if let error = error {
                print("Error downloading image: \(error)")
            } else if let data = data, let image = UIImage(data: data) {
                self.userProfile.profileImage = image
            }
        }
    }
    
    public func uploadStorageFile(image: UIImage, profileId: String,completed: @escaping (_ message: String) -> Void){
        let storageRef = storage.reference().child("\(String(describing: profileId))"+"/images/image.jpg")
        
        // cut image mb in half
        let data = image.jpegData(compressionQuality: 0.5)
        
        // if data is less than 2mb, save image; if not display alert
        if data?.count ?? 0 < 2000000{
            let metadata = StorageMetadata()
            metadata.contentType = "image/jpg"
            
            if let data = data {
                storageRef.putData(data, metadata: metadata) { (metadata, error) in
                    if let error = error {
                        print("Error while uploading file: ", error)
                        completed("error")
                    }
                    
                    if let metadata = metadata {
                        print("Metadata: ", metadata)
                    }
                }
                completed("success")
            }
        }
        else {
            //will display alert
            completed("image too large")
        }
    }
}
