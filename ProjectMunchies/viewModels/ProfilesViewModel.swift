//
//  ProfilesViewModel.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 8/11/23.
//

import Foundation
import UIKit
import Firebase
import Contacts

class ProfilesViewModel: ObservableObject {
    private let service = ProfilesService()
    
    @Published var profileImage: UIImage = UIImage()
    @Published var userProfile: ProfileModel = emptyProfileModel
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    @Published var username: String = "hey"
   

    
    
    public func GetUserProfile() async throws {
        let userProfile = try await service.GetProfile(profileId: Auth.auth().currentUser?.uid ?? "")
        
        if userProfile.id != "" {
            self.userProfile = userProfile
   
        }
    }
    
    public func CreateUserProfile() async throws {
        let createdProfile = try await service.CreateProfile()
        
        if createdProfile.id != "" {
            self.userProfile = createdProfile
          
        }
    }
    
    func loadUserData() {
        guard let userId = Auth.auth().currentUser?.uid else {
            print("User not authenticated")
            return
        }
        
        isLoading = true
        
        let db = Firestore.firestore()
        db.collection("profiles").document(userId).getDocument { [weak self] (document, error) in
            defer {
                DispatchQueue.main.async {
                    self?.isLoading = false
                }
            }
            
            if let error = error {
                print("Error fetching user data: \(error.localizedDescription)")
                self?.errorMessage = "Failed to fetch user data"
                return
            }
            
            if let document = document, document.exists {
                let data = document.data()
                DispatchQueue.main.async {
                    self?.username = data?["username"] as? String ?? ""
                    

                }
            }
        }
    }
}
    


