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
    @Published var userProfile: ProfileModel = ProfileModel(id: "", fullName: "", location: "", description: "", gender: "",age: "", fcmTokens: [], messageThreadIds: [], occupation: "" , hobbies: [], reviewIds: [], isMockData: false)
    @Published var foodFilter: FoodFilterModel = FoodFilterModel(id: "",userProfileId: "",category: "Cuisine", type: "Pick", gender: "Pick", location: "Pick", ageRangeFrom: "18", ageRangeTo: "70", timeStamp: Date())
    @Published var userFoodFilter: FoodFilterModel = FoodFilterModel(id: "",userProfileId: "",category: "Cuisine", type: "Pick", gender: "Pick", location: "Pick", ageRangeFrom: "18", ageRangeTo: "70", timeStamp: Date())
    @Published var foodFilters: [FoodFilterModel] = []
    @Published var lastDoc: DocumentSnapshot!
    
    
    public func getUserProfile(completed: @escaping (_ userProfileId: String) -> Void) {
        db.collection("profiles")
            .whereField("userId", isEqualTo: Auth.auth().currentUser?.uid as Any)
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                    completed("")
                } else {
                    for document in querySnapshot!.documents {
                        let data = document.data()
                        if !data.isEmpty{
                            self.userProfile = ProfileModel(id: data["id"] as? String ?? "", fullName: data["fullName"] as? String ?? "", location: data["location"] as? String ?? "", description: data["description"] as? String ?? "", gender: data["gender"] as? String ?? "", age: data["age"] as? String ?? "", fcmTokens: data["fcmTokens"] as? [String] ?? [], messageThreadIds: data["messageThreadIds"] as? [String] ?? [],occupation: data["occupation"] as? String ?? "", hobbies: data["hobbies"] as? [String] ?? [], reviewIds: data["reviewIds"] as? [String] ?? [], isMockData: data["isMockData"] as? Bool ?? false)
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
        
        // Download in memory with a maximum allowed size of 2MB (2 * 1024 * 1024 bytes)
        imageRef.getData(maxSize: Int64(2 * 1024 * 1024)) { data, error in
            if let error = error {
                print("Error getting file: ", error)
            } else {
                let image = UIImage(data: data!)
                self.profileImage = image!
                
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
    
    public func getUserFilter(completed: @escaping (_ userFilter: FoodFilterModel) -> Void) {
        db.collection("filters")
            .whereField("userProfileId", isEqualTo: userProfile.id)
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                    completed(FoodFilterModel(id: "", userProfileId: "", category: "", type: "", gender: "", location: "", ageRangeFrom: "", ageRangeTo: "", timeStamp: Date()))
                } else {
                    for document in querySnapshot!.documents {
                        //                        print("\(document.documentID) => \(document.data())")
                        let data = document.data()
                        if !data.isEmpty{
                            self.userFoodFilter = FoodFilterModel(id: data["id"] as? String ?? "", userProfileId: data["userProfileId"] as? String ?? "", category: data["category"] as? String ?? "Cuisine", type: data["type"] as? String ?? "Pick", gender: data["gender"] as? String ?? "Pick", location: data["location"] as? String ?? "Pick", ageRangeFrom: data["ageRangeFrom"] as? String ?? "18", ageRangeTo: data["ageRangeTo"] as? String ?? "70", timeStamp: data["timeStamp"] as? Date ?? Date())
                        }
                    }
                    completed(self.userFoodFilter)
                }
            }
    }
    
    public func createUserFilter(userFilter: FoodFilterModel) {
        let id = UUID().uuidString
        let docData: [String: Any] = [
            "id": id,
            "userProfileId": userProfile.id,
            "category": userFilter.category,
            "type": userFilter.type,
            "gender": userFilter.gender,
            "location": userFilter.location,
            "ageRangeFrom": userFilter.ageRangeFrom,
            "ageRangeTo": userFilter.ageRangeTo,
            "timeStamp": Date()
        ]
        
        let docRef = db.collection("filters").document(id)
        
        docRef.setData(docData) {error in
            if let error = error{
                print("Error creating new userFoodFilter: \(error)")
            } else {
                print("Successfully created userFoodFilter!")
            }
        }
    }
    
    public func updateUserFilter(userFilterId: String, userFilter: FoodFilterModel) {
        let docData: [String: Any] = [
            "category": userFilter.category,
            "type": userFilter.type,
            "gender": userFilter.gender,
            "location": userFilter.location,
            "ageRangeFrom": userFilter.ageRangeFrom,
            "ageRangeTo": userFilter.ageRangeTo,
            "timeStamp": Date()
        ]
        
        let docRef = db.collection("filters").document(userFilterId)
        
        docRef.updateData(docData) {error in
            if let error = error{
                print("Error updating userFilter:\(error)")
            }else {
                print("successfully updated userFilter!")
            }
        }
    }
}
