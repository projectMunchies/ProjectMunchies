//
//  BunchModel.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 9/18/23.
//

import Foundation

struct BunchModel: Identifiable, Codable {
    var id: String
    var locationName: String
    var profileIds: [String]
    var reviewIds: [String]
}

var mockBunchesReal: [BunchModel] = [
    BunchModel(id: "", locationName: "", profileIds: [], reviewIds: []),
    BunchModel(id: "", locationName: "", profileIds: [], reviewIds: []),
    BunchModel(id: "", locationName: "", profileIds: [], reviewIds: []),
    BunchModel(id: "", locationName: "", profileIds: [], reviewIds: []),
]
