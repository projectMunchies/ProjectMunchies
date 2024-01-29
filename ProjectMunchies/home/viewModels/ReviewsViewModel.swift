//
//  ReviewsViewModel.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 1/29/24.
//

import Foundation
import UIKit
import Firebase
import FirebaseStorage
import FirebaseAuth

class ReviewsViewModel: ObservableObject {
    let storage = Storage.storage()
    let db = Firestore.firestore()
    
    @Published var reviews : [ReviewModel] = []
    @Published var newReviews : [ReviewModel] = []
    
    public func getAllNewReviews(profileId: String, completed: @escaping (_ newReviews: [ReviewModel]) -> Void) {
        var query: Query!
        
        query = db.collection("reviews")
            .whereField("timeStamp", isGreaterThanOrEqualTo: Date.today().previous(.sunday))
            .limit(to: 10)
        
        query
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting new reviews documents: \(err)")
                    completed([])
                } else {
                    for document in querySnapshot!.documents {
                        let data = document.data()
                        if !data.isEmpty{
                            let newReview = ReviewModel(id: data["id"] as? String ?? "", title: data["title"] as? String ?? "", body: data["body"] as? String ?? "", profileId: data["profileId"] as? String ?? "", timeStamp: data["timeStamp"] as? Date ?? Date())
                            
                            self.newReviews.append(newReview)
                        }
                    }
                    completed(self.newReviews)
                }
            }
    }
    
    public func getReviews(profileId: String, completed: @escaping (_ reviews: [ReviewModel]) -> Void) {
        var query: Query!
        
        query = db.collection("reviews")
            .limit(to: 10)
        
        query
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting reviews documents: \(err)")
                    completed([])
                } else {
                    for document in querySnapshot!.documents {
                        let data = document.data()
                        if !data.isEmpty{
                            let review = ReviewModel(id: data["id"] as? String ?? "", title: data["title"] as? String ?? "", body: data["body"] as? String ?? "", profileId: data["profileId"] as? String ?? "", timeStamp: data["timeStamp"] as? Date ?? Date())
                            
                            self.reviews.append(review)
                        }
                    }
                    completed(self.reviews)
                }
            }
    }
}
