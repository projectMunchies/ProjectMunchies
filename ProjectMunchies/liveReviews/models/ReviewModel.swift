//
//  ReviewModel.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 1/26/24.
//

import Foundation

struct ReviewModel: Identifiable, Hashable {
    var id: UUID = .init()
    var title: String
    var body: String
    var createdBy: String
    var timeStamp: Date
}

var liveReivewSamples: [ReviewModel] = [
    ReviewModel(title: "Example1", body: "Happy Hour Man these nuggets is cool a f", createdBy: "Drew", timeStamp: Date.today()),
    ReviewModel(title: "Example2", body: "Ehh not really fan of these fries", createdBy: "Drew", timeStamp: Date.today()),
    ReviewModel(title: "Example3", body: "These waffles are only good on the weekend", createdBy: "Drew", timeStamp: Date.today()),
    ReviewModel(title: "Example1", body: "No Im not liking Chipotle right now", createdBy: "Drew", timeStamp: Date.today()),
]
