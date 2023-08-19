//
//  FoodFilterModel.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 8/11/23.
//

import Foundation

struct FoodFilterModel: Identifiable, Codable {
    var id: String
    var userProfileId: String
    var category: String
    var type: String
    var gender: String
    var location: String
    var ageRangeFrom: String
    var ageRangeTo: String
    var timeStamp: Date
}
