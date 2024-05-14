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
    
    
    
    
    
    @Published private var mutablePopularReviews: [ReviewModel] = []
    @Published var reviews : [ReviewModel] = []
    @Published var newReviews : [ReviewModel] = []
    @Published var reviewsVenues : [VenueModel] = []
    @Published var submittedReviews: [ReviewModel] = []
    @Published var allReviews: [ReviewModel] = []
    @Published var likedReviews: [ReviewModel] = []
    
    
    
    
    
    public func getAllNewReviews(completed: @escaping (_ newReviews: [ReviewModel]) -> Void) {
        var query: Query!
        
        query = db.collection("reviews")
            .whereField("timeStamp", isGreaterThanOrEqualTo: Date.today().previous(.sunday))
            .order(by: "timeStamp", descending: true)
            .limit(to: 10)
        
        query.getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting new reviews documents: \(err)")
                completed([])
            } else {
                var uniqueReviews: [ReviewModel] = []
                
                for document in querySnapshot!.documents {
                    let data = document.data()
                    if !data.isEmpty {
                        let timestamp = data["timeStamp"] as? Timestamp
                        let reviewCreationDate = timestamp?.dateValue() ?? Date()
                        
                        let newReview = ReviewModel(
                            id: data["id"] as? String ?? "",
                            title: data["title"] as? String ?? "",
                            body: data["body"] as? String ?? "",
                            profileId: data["profileId"] as? String ?? "",
                            venueId: data["venueId"] as? String ?? "",
                            timeStamp: reviewCreationDate,
                            thumbsUp: data["thumbsUp"] as? Int ?? 0,
                            isLiked: data["isLiked"] as? Bool ?? false,
                            rating: data["rating"] as? Int ?? 0
                        )
                        
                        if !uniqueReviews.contains(where: { $0.id == newReview.id }) {
                            uniqueReviews.append(newReview)
                        }
                    }
                }
                
                self.newReviews = uniqueReviews
                completed(uniqueReviews)
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
    
    var reviewsWithElapsedTime: [(ReviewModel, String)] {
        liveReviewSamples.map { review in
            let elapsedTime = Date().timeAgoDisplay(from: review.timeStamp)
            return (review, elapsedTime)
        }
    }
    var popularReviews: [ReviewModel] {
        newReviews.filter { $0.isLiked && $0.thumbsUp > 0 }.sorted { $0.thumbsUp > $1.thumbsUp }
    }
    
    func addToLikedReviews(review: ReviewModel) {
        if !likedReviews.contains(where: { $0.id == review.id }) {
            likedReviews.append(review)
            print("Review added to liked reviews: \(review.id)") // Add this print statement
        }
    }
    
    func removeFromLikedReviews(reviewId: String) {
        likedReviews.removeAll(where: { $0.id == reviewId })
    }
    
    func fetchAllReviews(completed: @escaping ([ReviewModel]) -> Void) {
        let query = db.collection("reviews")
            .order(by: "timeStamp", descending: true)
            .limit(to: 10)
        
        query.getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Error fetching all reviews: \(error)")
                completed([])
            } else {
                var uniqueReviews: [ReviewModel] = []
                
                for document in querySnapshot!.documents {
                    let data = document.data()
                    let timestamp = data["timeStamp"] as? Timestamp
                    let reviewCreationDate = timestamp?.dateValue() ?? Date()
                    
                    let review = ReviewModel(
                        id: data["id"] as? String ?? "",
                        title: data["title"] as? String ?? "",
                        body: data["body"] as? String ?? "",
                        profileId: data["profileId"] as? String ?? "",
                        venueId: data["venueId"] as? String ?? "",
                        timeStamp: reviewCreationDate,
                        thumbsUp: data["thumbsUp"] as? Int ?? 0,
                        isLiked: data["isLiked"] as? Bool ?? false,
                        rating: data["rating"] as? Int ?? 0
                    )
                    
                    if !uniqueReviews.contains(where: { $0.id == review.id }) {
                        uniqueReviews.append(review)
                    }
                }
                
                DispatchQueue.main.async {
                    self.allReviews = uniqueReviews
                    completed(uniqueReviews)
                }
            }
        }
    }

    func fetchLikedReviews(completion: @escaping ([ReviewModel]) -> Void) {
        let query = db.collection("reviews")
            .whereField("isLiked", isEqualTo: true)
        
        query.getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Error fetching liked reviews: \(error)")
                completion([])
            } else {
                var uniqueReviews: [ReviewModel] = []
                
                for document in querySnapshot!.documents {
                    let data = document.data()
                    let timestamp = data["timeStamp"] as? Timestamp
                    let reviewCreationDate = timestamp?.dateValue() ?? Date()
                    
                    let review = ReviewModel(
                        id: data["id"] as? String ?? "",
                        title: data["title"] as? String ?? "",
                        body: data["body"] as? String ?? "",
                        profileId: data["profileId"] as? String ?? "",
                        venueId: data["venueId"] as? String ?? "",
                        timeStamp: reviewCreationDate,
                        thumbsUp: data["thumbsUp"] as? Int ?? 0,
                        isLiked: data["isLiked"] as? Bool ?? false,
                        rating: data["rating"] as? Int ?? 0
                    )
                    
                    if !uniqueReviews.contains(where: { $0.id == review.id }) {
                        uniqueReviews.append(review)
                    }
                }
                
                DispatchQueue.main.async {
                    self.likedReviews = uniqueReviews
                    completion(uniqueReviews)
                }
            }
        }
    }
    func incrementThumbsUp(for review: ReviewModel) {
        if let index = newReviews.firstIndex(where: { $0.id == review.id }) {
            var updatedReview = newReviews[index]
            updatedReview.thumbsUp += 1
            updatedReview.isLiked = true // Set isLiked to true
            newReviews[index] = updatedReview
            
            // Add the review to likedReviews if it's not already present
            if !likedReviews.contains(where: { $0.id == review.id }) {
                likedReviews.append(updatedReview)
            }
        }
    }
    func addNewReview(newReview: ReviewModel, venueName: String, completed: @escaping (Bool) -> Void) {
        var reviewData: [String: Any] = [
            "id": newReview.id,
            "title": venueName,
            "body": newReview.body,
            "profileId": newReview.profileId,
            "venueId": newReview.venueId,
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
                    
                    // Append the new review to the submittedReviews array
                    self.submittedReviews.append(newReview)
                }
            }
        }
    }
    
    public func getReviewsVenues(newReviews: [ReviewModel], completed: @escaping (_ reviewsVenues: [VenueModel]) -> Void) {
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
                            if !data.isEmpty {
                                var reviewVenue = VenueModel(
                                    id: data["id"] as? String ?? "",
                                    name: data["name"] as? String ?? "",
                                    coordinates: data["coordinates"] as? CLLocationCoordinate2D ?? CLLocationCoordinate2D(latitude: 0.0, longitude: 0.0),
                                    address: data["address"] as? String ?? "",
                                    reviews: data["reviews"] as? [ReviewModel] ?? [],
                                    specials: data["specials"] as? [SpecialModel] ?? []
                                )
                                
                                if let review = newReviews.first(where: { $0.venueId == reviewVenue.id }) {
                                    reviewVenue.reviews.append(review)
                                }
                                
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
                            let timestamp = data["timeStamp"] as? Timestamp
                            let reviewCreationDate = timestamp?.dateValue() ?? Date()
                            
                            let createdAtTimestamp = data["createdAt"] as? Timestamp
                            let createdAt = createdAtTimestamp?.dateValue() ?? Date()
                            
                            let review = ReviewModel(
                                id: data["id"] as? String ?? "",
                                     title: data["title"] as? String ?? "",
                                     body: data["body"] as? String ?? "",
                                     profileId: data["profileId"] as? String ?? "",
                                     venueId: data["venueId"] as? String ?? "",
                                     timeStamp: reviewCreationDate,
                                     thumbsUp: data["thumbsUp"] as? Int ?? 0,
                                     isLiked: data["isLiked"] as? Bool ?? false,
                                     rating: data["rating"] as? Int ?? 0
                            )
                            self.reviews.append(review)
                        }
                    }
                    completed(self.reviews)
                }
            }
    }
}
