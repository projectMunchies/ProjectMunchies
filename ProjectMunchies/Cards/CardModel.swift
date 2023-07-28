//
//  CardModel.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 7/28/23.
//

import Foundation

struct CardModel: Identifiable, Codable, Hashable {
    var id: String
    var fullName: String
    var location: String
    var description: String
}

