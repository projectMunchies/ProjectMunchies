//
//  CategoryTypeModel.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 1/11/24.
//

import Foundation

struct CategoryTypeModel: Identifiable {
    var id: Int
    var name: String
    var icon: String
}

var cuisineTypes: [CategoryTypeModel] = [
    CategoryTypeModel(id: 1, name: "Chinese", icon: "chineseFoodIcon"),
    CategoryTypeModel(id: 2, name: "American", icon: "americanFoodIcon"),
    CategoryTypeModel(id: 3, name: "Mexican", icon: "mexicanFoodIcon"),
    CategoryTypeModel(id: 4, name: "Japanese", icon: "japaneseFoodIcon"),
    CategoryTypeModel(id: 5, name: "Indian", icon: "indianFoodIcon"),
    CategoryTypeModel(id: 6, name: "Italian", icon: "italianFoodIcon"),
    CategoryTypeModel(id: 7, name: "Thai", icon: "thaiFoodIcon"),
    CategoryTypeModel(id: 8, name: "French", icon: "frenchFoodIcon")
]

var drinkTypes: [CategoryTypeModel] = [
    CategoryTypeModel(id: 1, name: "Juice", icon: "juiceIcon"),
    CategoryTypeModel(id: 2, name: "Smoothie", icon: "smoothieIcon"),
    CategoryTypeModel(id: 3, name: "Soda", icon: "sodaIcon"),
    CategoryTypeModel(id: 4, name: "Tea", icon: "teaIcon"),
    CategoryTypeModel(id: 5, name: "Coffee", icon: "coffeeIcon"),
    CategoryTypeModel(id: 6, name: "Hot Chocolate", icon: "hotChocolateIcon")
]

var happHourTypes: [CategoryTypeModel] = [
    CategoryTypeModel(id: 1, name: "Liquor", icon: "liquorIcon"),
    CategoryTypeModel(id: 2, name: "Beer", icon: "beerIcon"),
    CategoryTypeModel(id: 3, name: "Wine", icon: "wineIcon"),
    CategoryTypeModel(id: 4, name: "Margarita", icon: "margaritaIcon"),
    CategoryTypeModel(id: 5, name: "Cocktail", icon: "cocktailIcon")
]
