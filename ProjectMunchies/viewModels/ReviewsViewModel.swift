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
import MapKit

class ReviewsViewModel: ObservableObject {
    let storage = Storage.storage()
    let db = Firestore.firestore()
    
    @Published var reviews : [ReviewModel] = []
    @Published var newReviews : [ReviewModel] = []
    @Published var reviewsVenues : [VenueModel] = []
    
    public func getAllNewReviews(completed: @escaping (_ newReviews: [ReviewModel]) -> Void) {
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
                            let newReview = ReviewModel(
                                id: data["id"] as? String ?? "",
                                title: data["title"] as? String ?? "",
                                body: data["body"] as? String ?? "",
                                userId: data["userId"] as? String ?? "",
                                venueId: data["venueId"] as? String ?? "",
                                timeStamp: data["timeStamp"] as? Date ?? Date(),
                                rating: data["rating"] as? Int ?? 0,
                                activityId: data["activityId"] as? String ?? ""
                            )
                            self.newReviews.append(newReview)
                        }
                    }
                    completed(self.newReviews)
                }
            }
    }
    
    public func getReviewsVenues(newReviews: [ReviewModel] ,completed: @escaping (_ reviewsVenues: [VenueModel]) -> Void) {
        var query: Query!
        
        if !newReviews.isEmpty {
            var venueIds = newReviews.map { $0.venueId }
            
            query = db.collection("venues")
                .whereField("id", in: venueIds)
                .limit(to: 10)
            
            query
                .getDocuments() { (querySnapshot, err) in
                    if let err = err {
                        print("Error getting reviewsVenues documents: \(err)")
                        completed([])
                    } else {
                        for document in querySnapshot!.documents {
                            let data = document.data()
                            if !data.isEmpty{
                                var reviewVenue = VenueModel(id: data["id"] as? String ?? "", name: data["name"] as? String ?? "", coordinates: data["coordinates"] as? CLLocationCoordinate2D ?? CLLocationCoordinate2D(latitude: 0.0, longitude: 0.0), address: data["address"] as? String ?? "", reviews: data["reviews"] as? [ReviewModel] ?? [], specials: data["specials"] as? [SpecialModel] ?? [])
                                
                                // after finding matching venue, append associated review
                                reviewVenue.reviews.append(newReviews.first { $0.venueId == reviewVenue.id } ??  liveReviewSample)
                                
                                self.reviewsVenues.append(reviewVenue)
                            }
                        }
                        completed(self.reviewsVenues)
                    }
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
                            let review = ReviewModel(
                                id: data["id"] as? String ?? "",
                                title: data["title"] as? String ?? "",
                                body: data["body"] as? String ?? "",
                                userId: data["userId"] as? String ?? "",
                                venueId: data["venueId"] as? String ?? "",
                                timeStamp: data["timeStamp"] as? Date ?? Date(),
                                rating: data["rating"] as? Int ?? 0,
                                activityId: data["activityId"] as? String ?? ""
                            )
                            self.reviews.append(review)
                        }
                    }
                    completed(self.reviews)
                }
            }
    }
}
