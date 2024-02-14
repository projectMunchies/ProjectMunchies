//
//  CategoryModel.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 1/11/24.
//

import Foundation

struct CategoryModel: Identifiable {
    var id: Int
    var name: String
    var icon: String
}

var bottomIcons: [CategoryModel] = [
    CategoryModel(id: 1, name:"Filter", icon: "filterIcon"),
    CategoryModel(id: 2, name:"Live Reviews", icon: "reviewIcon"),
    CategoryModel(id: 3, name:"CrunchAI", icon: "brunchIcon"),
]
