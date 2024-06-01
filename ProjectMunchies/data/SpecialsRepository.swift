//
//  SpecialsRepository.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 6/1/24.
//

import Foundation
import Firebase

class SpecialsRepository: ObservableObject{
    let db = Firestore.firestore()
    
    public func Get(specialId: String) async throws -> SpecialModel {
        var special = emptySpecialModel
        let snapshot = try await db.collection("specials")
            .whereField("id", isEqualTo: specialId)
            .limit(to: 1)
            .getDocuments()
        
        snapshot.documents.forEach { documentSnapshot in
            let documentData = documentSnapshot.data()
            
            special.id = documentData["id"] as! String
            special.name = documentData["name"] as! String
            special.type = documentData["type"] as? String ?? ""
            special.venueId = documentData["venueId"] as! String
            special.description = documentData["description"] as? String ?? ""
            special.creationDate = documentData["creationDate"] as! Date
            special.expirationDate = documentData["expirationDate"] as? Date ?? Date.today()
        }
        return special
    }
    
    public func Get(specialIds: [String]) async throws -> [SpecialModel] {
        var specials: [SpecialModel] = []
        let snapshot = try await db.collection("specials")
            .whereField("id", in: specialIds)
            .limit(to: 10)
            .getDocuments()
        
        snapshot.documents.forEach { documentSnapshot in
            let documentData = documentSnapshot.data()
            var special = emptySpecialModel
            
            special.id = documentData["id"] as! String
            special.name = documentData["name"] as! String
            special.type = documentData["type"] as? String ?? ""
            special.venueId = documentData["venueId"] as! String
            special.description = documentData["description"] as? String ?? ""
            special.creationDate = documentData["creationDate"] as! Date
            special.expirationDate = documentData["expirationDate"] as? Date ?? Date.today()
            
            specials.append(special)
        }
        return specials
    }
    
    public func GetAfter(date: Date) async throws -> [SpecialModel] {
        var specials: [SpecialModel] = []
        let snapshot = try await db.collection("specials")
            .whereField("creationDate", isGreaterThan: date)
            .limit(to: 10)
            .getDocuments()
        
        snapshot.documents.forEach { documentSnapshot in
            let documentData = documentSnapshot.data()
            var special = emptySpecialModel
            
            special.id = documentData["id"] as! String
            special.name = documentData["name"] as! String
            special.type = documentData["type"] as? String ?? ""
            special.venueId = documentData["venueId"] as! String
            special.description = documentData["description"] as? String ?? ""
            special.creationDate = documentData["creationDate"] as! Date
            special.expirationDate = documentData["expirationDate"] as? Date ?? Date.today()
            
            specials.append(special)
            
        }
        return specials
    }
}
