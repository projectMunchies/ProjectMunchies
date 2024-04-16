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
                            if !data.isEmpty {
                                let newReview = ReviewModel(
                                    id: data["id"] as? String ?? "",
                                    title: data["title"] as? String ?? "",
                                    body: data["body"] as? String ?? "",
                                    profileId: data["profileId"] as? String ?? "",
                                    venueId: data["venueId"] as? String ?? "",
                                    timeStamp: data["timeStamp"] as? Date ?? Date(),
                                    thumbsUp: data["thumbsUp"] as? Int ?? 0,
                                    rating: data["rating"] as? Int ?? 0 // Add the rating property
                                )
                                self.newReviews.append(newReview)
                            }
                        }
                    completed(self.newReviews)
                }
            }
    }
    
    func searchVenues(searchText: String, completed: @escaping ([VenueModel]) -> Void) {
        let query = db.collection("venues")
            .whereField("name", isGreaterThanOrEqualTo: searchText)
            .whereField("name", isLessThanOrEqualTo: searchText + "\u{f8ff}")
            .limit(to: 10)
        
        query.getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Error searching venues: \(error)")
                completed([])
            } else {
                let venues = querySnapshot?.documents.compactMap { document -> VenueModel? in
                    let data = document.data()
                    return VenueModel(
                        id: document.documentID,
                        name: data["name"] as? String ?? "",
                        coordinates: CLLocationCoordinate2D(latitude: 0.0, longitude: 0.0),
                        address: data["address"] as? String ?? "",
                        reviews: [],
                        specials: []
                    )
                } ?? []
                completed(venues)
            }
        }
    }
    
    
       func incrementThumbsUp(for review: ReviewModel) {
           if let index = newReviews.firstIndex(where: { $0.id == review.id }) {
               var updatedReview = newReviews[index]
               updatedReview.thumbsUp += 1
               newReviews[index] = updatedReview
               
               // Move the review to reviews if it reaches a certain threshold of thumbs up
               if updatedReview.thumbsUp >= 10 {
                   newReviews.remove(at: index)
                   reviews.append(updatedReview)
               }
           } else if let index = reviews.firstIndex(where: { $0.id == review.id }) {
               var updatedReview = reviews[index]
               updatedReview.thumbsUp += 1
               reviews[index] = updatedReview
           }
       }
    
    
    
    
    var popularReviews: [ReviewModel] {
        return reviews.sorted(by: { $0.thumbsUp > $1.thumbsUp })
    }
    
    func addNewReview(newReview: ReviewModel, venueName: String, completed: @escaping (Bool) -> Void) {
           var reviewData: [String: Any] = [
               "id": newReview.id,
               "title": venueName,
               "body": newReview.body,
               "profileId": newReview.profileId,
               "venueId": newReview.venueId,
               "timeStamp": newReview.timeStamp,
               "thumbsUp": newReview.thumbsUp,
               "rating": newReview.rating
           ]
           
        DispatchQueue.main.async {
                self.objectWillChange.send()
                self.newReviews.insert(newReview, at: 0)
                
               
               self.db.collection("reviews").document(newReview.id).setData(reviewData) { error in
                   if let error = error {
                       print("Error adding new review: \(error)")
                       completed(false)
                   } else {
                       print("New review added successfully")
                       completed(true)
                   }
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
                            if !data.isEmpty {
                                let review = ReviewModel(
                                    id: data["id"] as? String ?? "",
                                    title: data["title"] as? String ?? "",
                                    body: data["body"] as? String ?? "",
                                    profileId: data["profileId"] as? String ?? "",
                                    venueId: data["venueId"] as? String ?? "",
                                    timeStamp: data["timeStamp"] as? Date ?? Date(),
                                    thumbsUp: data["thumbsUp"] as? Int ?? 0,
                                    rating: data["rating"] as? Int ?? 0 // Add the rating property
                                )
                                self.reviews.append(review)
                            }
                        }
                    completed(self.reviews)
                }
            }
    }
}
