//
//  ReviewsRepository.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 6/1/24.
//

import Foundation
import Firebase

class ReviewsRepository: ObservableObject{
    let db = Firestore.firestore()
    
    public func Get(reviewId: String) async throws -> ReviewModel {
        var review = emptyReviewModel
        let snapshot = try await db.collection("reviews")
            .whereField("id", isEqualTo: reviewId)
            .limit(to: 1)
            .getDocuments()
        
        snapshot.documents.forEach { documentSnapshot in
            let documentData = documentSnapshot.data()
            
            review.id = documentData["id"] as! String
            review.rating = documentData["rating"] as? Int ?? 0
            review.body = documentData["body"] as! String
            review.title = documentData["title"] as! String
            review.profileId = documentData["userId"] as! String
            review.venueId = documentData["venueId"] as! String
            let timeStamp = documentData["timeStamp"] as! Timestamp
            review.timeStamp = timeStamp.dateValue()
            review.activityId = documentData["activityId"] as? String ?? ""
        }
        return review
    }
    
    public func Get(reviewIds: [String]) async throws -> [ReviewModel] {
        var reviews: [ReviewModel] = []
        let snapshot = try await db.collection("reviews")
            .whereField("id", in: reviewIds)
            .limit(to: 10)
            .getDocuments()
        
        snapshot.documents.forEach { documentSnapshot in
            let documentData = documentSnapshot.data()
            var review = emptyReviewModel
            
            review.id = documentData["id"] as! String
            review.rating = documentData["rating"] as? Int ?? 0
            review.body = documentData["body"] as! String
            review.title = documentData["title"] as! String
            review.profileId = documentData["userId"] as! String
            review.venueId = documentData["venueId"] as! String
            let timeStamp = documentData["timeStamp"] as! Timestamp
            review.timeStamp = timeStamp.dateValue()
            review.activityId = documentData["activityId"] as? String ?? ""
            
            reviews.append(review)
        }
        return reviews
    }
    
    public func GetRecent() async throws -> [ReviewModel] {
        var reviews: [ReviewModel] = []
        
        let snapshot = try await db.collection("reviews")
            .whereField("id", isNotEqualTo: "")
            .order(by: "creationDate", descending: true)
            .limit(to: 3)
            .getDocuments()
        
        snapshot.documents.forEach { documentSnapshot in
            let documentData = documentSnapshot.data()
            var review = emptyReviewModel
            
            review.id = documentData["id"] as! String
            review.rating = documentData["rating"] as? Int ?? 0
            review.body = documentData["body"] as! String
            review.title = documentData["title"] as! String
            review.profileId = documentData["profileId"] as! String
            review.venueId = documentData["venueId"] as! String
            let timeStamp = documentData["timeStamp"] as! Timestamp
            review.timeStamp = timeStamp.dateValue()
            review.activityId = documentData["activityId"] as? String ?? ""
            
            reviews.append(review)
        }
        return reviews
    }
}
