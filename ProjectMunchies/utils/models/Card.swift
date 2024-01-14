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

var cardDeck: [[Card]] = [sampleCards, sampleCards2, sampleCards3, sampleCards4]

 var sampleCards: [Card] = [
    .init(image: "https://images.services.kitchenstories.io/gxInWDQniM21aQiVgvnXmDrMnvo=/3840x0/filters:quality(85)/images.kitchenstories.io/communityImages/f4604e05f6a9eaca99afddd69e849005_c02485d4-0841-4de6-b152-69deb38693f2.jpg", title: "Foody's", mealType: "Breakfast"),
    .init(image: "https://www.tacobell.com/medias/blog-2019-new-menu-header.jpg?context=bWFzdGVyfGltYWdlc3wxNjYyNzd8aW1hZ2UvanBlZ3xpbWFnZXMvaDFhL2g5OC84OTI4NTEyMTE0NzE4LmpwZ3xjMjA5YzZjNTQyMmM0MWM1ZWE5N2Q1OGQ0NDJjYWVkMzdiNTE0MjMyMjRhMzhmMTZjNGEwYTc4YmMwOGYwOWYx", title: "Green Lemon", mealType: "Lunch"),
    .init(image: "https://assets.sweat.com/html_body_blocks/images/000/013/890/original/EasyHealthySnacks_en65ab5213130c9862172ac11435f055d9_en38b28edc7b2830a46f6e00bfeceeb1b6.jpg?1596090039", title: "", mealType: "Snack"),
    .init(image: "https://images.immediate.co.uk/production/volatile/sites/30/2022/03/Speedy-stroganoff-pasta-dbb29a0.jpg?quality=90&resize=556,505", title: "Magginos", mealType: "Dinner")
]

var sampleCards2: [Card] = [
   .init(image: "https://lh3.googleusercontent.com/p/AF1QipOCwa4yHXRVcZs4KLm9NRlisAqSdtxdpqq9IZnQ=s1360-w1360-h1020", title: "Keke's Breakfast Cafe", mealType: "Breakfast"),
   .init(image: "https://lh3.googleusercontent.com/p/AF1QipM2ntgpxCa-gY2aB4H8ioSDF7yu83orROFd6Ec6=s1360-w1360-h1020", title: "Bahama Breeze", mealType: "Lunch"),
   .init(image: "https://stordfkenticomedia.blob.core.windows.net/df-us/rms/media/recipemediafiles/recipes/retail/x17/2018_sweet-sallty-snack-mix_5817_600x600.jpg?ext=.jpg", title: "", mealType: "Snack"),
   .init(image: "https://lh3.googleusercontent.com/p/AF1QipPsaf1KpuJx35hkTPeqekygf0Z6BG8SQU2ygjdm=s1360-w1360-h1020", title: "The Pearl Tampa", mealType: "Dinner")
]

var sampleCards3: [Card] = [
   .init(image: "https://lh3.googleusercontent.com/p/AF1QipPMjRzw6TjJFBvPXIi073hoNSwb_RVhpiRlGxtt=s1360-w1360-h1020", title: "Nicki's Omelette & Grill", mealType: "Breakfast"),
   .init(image: "https://lh3.googleusercontent.com/p/AF1QipP9f8-MS6iMAR4YxMorNmnWd89moqzufZVFwzic=s1360-w1360-h1020", title: "Doc B's", mealType: "Lunch"),
   .init(image: "https://stordfkenticomedia.blob.core.windows.net/df-us/rms/media/recipemediafiles/recipes/retail/x17/2018_sweet-sallty-snack-mix_5817_600x600.jpg?ext=.jpg", title: "", mealType: "Snack"),
   .init(image: "https://lh3.googleusercontent.com/proxy/Hg1U6Eq6Alrm7ATWQlD70f_h3kRkNGGGbFEr_fXfz-Z43HGg6aJH6sc33Zvsm_oucbA96MHvstJswlLURJ0pweG25StZIYnKJLgPTll3PrO8uuWQ1_YHjKXwKWlj0Z6WqP0xzfGBSWC7zDhjmScQNUxdPA-PYCE=s1360-w1360-h1020", title: "Forbici", mealType: "Dinner")
]

var sampleCards4: [Card] = [
   .init(image: "https://lh3.googleusercontent.com/p/AF1QipPO2MPwWxmepq3CQGBrHwPyImSeS1HOE_uESZ1f=s1360-w1360-h1020", title: "Daily Eats", mealType: "Breakfast"),
   .init(image: "https://lh3.googleusercontent.com/p/AF1QipNemhAwN9nt5vVNIS0Eif4pT8UxMeINcKrz01JO=s1360-w1360-h1020", title: "On Swann", mealType: "Lunch"),
   .init(image: "https://stordfkenticomedia.blob.core.windows.net/df-us/rms/media/recipemediafiles/recipes/retail/x17/2018_sweet-sallty-snack-mix_5817_600x600.jpg?ext=.jpg", title: "", mealType: "Snack"),
   .init(image: "https://lh3.googleusercontent.com/p/AF1QipNyHf4lP7nyAbq8lU0G9m_hO2FJ7bzymBUsjtmd=s1360-w1360-h1020", title: "Rome + Fig", mealType: "Dinner")
]
