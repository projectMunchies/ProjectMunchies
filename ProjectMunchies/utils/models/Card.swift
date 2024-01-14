//
//  Card.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 1/9/24.
//

import SwiftUI

struct Card: Identifiable, Hashable, Equatable {
    var id: UUID = .init()
    var image: String
    var title: String
    var mealType: String
    var previousOffset: CGFloat = 0
}

var chooseCards: [[Card]] = [sampleCards, sampleCards2]
 var sampleCards: [Card] = [
    .init(image: "https://images.services.kitchenstories.io/gxInWDQniM21aQiVgvnXmDrMnvo=/3840x0/filters:quality(85)/images.kitchenstories.io/communityImages/f4604e05f6a9eaca99afddd69e849005_c02485d4-0841-4de6-b152-69deb38693f2.jpg", title: "Foody's", mealType: "Breakfast"),
    .init(image: "https://www.tacobell.com/medias/blog-2019-new-menu-header.jpg?context=bWFzdGVyfGltYWdlc3wxNjYyNzd8aW1hZ2UvanBlZ3xpbWFnZXMvaDFhL2g5OC84OTI4NTEyMTE0NzE4LmpwZ3xjMjA5YzZjNTQyMmM0MWM1ZWE5N2Q1OGQ0NDJjYWVkMzdiNTE0MjMyMjRhMzhmMTZjNGEwYTc4YmMwOGYwOWYx", title: "Green Lemon", mealType: "Lunch"),
    .init(image: "https://assets.sweat.com/html_body_blocks/images/000/013/890/original/EasyHealthySnacks_en65ab5213130c9862172ac11435f055d9_en38b28edc7b2830a46f6e00bfeceeb1b6.jpg?1596090039", title: "", mealType: "Snack"),
    .init(image: "https://images.immediate.co.uk/production/volatile/sites/30/2022/03/Speedy-stroganoff-pasta-dbb29a0.jpg?quality=90&resize=556,505", title: "Magginos", mealType: "Dinner")
]

var sampleCards2: [Card] = [
   .init(image: "https://www.eatthis.com/wp-content/uploads/sites/4/2020/09/avocado-toast-egg.jpg?quality=82&strip=1", title: "Bob's Burgers", mealType: "Breakfast"),
   .init(image: "https://www.tacobell.com/medias/blog-2019-new-menu-header.jpg?context=bWFzdGVyfGltYWdlc3wxNjYyNzd8aW1hZ2UvanBlZ3xpbWFnZXMvaDFhL2g5OC84OTI4NTEyMTE0NzE4LmpwZ3xjMjA5YzZjNTQyMmM0MWM1ZWE5N2Q1OGQ0NDJjYWVkMzdiNTE0MjMyMjRhMzhmMTZjNGEwYTc4YmMwOGYwOWYx", title: "TacoBell", mealType: "Lunch"),
   .init(image: "https://stordfkenticomedia.blob.core.windows.net/df-us/rms/media/recipemediafiles/recipes/retail/x17/2018_sweet-sallty-snack-mix_5817_600x600.jpg?ext=.jpg", title: "", mealType: "Snack"),
   .init(image: "https://images.immediate.co.uk/production/volatile/sites/30/2022/03/Speedy-stroganoff-pasta-dbb29a0.jpg?quality=90&resize=556,505", title: "Forbicis", mealType: "Dinner")
]
