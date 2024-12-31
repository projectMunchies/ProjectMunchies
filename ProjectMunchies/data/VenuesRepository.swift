//
//  VenuesRepository.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 5/27/24.
//

import Foundation
import Firebase

class VenuesRepository {
    let db = Firestore.firestore()
    
    public func Get(venueId: String) async throws -> VenueModel {
        var venue = emptyVenueModel
        let snapshot = try await db.collection("venues")
            .whereField("id", isEqualTo: venueId)
            .limit(to: 1)
            .getDocuments()
        
        snapshot.documents.forEach { documentSnapshot in
            let documentData = documentSnapshot.data()
            
            venue.id = documentData["id"] as! String
            venue.name = documentData["name"] as! String
            venue.rating = documentData["rating"] as? Int ?? 0
            venue.address = documentData["address"] as? String ?? ""
            venue.hasBrunch = documentData["hasBrunch"] as? Bool ?? false
            venue.reviewIds = documentData["reviewIds"] as? [String] ?? []
            venue.specialIds = documentData["specialIds"] as? [String] ?? []
            venue.hasHappyHour = documentData["hasHappyHour"] as? Bool ?? false
        }
        return venue
    }
    
    public func Get(venueIds: [String]) async throws -> [VenueModel] {
        var venues: [VenueModel] = []
        let snapshot = try await db.collection("venues")
            .whereField("id", in: venueIds)
            .limit(to: 10)
            .getDocuments()
        
        snapshot.documents.forEach { documentSnapshot in
            let documentData = documentSnapshot.data()
            var venue = emptyVenueModel
            
            venue.id = documentData["id"] as! String
            venue.name = documentData["name"] as! String
            venue.rating = documentData["rating"] as? Int ?? 0
            venue.address = documentData["address"] as? String ?? ""
            venue.hasBrunch = documentData["hasBrunch"] as? Bool ?? false
            venue.reviewIds = documentData["reviewIds"] as? [String] ?? []
            venue.specialIds = documentData["specialIds"] as? [String] ?? []
            venue.hasHappyHour = documentData["hasHappyHour"] as? Bool ?? false
            
            venues.append(venue)
        }
        return venues
    }
}
