//
//  ReviewModel.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 1/26/24.
//

import Foundation

struct ReviewModel: Identifiable, Hashable {
    let id: String
     let title: String
     let body: String
     let profileId: String
     let venueId: String
     let timeStamp: Date
     var thumbsUp: Int
     var isLiked: Bool // Add this property
     let rating: Int
 }




var liveReviewSamples: [ReviewModel] = [
    ReviewModel(
        id: "fasdf343",
        title: "Example1",
        body: "Happy Hour Man these nuggets is cool a f",
        profileId: "38923832",
        venueId: "fw5665",
        timeStamp: Date.today(),
        thumbsUp: 0,
        isLiked: false,
        rating: 4
    ),
    ReviewModel(
        id: "fadfew343443f34",
        title: "Example2",
        body: "Ehh not really fan of these fries",
        profileId: "Drew",
        venueId: "g65rh76u76",
        timeStamp: Date.today().next(.sunday),
        thumbsUp: 0,
        isLiked: false,
        rating: 2
    ),
    ReviewModel(
        id: "453f4f43f34f",
        title: "Example3",
        body: "These waffles are only good on the weekend",
        profileId: "389293898023",
        venueId: "gw6euye67uy67",
        timeStamp: Date.today().next(.sunday),
        thumbsUp: 0,
        isLiked: false,
        rating: 3
    ),
    ReviewModel(
        id: "6h556hgg5",
        title: "Example1",
        body: "No Im not liking Chipotle right now",
        profileId: "2348934894",
        venueId: "hy67hr7h67h",
        timeStamp: Date.today().next(.sunday),
        thumbsUp: 0,
        isLiked: false,
        rating: 1
    )
]
