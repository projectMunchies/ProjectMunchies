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
    var reviewThreadId: String
}

var mockBunchesReal: [BunchModel] = [
    BunchModel(id: "", locationName: "", profileIds: [], reviewThreadId: ""),
    BunchModel(id: "", locationName: "", profileIds: [], reviewThreadId: ""),
    BunchModel(id: "", locationName: "", profileIds: [], reviewThreadId: ""),
    BunchModel(id: "", locationName: "", profileIds: [], reviewThreadId: ""),
]
