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
    @Published var reviews: [ReviewModel] = []
    @Published var newReviews: [ReviewModel] = []
    @Published var reviewsVenues: [VenueModel] = []
    @Published var submittedReviews: [ReviewModel] = []
    @Published var userReviews: [ReviewModel] = []
    @Published var userLikedReviews: [ReviewModel] = []
    @Published var userRating: [String: Int] = [:]
    
    public func getAllNewReviews(completed: @escaping (_ newReviews: [ReviewModel]) -> Void) {
        var query: Query!
        
        query = db.collection("reviews")
            .order(by: "timeStamp", descending: true)
        
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
                            username: data["username"] as? String ?? "",
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
    
    var popularReviews: [ReviewModel] {
        newReviews.filter { $0.isLiked && $0.thumbsUp > 0 }.sorted { $0.thumbsUp > $1.thumbsUp }
    }
    
    func addToLikedReviews(review: ReviewModel) {
        if !userLikedReviews.contains(where: { $0.id == review.id }) {
            userLikedReviews.append(review)
            print("Review added to liked reviews: \(review.id)")
        }
    }
    
    func removeFromLikedReviews(reviewId: String) {
        userLikedReviews.removeAll(where: { $0.id == reviewId })
    }
    
    func incrementThumbsUp(for review: ReviewModel) {
        if let index = newReviews.firstIndex(where: { $0.id == review.id }) {
            var updatedReview = newReviews[index]
            updatedReview.thumbsUp += 1
            updatedReview.isLiked = true
            newReviews[index] = updatedReview
            
            if !userLikedReviews.contains(where: { $0.id == review.id }) {
                userLikedReviews.append(updatedReview)
            }
        }
    }
    
    func addNewReview(newReview: ReviewModel, venueName: String, completed: @escaping (Bool) -> Void) {
        var reviewData: [String: Any] = [
            "id": newReview.id,
            "title": venueName,
            "body": newReview.body,
            "username": newReview.username,
            "venueId": newReview.venueId,
            "timeStamp": Timestamp(date: newReview.timeStamp),
            "thumbsUp": newReview.thumbsUp,
            "isLiked": newReview.isLiked,
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
                    
                    self.getAllNewReviews { _ in }
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
            
            query.getDocuments() { (querySnapshot, err) in
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
        
        query.getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting reviews documents: \(err)")
                completed([])
            } else {
                for document in querySnapshot!.documents {
                    let data = document.data()
                    if !data.isEmpty {
                        let timestamp = data["timeStamp"] as? Timestamp
                        let reviewCreationDate = timestamp?.dateValue() ?? Date()
                        
                        let review = ReviewModel(
                            id: data["id"] as? String ?? "",
                            title: data["title"] as? String ?? "",
                            body: data["body"] as? String ?? "",
                            username: data["username"] as? String ?? "",
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
    
    public func getUserReviews(profileId: String, completed: @escaping ([ReviewModel]) -> Void) {
        var query: Query!
        
        query = db.collection("reviews")
            .order(by: "timeStamp", descending: true)
        
        query.getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting user reviews documents: \(err)")
                completed([])
            } else {
                let allReviews = querySnapshot?.documents.compactMap { document -> ReviewModel? in
                    let data = document.data()
                    if !data.isEmpty {
                        let timestamp = data["timeStamp"] as? Timestamp
                        let reviewCreationDate = timestamp?.dateValue() ?? Date()
                        
                        return ReviewModel(
                            id: data["id"] as? String ?? "",
                            title: data["title"] as? String ?? "",
                            body: data["body"] as? String ?? "",
                            username: data["username"] as? String ?? "",
                            venueId: data["venueId"] as? String ?? "",
                            timeStamp: reviewCreationDate,
                            thumbsUp: data["thumbsUp"] as? Int ?? 0,
                            isLiked: data["isLiked"] as? Bool ?? false,
                            rating: data["rating"] as? Int ?? 0
                        )
                    } else {
                        return nil
                    }
                } ?? []
                
                let userReviews = allReviews.filter { $0.username == profileId }
                self.userReviews = userReviews
                
                if let username = userReviews.first?.username {
                    self.calculateUserRating(for: username)
                }
                
                completed(userReviews)
            }
        }
    }

    func calculateUserRating(for username: String) {
        var totalThumbsUp = 0
        let userReviews = self.userReviews.filter { $0.username == username }
        for review in userReviews {
            totalThumbsUp += review.thumbsUp
        }
        
        let maxThumbsUpForFullRating = 20
        let ratingValue = Double(totalThumbsUp) / Double(maxThumbsUpForFullRating) * 5.0
        userRating[username] = Int(round(ratingValue))
    }
            func getUserLikedReviews(profileId: String, completion: @escaping ([ReviewModel]) -> Void) {
                db.collection("reviews")
                    .order(by: "timeStamp", descending: true)
                    .getDocuments { (querySnapshot, error) in
                        if let error = error {
                            print("Error getting user liked reviews: \(error)")
                            completion([])
                        } else {
                            let allReviews = querySnapshot?.documents.compactMap { document -> ReviewModel? in
                                let data = document.data()
                                let timestamp = data["timeStamp"] as? Timestamp
                                let reviewCreationDate = timestamp?.dateValue() ?? Date()
                                return ReviewModel(
                                    id: data["id"] as? String ?? "",
                                    title: data["title"] as? String ?? "",
                                    body: data["body"] as? String ?? "",
                                    username: data["username"] as? String ?? "",
                                    venueId: data["venueId"] as? String ?? "",
                                    timeStamp: reviewCreationDate,
                                    thumbsUp: data["thumbsUp"] as? Int ?? 0,
                                    isLiked: data["isLiked"] as? Bool ?? false,
                                    rating: data["rating"] as? Int ?? 0
                                )
                            } ?? []
                            
                            let userLikedReviews = allReviews.filter { review in
                                review.username == profileId && review.thumbsUp > 0
                            }
                            
                            completion(userLikedReviews)
                        }
                    }
            }
        }
