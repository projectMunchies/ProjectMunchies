//
//  SpecialsViewModel.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 1/29/24.
//

import Foundation
import UIKit
import MapKit
import Firebase
import FirebaseStorage
import FirebaseAuth

class SpecialsViewModel: ObservableObject {
    let storage = Storage.storage()
    let db = Firestore.firestore()
    
    @Published var specials : [SpecialModel] = []
    @Published var newSpecials : [SpecialModel] = []
    @Published var specialsVenues : [VenueModel] = []
    
    public func getAllNewSpecials(completed: @escaping (_ newSpecials: [SpecialModel]) -> Void) {
        var query: Query!
        
        query = db.collection("specials")
            .whereField("creationDate", isGreaterThanOrEqualTo: Date.today().previous(.sunday))
            .limit(to: 10)
        
        query
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting new specials documents: \(err)")
                    completed([])
                } else {
                    for document in querySnapshot!.documents {
                        let data = document.data()
                        if !data.isEmpty{
                           let newSpecial = SpecialModel(id: data["id"] as? String ?? "", name: data["name"] as? String ?? "", type: data["type"] as? String ?? "", venueId: data["venueId"] as? String ?? "", description: data["description"] as? String ?? "", creationDate: data["creationDate"] as? Date ?? Date(), expirationDate: data["expirationDate"] as? Date ?? Date())
                            
                            self.newSpecials.append(newSpecial)
                        }
                    }
                    completed(self.newSpecials)
                }
            }
    }
    
    
    public func getSpecialsVenues(newSpecials: [SpecialModel] ,completed: @escaping (_ specialsVenues: [VenueModel]) -> Void) {
        var query: Query!
      
        if !newSpecials.isEmpty {
            var venueIds = newSpecials.map { $0.venueId }
            
            query = db.collection("venues")
                .whereField("id", in: venueIds)
                .limit(to: 10)
            
            query
                .getDocuments() { (querySnapshot, err) in
                    if let err = err {
                        print("Error getting specialsVenues documents: \(err)")
                        completed([])
                    } else {
                        for document in querySnapshot!.documents {
                            let data = document.data()
                            if !data.isEmpty{
                                var specialVenue = VenueModel(id: data["id"] as? String ?? "", name: data["name"] as? String ?? "", coordinates: data["coordinates"] as? CLLocationCoordinate2D ?? CLLocationCoordinate2D(latitude: 0.0, longitude: 0.0), address: data["address"] as? String ?? "", reviews: data["reviews"] as? [ReviewModel] ?? [], specials: data["specials"] as? [SpecialModel] ?? [])
                             
                                // after finding matching venue, append associated special
                                specialVenue.specials.append(newSpecials.first { $0.venueId == specialVenue.id } ?? specialSample)
                                
                                self.specialsVenues.append(specialVenue)
                            }
                        }
                        completed(self.specialsVenues)
                    }
                }
        }
        completed([])
    }
    
    public func getSpecials(profileId: String, completed: @escaping (_ specials: [SpecialModel]) -> Void) {
        var query: Query!
        
        query = db.collection("specials")
            .limit(to: 10)
        
        query
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting specials documents: \(err)")
                    completed([])
                } else {
                    for document in querySnapshot!.documents {
                        let data = document.data()
                        if !data.isEmpty{
                           let special = SpecialModel(id: data["id"] as? String ?? "", name: data["name"] as? String ?? "", type: data["type"] as? String ?? "", venueId: data["venueId"] as? String ?? "", description: data["description"] as? String ?? "", creationDate: data["creationDate"] as? Date ?? Date(), expirationDate: data["expirationDate"] as? Date ?? Date())
                            
                            self.specials.append(special)
                        }
                    }
                    completed(self.specials)
                }
            }
    }
    
    

}
