//
//  HomeViewModel.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 8/11/23.
//

import Foundation
import UIKit
import Firebase
import FirebaseStorage
import FirebaseAuth

class HomeViewModel: ObservableObject {
    let storage = Storage.storage()
    let db = Firestore.firestore()
    
    @Published var profileImage: UIImage = UIImage()
    @Published var userProfile: ProfileModel = ProfileModel(id: "", fullName: "", location: "", description: "", gender: "", fcmTokens: [], messageThreadIds: [])
    @Published var foodFilter: FoodFilterModel = FoodFilterModel(id: "", category: "", type: "", gender: "", location: "", ageRangeFrom: "", ageRangeTo: "")
    
    
    public func getUserProfile(completed: @escaping (_ userProfileId: String) -> Void) {
        db.collection("profiles")
                 .whereField("userId", isEqualTo: Auth.auth().currentUser?.uid as Any)
                 .getDocuments() { (querySnapshot, err) in
                     if let err = err {
                         print("Error getting documents: \(err)")
                         completed("")
                     } else {
                         for document in querySnapshot!.documents {
                             //                        print("\(document.documentID) => \(document.data())")
                             let data = document.data()
                             if !data.isEmpty{
                                 self.userProfile = ProfileModel(id: data["id"] as? String ?? "", fullName: data["fullName"] as? String ?? "", location: data["location"] as? String ?? "", description: data["description"] as? String ?? "", gender: data["gender"] as? String ?? "", fcmTokens: data["fcmTokens"] as? [String] ?? [], messageThreadIds: data["messageThreadIds"] as? [String] ?? [])
                             }
                         }
                         completed(self.userProfile.id)
                     }
                 }
    }
    
    public func createUserProfile(completed: @escaping (_ newUserProfileId: String) -> Void) {
        let id = UUID().uuidString
        let docData: [String: Any] = [
            "id": id,
            "fullName": Auth.auth().currentUser?.displayName as Any,
            "location": "",
            "description": "",
            "gender": "",
            "userId": Auth.auth().currentUser?.uid as Any,
            "messageThreadIds": [],
        ]
        
        let docRef = db.collection("profiles").document(id)
        
        docRef.setData(docData) {error in
            if let error = error{
                print("Error creating new userProfile: \(error)")
                completed("")
            } else {
                print("Successfully created userProfile!")
                self.userProfile.id = id
                self.userProfile.fullName = Auth.auth().currentUser?.displayName ?? ""
                completed(self.userProfile.id)
            }
        }
    }

    
    
    public func getImageStorageFile(profileId: String) {
        let imageRef = storage.reference().child("\(String(describing: profileId))"+"/images/image.jpg")
             
             // Download in memory with a maximum allowed size of 1MB (1 * 1024 * 1024 bytes)
             imageRef.getData(maxSize: Int64(1 * 1024 * 1024)) { data, error in
                 if let error = error {
                     // Uh-oh, an error occurred!
                     print("Error getting file: ", error)
                 } else {
                     let image = UIImage(data: data!)
                     self.profileImage = image!
                     
                 }
             }
    }
    
    public func uploadStorageFile(image: UIImage, profileId: String){
         let storageRef = storage.reference().child("\(String(describing: profileId))"+"/images/image.jpg")
         
         let data = image.jpegData(compressionQuality: 0.2)
         
         let metadata = StorageMetadata()
         metadata.contentType = "image/jpg"
         
         if let data = data {
             storageRef.putData(data, metadata: metadata) { (metadata, error) in
                 if let error = error {
                     print("Error while uploading file: ", error)
                 }
                 
                 if let metadata = metadata {
                     print("Metadata: ", metadata)
                 }
             }
         }
     }

}

