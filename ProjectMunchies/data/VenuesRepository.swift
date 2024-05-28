//
//  VenuesRepository.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 5/27/24.
//

import Foundation
import MapKit
import Firebase

class VenuesRespository: ObservableObject{
    let db = Firestore.firestore()
    
    public func Get(venueId: String ,completed: @escaping (_ venue: VenueModel) -> Void) {
        var venue = emptyVenueModel
        var query: Query!
        
        query = db.collection("venues")
            .whereField("id", isEqualTo: venueId)
            .limit(to: 1)
        
        query
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting venue document: \(err)")
                    completed(emptyVenueModel)
                } else {
                    for document in querySnapshot!.documents {
                        let data = document.data()
                        if !data.isEmpty{
                            venue = VenueModel(id: data["id"] as? String ?? "", name: data["name"] as? String ?? "", coordinates: data["coordinates"] as? CLLocationCoordinate2D ?? CLLocationCoordinate2D(latitude: 0.0, longitude: 0.0), address: data["address"] as? String ?? "", reviews: data["reviews"] as? [ReviewModel] ?? [], specials: data["specials"] as? [SpecialModel] ?? [])
                        }
                    }
                    completed(venue)
                }
            }
    }
    
    public func GetAll(venueIds: [String], completed: @escaping (_ venues: [VenueModel]) -> Void) {
        var query: Query!
        var venues: [VenueModel] = []
        
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
                            var venue = VenueModel(id: data["id"] as? String ?? "", name: data["name"] as? String ?? "", coordinates: data["coordinates"] as? CLLocationCoordinate2D ?? CLLocationCoordinate2D(latitude: 0.0, longitude: 0.0), address: data["address"] as? String ?? "", reviews: data["reviews"] as? [ReviewModel] ?? [], specials: data["specials"] as? [SpecialModel] ?? [])
                            
                            venues.append(venue)
                        }
                    }
                    completed(venues)
                }
            }
    }
}
