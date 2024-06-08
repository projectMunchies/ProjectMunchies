//
//  ReviewModel.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 1/26/24.
//

import Foundation

struct ReviewModel: Identifiable, Hashable {
    var id: String
    var rating: Int
    var body: String
    var title: String
    var profileId: String
    var venueId: String
    var timeStamp: Date
    var activityId: String
}

var emptyReviewModel: ReviewModel =  ReviewModel(
    id: UUID().uuidString,
    rating: 0,
    body: "",
    title: "",
    profileId: "",
    venueId: "",
    timeStamp: Date.today(),
    activityId: ""
)

var liveReviewSamples: [ReviewModel] = [
    ReviewModel(
        id: UUID().uuidString,
        rating: 0,
        body: "",
        title: "",
        profileId: "",
        venueId: "",
        timeStamp: Date.today(),
        activityId: ""
    ),
    ReviewModel(
        id: UUID().uuidString,
        rating: 0,
        body: "",
        title: "",
        profileId: "",
        venueId: "",
        timeStamp: Date.today(),
        activityId: ""
    ),
    ReviewModel(
        id: UUID().uuidString,
        rating: 0,
        body: "",
        title: "",
        profileId: "",
        venueId: "",
        timeStamp: Date.today(),
        activityId: ""
    ),
    ReviewModel(
        id: UUID().uuidString,
        rating: 0,
        body: "",
        title: "",
        profileId: "",
        venueId: "",
        timeStamp: Date.today(),
        activityId: ""
    ),
]
