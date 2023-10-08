//
//  feedModel.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 8/20/23.
//

import Foundation

struct ReviewModel: Identifiable, Codable, Hashable {
    var id: String
    var text: String
    var timeStamp: Date
}

var reviewSampleData: [ReviewModel] =
[
    ReviewModel(
        id: "",
        text: "",
        timeStamp: Date()
    ),
    ReviewModel(
        id: "",
        text: "",
        timeStamp: Date()
    ),
    ReviewModel(
        id: "",
        text: "",
        timeStamp: Date()
    ),
    ReviewModel(
        id: "",
        text: "",
        timeStamp: Date()
    )
]
