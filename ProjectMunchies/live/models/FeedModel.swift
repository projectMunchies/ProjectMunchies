//
//  feedModel.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 8/20/23.
//

import Foundation

struct FeedModel: Identifiable, Codable, Hashable {
    var id: String
    var text: String
    var timeStamp: Date
}
