//
//  CardModel.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 7/28/23.
//

import Foundation
import SwiftUI

struct ProfileModel: Identifiable, Equatable{
    var id: String
    var fullName: String
    var location: String
    var description: String
    var gender: String
    var age: String
    var fcmTokens: [String]
    var messageThreadIds: [String]
    var artwork: String = ""
    var occupation: String
    var favRestaurant: String
    var favFood: String
    var hobbies: [String]
    var eventIds: [String]
    var isMockData: Bool
    var bunchIds: [String]
}

var mockProfiles: [ProfileModel] = [
    ProfileModel(id: "rh2389fnwo", fullName: "Kate Duncan", location: "Tampa, FL", description: sampleText, gender: "Female", age: "25", fcmTokens: [], messageThreadIds: [], artwork: "Movie1", occupation: "Real Estate", favRestaurant: "Bar Taco", favFood: "Fries", hobbies: ["Beach","Gym"], eventIds: [], isMockData: true, bunchIds: []),
    
    ProfileModel(id: "lkfn3489h43fuifre", fullName: "Ryan Sutton", location: "St.Petersburg, FL", description: sampleText, gender: "Male", age: "25", fcmTokens: [], messageThreadIds: [], artwork: "Movie2", occupation: "Financial Advisor", favRestaurant: "Miguel's", favFood: "Jazzy's BBQ", hobbies: ["Fishing","Biking"], eventIds: [], isMockData: true, bunchIds: []),
    
    ProfileModel(id: "fkjerabhfueirlbfr", fullName: "Anna Price", location: "Clearwater, FL", description: sampleText, gender: "Female", age: "25", fcmTokens: [], messageThreadIds: [], artwork: "Movie3", occupation: "Paralegal", favRestaurant: "Chipotle", favFood: "Spagetti", hobbies: ["Gym", "Art"], eventIds: [], isMockData: true, bunchIds: []),
    ProfileModel(id: "rjrnbkbfdl347843", fullName: "Wyatt Whitfield", location: "Tampa, FL", description: sampleText, gender: "Male", age: "25", fcmTokens: [], messageThreadIds: [], artwork: "Movie4", occupation: "Musician", favRestaurant: "Texas de Brazil", favFood: "Culver's", hobbies: ["Sports", "Movies"], eventIds: [], isMockData: true, bunchIds: []),
    
    ProfileModel(id: "43ui4fj4893", fullName: "Jaycee Lucas", location: "St.Petersburg, FL", description: sampleText, gender: "Female", age: "25", fcmTokens: [], messageThreadIds: [], artwork: "Movie5", occupation: "Firefighter", favRestaurant: "Wawa", favFood: "Starbucks", hobbies: ["Yoga","Reading"], eventIds: [], isMockData: true, bunchIds: []),
    
    ProfileModel(id: "6io56in6ih", fullName: "Simone Guthrie", location: "Tampa, FL", description: sampleText, gender: "Female", age: "25", fcmTokens: [], messageThreadIds: [], artwork: "Movie6", occupation: "Teacher", favRestaurant: "Subway", favFood: "Burgers", hobbies: ["Running","Gym"], eventIds: [], isMockData: true, bunchIds: []),
    
//    ProfileModel(id: "3264bkfdhfs784b", fullName: "Jaxen Baird", location: "Clearwater, FL", description: sampleText, gender: "Male", age: "25", fcmTokens: [], messageThreadIds: [], artwork: "Movie7", occupation: "Software Developer", favRestaurant: "Saucy Fingerz", favFood: "Chicken wings", hobbies: ["Fishing","Biking"], eventIds: [], isMockData: true)
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


