//
//  Movie.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 9/2/23.
//

import SwiftUI

struct Movie: Identifiable {
    var id = UUID().uuidString
    var movieTitle: String
    var artwork: String
}

var movies: [Movie] = [
Movie(movieTitle: "Ad astra", artwork: "Movie1"),
Movie(movieTitle: "Hawkwye", artwork: "Movie2"),
Movie(movieTitle: "Ad", artwork: "Movie3"),
Movie(movieTitle: "Astra", artwork: "Movie4"),
Movie(movieTitle: "Shang Chi", artwork: "Movie5"),
Movie(movieTitle: "Star Wars", artwork: "Movie6"),
Movie(movieTitle: "Step Brothers", artwork: "Movie7"),

]

//Dummy Text
var sampleText = "lorem ispfads fadofjdsjklf dfkljdfd fgkjrewiof fjkdsfjdasf dlkfjads flkdsjfhgfiewu dakjfhdskjaf dfkjdsahfbeiwf ds fdoskjfnds bfudiskfd sfkjdshfdhsf fokjhdskfjha sdkjf fkjadsbfh dajklfd fkdb fdsojf dsjbfd fbjof jfb e dsfkjbd nfdkn f asdfjkhdskjfhlwau"

var mockBunches: [Movie] = [
Movie(movieTitle: "Saho Saloon", artwork: "Bunch1"),
Movie(movieTitle: "McDonalds", artwork: "Bunch2"),
Movie(movieTitle: "Chipotle", artwork: "Bunch3"),
Movie(movieTitle: "Bar Taco", artwork: "Bunch4"),
Movie(movieTitle: "511 Franklin", artwork: "Bunch5")
]
