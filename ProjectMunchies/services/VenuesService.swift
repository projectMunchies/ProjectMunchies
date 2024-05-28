//
//  VenuesService.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 5/27/24.
//

import Foundation
import Firebase
import MapKit


class VenuesService: ObservableObject {
    private let venuesRespository = VenuesRespository()
    private let fbStorageRespository = FbStorageRespository()
    
    public func getVenue(venueId: String, completed: @escaping (_ venueResult: VenueModel) -> Void) {
        venuesRespository.Get(venueId: venueId) { (responseVenue) -> Void in
            if responseVenue.id != "" {
               completed(responseVenue)
            } else {
                completed(emptyVenueModel)
            }
        }
    }

    public func getVenuesNewSpecials(newSpecials: [SpecialModel] ,completed: @escaping (_ specialsVenues: [VenueModel]) -> Void) {
      
      
        if !newSpecials.isEmpty {
            var venueIds = newSpecials.map { $0.venueId }
        
            
            venuesRespository.Get(venueId: "") {(_ venuess: VenueModel) -> Void in
                
                
            }
            
            
            
            
//            query = db.collection("venues")
//                .whereField("id", in: venueIds)
//                .limit(to: 10)
//            
//            query
//                .getDocuments() { (querySnapshot, err) in
//                    if let err = err {
//                        print("Error getting specialsVenues documents: \(err)")
//                        completed([])
//                    } else {
//                        for document in querySnapshot!.documents {
//                            let data = document.data()
//                            if !data.isEmpty{
//                                var specialVenue = VenueModel(id: data["id"] as? String ?? "", name: data["name"] as? String ?? "", coordinates: data["coordinates"] as? CLLocationCoordinate2D ?? CLLocationCoordinate2D(latitude: 0.0, longitude: 0.0), address: data["address"] as? String ?? "", reviews: data["reviews"] as? [ReviewModel] ?? [], specials: data["specials"] as? [SpecialModel] ?? [])
//                             
//                                // after finding matching venue, append associated special
//                                specialVenue.specials.append(newSpecials.first { $0.venueId == specialVenue.id } ?? specialSample)
//                                
//                                self.specialsVenues.append(specialVenue)
//                            }
//                        }
//                        completed(self.specialsVenues)
//                    }
//                }
        }
    }
    
    public func getVenuesNewReviews(completed: @escaping (_ profileResult: ProfileModel) -> Void) {
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
        
//        profilesRespository.Create(newId: id, newProfile: docData) {(responseProfile) -> Void in
//            if !responseProfile.isEmpty {
//              // create new profile image
//                
//            }
       // }
    
    }
    
}
