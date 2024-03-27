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

var filterLvlOne: [CategoryTypeModel] = [
    CategoryTypeModel(id: 1, name: "Specials", icon: "specialsIcon"),
    CategoryTypeModel(id: 2, name: "Portions", icon: "portionIcon"),
    CategoryTypeModel(id: 3, name: "Prices", icon: "pricesIcon"),
    CategoryTypeModel(id: 4, name: "Basics", icon: "basicFilterIcon")
]

var filterSpecialsLvl: [CategoryTypeModel] = [
    CategoryTypeModel(id: 1, name: "Breakfast", icon: "specialsIcon"),
    CategoryTypeModel(id: 2, name: "Lunch", icon: "portionIcon"),
    CategoryTypeModel(id: 3, name: "Brunch", icon: "pricesIcon"),
    CategoryTypeModel(id: 4, name: "HappyHour", icon: "basicFilterIcon")
]

var filterPortionsLvl: [CategoryTypeModel] = [
    CategoryTypeModel(id: 1, name: "Small", icon: "specialsIcon"),
    CategoryTypeModel(id: 2, name: "Medium", icon: "portionIcon"),
    CategoryTypeModel(id: 3, name: "Large", icon: "pricesIcon"),
]

var filterPricesLvl: [CategoryTypeModel] = [
    CategoryTypeModel(id: 1, name: "Cheap", icon: "specialsIcon"),
    CategoryTypeModel(id: 2, name: "Moderate", icon: "portionIcon"),
    CategoryTypeModel(id: 3, name: "Expensive", icon: "pricesIcon"),
]

var filterBasicsLvl: [CategoryTypeModel] = [
    CategoryTypeModel(id: 1, name: "Cuisines", icon: "specialsIcon"),
    CategoryTypeModel(id: 2, name: "Drinks", icon: "portionIcon"),
    CategoryTypeModel(id: 3, name: "Ratings", icon: "pricesIcon"),
]

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
