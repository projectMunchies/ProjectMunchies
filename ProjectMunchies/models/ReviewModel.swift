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
    let userId: String
    let venueId: String
    let timeStamp: Date
    let rating: Int
    let activityId: String
}

var liveReviewSample: ReviewModel =  ReviewModel(
    id: UUID().uuidString, 
    title: "",
    body: "",
    userId: "",
    venueId: "",
    timeStamp: Date.today(),
    rating: 0,
    activityId: ""
)

var liveReviewSamples: [ReviewModel] = [
    ReviewModel(
        id: UUID().uuidString,
        title: "",
        body: "",
        userId: "",
        venueId: "",
        timeStamp: Date.today(),
        rating: 0,
        activityId: ""
    ),
    ReviewModel(
        id: UUID().uuidString,
        title: "",
        body: "",
        userId: "",
        venueId: "",
        timeStamp: Date.today(),
        rating: 0,
        activityId: ""
    ),
    ReviewModel(
        id: UUID().uuidString,
        title: "",
        body: "",
        userId: "",
        venueId: "",
        timeStamp: Date.today(),
        rating: 0,
        activityId: ""
    ),
    ReviewModel(
        id: UUID().uuidString,
        title: "",
        body: "",
        userId: "",
        venueId: "",
        timeStamp: Date.today(),
        rating: 0,
        activityId: ""
    ),
]
