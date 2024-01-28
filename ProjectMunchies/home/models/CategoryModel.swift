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

var mainCategories: [CategoryModel] = [
    CategoryModel(id: 1, name:"Food", icon: "foodIcon"),
    CategoryModel(id: 2, name:"Drinks", icon: "drinkIcon"),
    CategoryModel(id: 3, name:"Brunch", icon: "brunchIcon"),
    CategoryModel(id: 4, name:"Happy Hour", icon: "happyHourIcon")
]

var homeCategories: [CategoryModel] = [
    CategoryModel(id: 1, name:"Filter", icon: "filterIcon"),
    CategoryModel(id: 2, name:"Live Reviews", icon: "reviewIcon"),
    CategoryModel(id: 3, name:"CrunchAI", icon: "brunchIcon"),
//  CategoryModel(id: 4, name:"Hot Spots", icon: "flameIcon"),
//   CategoryModel(id: 4, name:"Discover", icon: "discoverIcon")
]
