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
    @Published var userProfile: ProfileModel = ProfileModel.emptyProfileModel
    @Published var recommendedProfiles: [ProfileModel] = []
    @Published var receivedRequests: [ProfileModel] = []
    @Published var bunchiesContacts: [CNContact] = []
    @Published var chatsContacts: [CNContact] = []
    @Published var username: String = ""
    @Published var greeting: String = ""
    @Published var description: String = ""
    @Published var isLoading: Bool = true
    @Published var errorMessage: String?
    
    public func GetUserProfile() async throws {
        let userProfile = try await service.GetProfile(profileId: Auth.auth().currentUser?.uid ?? "")
        
        if userProfile.id != "" {
            self.userProfile = userProfile
            try await fetchRecommendedProfiles()
        }
    }
    
    public func CreateUserProfile() async throws {
        let createdProfile = try await service.CreateProfile()
        
        if createdProfile.id != "" {
            self.userProfile = createdProfile
            try await fetchRecommendedProfiles()
        }
    }
    
    public func fetchRecommendedProfiles() async throws {
        guard let currentUserId = Auth.auth().currentUser?.uid else {
            throw NSError(domain: "ProfilesViewModel", code: 0, userInfo: [NSLocalizedDescriptionKey: "No authenticated user found"])
        }
        
        let querySnapshot = try await Firestore.firestore().collection("profiles")
            .whereField("id", isNotEqualTo: currentUserId)
            .getDocuments()
        
        self.recommendedProfiles = querySnapshot.documents.compactMap { document in
            let profile = ProfileModel(dictionary: document.data())
            
            let isSimilarLocation = profile.location == self.userProfile.location
            let hasSimilarHobbies = !Set(profile.hobbies).isDisjoint(with: Set(self.userProfile.hobbies))
            let isSimilarOccupation = profile.occupation == self.userProfile.occupation
            let isSimilarAge = profile.age == self.userProfile.age
            
            if isSimilarLocation && hasSimilarHobbies && isSimilarOccupation && isSimilarAge {
                return profile
            } else {
                return nil
            }
        }
    }
    
    func sendRequest(to profileId: String) {
        guard let currentUserId = Auth.auth().currentUser?.uid else { return }
        
        Firestore.firestore().collection("profiles").document(profileId).updateData([
            "requestingUserId": currentUserId
        ])
    }
    
    func fetchReceivedRequests() {
        guard let currentUserId = Auth.auth().currentUser?.uid else { return }
        
        Firestore.firestore().collection("profiles")
            .document(currentUserId)
            .addSnapshotListener { documentSnapshot, error in
                if let error = error {
                    print("Error fetching received requests: \(error.localizedDescription)")
                    return
                }
                
                guard let document = documentSnapshot, document.exists else { return }
                
                if let requestingUserId = document.data()?["requestingUserId"] as? String {
                    self.fetchProfileById(requestingUserId) { profile in
                        if let profile = profile {
                            self.receivedRequests = [profile]
                        }
                    }
                } else {
                    self.receivedRequests = []
                }
            }
    }
    
    private func fetchProfileById(_ profileId: String, completion: @escaping (ProfileModel?) -> Void) {
        Firestore.firestore().collection("profiles").document(profileId).getDocument { snapshot, error in
            if let error = error {
                print("Error fetching profile: \(error.localizedDescription)")
                completion(nil)
                return
            }
            
            guard let data = snapshot?.data() else {
                completion(nil)
                return
            }
            
            let profile = ProfileModel(dictionary: data)
            completion(profile)
        }
    }
    
    func acceptRequest(_ profile: ProfileModel) {
        addToBunchies(profile)
        receivedRequests.removeAll { $0.id == profile.id }
    }
    
    func denyRequest(_ profile: ProfileModel) {
        receivedRequests.removeAll { $0.id == profile.id }
    }
    
    func addToBunchies(_ profile: ProfileModel) {
        let contact = CNMutableContact()
        contact.givenName = profile.fullName.components(separatedBy: " ").first ?? ""
        contact.familyName = profile.fullName.components(separatedBy: " ").dropFirst().joined(separator: " ")
        contact.jobTitle = profile.occupation
        // Add other relevant contact details as needed
        
        bunchiesContacts.append(contact)
        
        // Remove the profile from recommended profiles
        recommendedProfiles.removeAll { $0.id == profile.id }
        
        Task {
            do {
                try await fetchRecommendedProfiles()
            } catch {
                print("Error fetching recommended profiles: \(error.localizedDescription)")
            }
        }
    }
    
    func removeFromBunchies(_ contact: CNContact) {
        if let index = bunchiesContacts.firstIndex(where: { $0.identifier == contact.identifier }) {
            bunchiesContacts.remove(at: index)
        }
    }
    
    func startChat(with contact: CNContact) {
        if !chatsContacts.contains(where: { $0.identifier == contact.identifier }) {
            chatsContacts.insert(contact, at: 0) // Insert at the beginning of the array
        }
    }
    
    func loadUserData() {
        guard let userId = Auth.auth().currentUser?.uid else {
            self.errorMessage = "No authenticated user"
            self.isLoading = false
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users").document(userId).getDocument { [weak self] (document, error) in
            DispatchQueue.main.async {
                self?.isLoading = false
                
                if let error = error {
                    self?.errorMessage = "Error: \(error.localizedDescription)"
                    return
                }
                
                if let document = document, document.exists {
                    let data = document.data()
                    self?.username = data?["username"] as? String ?? ""
                    self?.greeting = data?["greeting"] as? String ?? ""
                    self?.description = data?["description"] as? String ?? ""
                } else {
                    // Create the document if it doesn't exist
                    let initialData = [
                        "username": "",
                        "greeting": "",
                        "description": ""
                    ]
                    db.collection("users").document(userId).setData(initialData) { error in
                        if let error = error {
                            self?.errorMessage = "Error creating user document: \(error.localizedDescription)"
                        } else {
                            self?.username = ""
                            self?.greeting = ""
                            self?.description = ""
                        }
                    }
                }
            }
        }
    }
}

