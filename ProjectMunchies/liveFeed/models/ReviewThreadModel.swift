//
//  ReviewThreadModel.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 10/6/23.
//

import Foundation

struct ReviewThreadModel: Identifiable, Codable {
    var id: String
    var reviewIds: [String]
}
