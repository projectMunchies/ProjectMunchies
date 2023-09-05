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
    var occupation: String
    var location: String
    var favRestaurant: String
    var favFood: String
    var hobbies: [String]
}

var movies: [Movie] = [
    Movie(movieTitle: "Kate Duncan", artwork: "Movie1", occupation: "Real Estate", location: "Tampa, FL", favRestaurant: "Bar Taco", favFood: "Fries", hobbies: ["Beach","Gym"]),
Movie(movieTitle: "Ryan Sutton", artwork: "Movie2", occupation: "Financial Advisor", location: "St.Petersburg, FL", favRestaurant: "Miguel's", favFood: "Jazzy's BBQ", hobbies: ["Fishing","Biking"]),
Movie(movieTitle: "Anna Price", artwork: "Movie3", occupation: "Paralegal", location: "Tampa, FL", favRestaurant: "Chipotle", favFood: "Spagetti", hobbies: ["Gym", "Art"]),
Movie(movieTitle: "Wyatt Whitfield", artwork: "Movie4", occupation: "Musician", location: "Clearwater, FL", favRestaurant: "Texas de Brazil", favFood: "Culver's", hobbies: ["Sports", "Movies"]),
Movie(movieTitle: "Jaycee Lucas", artwork: "Movie5", occupation: "Firefighter", location: "Tampa, FL", favRestaurant: "Wawa", favFood: "Starbucks", hobbies: ["Yoga","Reading"]),
Movie(movieTitle: "Simone Guthrie", artwork: "Movie6", occupation: "Teacher", location: "Tampa, FL", favRestaurant: "Subway", favFood: "Burgers", hobbies: ["Running","Gym"]),
Movie(movieTitle: "Jaxen Baird", artwork: "Movie7", occupation: "Software Developer", location: "Clearwater, FL", favRestaurant: "Saucy Fingerz", favFood: "Chicken wings", hobbies: ["Fishing","Biking"]),

]

//Dummy Text
var sampleText = "lorem ispfads fadofjdsjklf dfkljdfd fgkjrewiof fjkdsfjdasf dlkfjads flkdsjfhgfiewu dakjfhdskjaf dfkjdsahfbeiwf ds fdoskjfnds bfudiskfd sfkjdshfdhsf fokjhdskfjha sdkjf fkjadsbfh dajklfd fkdb fdsojf dsjbfd fbjof jfb e dsfkjbd nfdkn f asdfjkhdskjfhlwau"

var mockBunches: [Movie] = [
Movie(movieTitle: "Saho Saloon", artwork: "Bunch1", occupation: "", location: "", favRestaurant: "", favFood: "", hobbies: [""]),
Movie(movieTitle: "McDonalds", artwork: "Bunch2", occupation: "", location: "", favRestaurant: "", favFood: "", hobbies: [""]),
Movie(movieTitle: "Chipotle", artwork: "Bunch3", occupation: "", location: "", favRestaurant: "", favFood: "", hobbies: [""]),
Movie(movieTitle: "Bar Taco", artwork: "Bunch4", occupation: "", location: "", favRestaurant: "", favFood: "", hobbies: [""]),
Movie(movieTitle: "511 Franklin", artwork: "Bunch5", occupation: "", location: "", favRestaurant: "", favFood: "", hobbies: [""])
]
