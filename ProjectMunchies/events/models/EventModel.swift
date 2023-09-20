//
//  EventModel.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 7/27/23.
//

import Foundation

struct EventModel: Identifiable, Codable, Hashable {
    var id: String
    var title: String
    var location: String
    var description: String
    var participants: [String]
    var eventDate: Date
}

