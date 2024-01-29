//
//  ReviewModel.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 1/26/24.
//

import Foundation

struct ReviewModel: Identifiable, Hashable {
    var id: String
    var title: String
    var body: String
    var profileId: String
    var timeStamp: Date
}

var liveReviewSamples: [ReviewModel] = [
    ReviewModel(id: "fasdf343", title: "Example1", body: "Happy Hour Man these nuggets is cool a f", profileId: "38923832", timeStamp: Date.today()),
    ReviewModel(id: "fadfew343443f34", title: "Example2", body: "Ehh not really fan of these fries", profileId: "Drew", timeStamp: Date.today().next(.sunday)),
    ReviewModel(id: "453f4f43f34f", title: "Example3", body: "These waffles are only good on the weekend", profileId: "389293898023", timeStamp: Date.today().next(.sunday)),
    ReviewModel(id: "6h556hgg5", title: "Example1", body: "No Im not liking Chipotle right now", profileId: "2348934894", timeStamp: Date.today().next(.sunday)),
]
