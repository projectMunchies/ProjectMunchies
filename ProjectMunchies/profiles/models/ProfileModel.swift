//
//  CardModel.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 7/28/23.
//

import Foundation
import SwiftUI

struct ProfileModel: Identifiable, Equatable, Hashable{
    var id: String
    var fullName: String
    var location: String
    var description: String
    var gender: String
    var age: String
    var fcmTokens: [String]
    var messageThreadIds: [String]
    var occupation: String
    var hobbies: [String]
    var reviewIds: [String]
    var isMockData: Bool
}

var mockProfiles: [ProfileModel] = [
    ProfileModel(id: "rh2389fnwo", fullName: "Kate Duncan", location: "Tampa, FL", description: sampleText, gender: "Female", age: "25", fcmTokens: [], messageThreadIds: [],occupation: "Real Estate", hobbies: ["Beach","Gym"], reviewIds: ["fsd","FDSFDS"], isMockData: true),
    
    ProfileModel(id: "lkfn3489h43fuifre", fullName: "Ryan Sutton", location: "St.Petersburg, FL", description: sampleText, gender: "Male", age: "25", fcmTokens: [], messageThreadIds: [], occupation: "Financial Advisor", hobbies: ["ds"], reviewIds: ["4324234","4312532"], isMockData: true),
    
    ProfileModel(id: "fkjerabhfueirlbfr", fullName: "Anna Price", location: "Clearwater, FL", description: sampleText, gender: "Female", age: "25", fcmTokens: [], messageThreadIds: [],occupation: "Paralegal", hobbies: ["Gym", "Art"], reviewIds: ["4423423"], isMockData: true),
    
    ProfileModel(id: "rjrnbkbfdl347843", fullName: "Wyatt Whitfield", location: "Tampa, FL", description: sampleText, gender: "Male", age: "25", fcmTokens: [], messageThreadIds: [], occupation: "Musician", hobbies: ["Sports", "Movies"], reviewIds: ["e3223"], isMockData: true),
    
    ProfileModel(id: "43ui4fj4893", fullName: "Jaycee Lucas", location: "St.Petersburg, FL", description: sampleText, gender: "Female", age: "25", fcmTokens: [], messageThreadIds: [], occupation: "Firefighter", hobbies: ["Yoga","Reading"], reviewIds: ["3432423"], isMockData: true),
    
    ProfileModel(id: "6io56in6ih", fullName: "Simone Guthrie", location: "Tampa, FL", description: sampleText, gender: "Female", age: "25", fcmTokens: [], messageThreadIds: [], occupation: "Teacher", hobbies: ["Running","Gym"], reviewIds: ["3242"], isMockData: true)
]

//Dummy Text
var sampleText = "lorem ispfads fadofjdsjklf dfkljdfd fgkjrewiof fjkdsfjdasf dlkfjads flkdsjfhgfiewu dakjfhdskjaf dfkjdsahfbeiwf ds fdoskjfnds bfudiskfd sfkjdshfdhsf fokjhdskfjha sdkjf fkjadsbfh dajklfd fkdb fdsojf dsjbfd fbjof jfb e dsfkjbd nfdkn f asdfjkhdskjfhlwau"


