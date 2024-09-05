//
//  SearchModel.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 9/5/24.
//

import Foundation

struct SearchModel: Identifiable, Equatable {
    var id: String
    var searchText: String
    var mapAlertType: String?
}
