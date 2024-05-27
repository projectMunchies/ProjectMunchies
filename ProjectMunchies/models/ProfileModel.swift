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
    var profileImage: UIImage
}

var mockProfiles: [ProfileModel] = [
    ProfileModel(
        id: "rh2389fnwo",
        fullName: "Kate Duncan",
        location: "Tampa, FL",
        description: sampleText,
        gender: "Female",
        age: "25",
        fcmTokens: [],
        messageThreadIds: [],
        occupation: "Real Estate",
        hobbies: ["Beach","Gym"],
        reviewIds: ["fsd","FDSFDS"],
        isMockData: true, 
        profileImage: UIImage()),
    
    ProfileModel(
        id: "rh2389fnwo",
        fullName: "Kate Duncan",
        location: "Tampa, FL",
        description: sampleText,
        gender: "Female",
        age: "25",
        fcmTokens: [],
        messageThreadIds: [],
        occupation: "Real Estate",
        hobbies: ["Beach","Gym"],
        reviewIds: ["fsd","FDSFDS"],
        isMockData: true, 
        profileImage: UIImage()
    ),
]

var sampleText = "lorem ispfads fadofjdsjklf dfkljdfd fgkjrewiof fjkdsfjdasf dlkfjads flkdsjfhgfiewu dakjfhdskjaf dfkjdsahfbeiwf ds fdoskjfnds bfudiskfd sfkjdshfdhsf fokjhdskfjha sdkjf fkjadsbfh dajklfd fkdb fdsojf dsjbfd fbjof jfb e dsfkjbd nfdkn f asdfjkhdskjfhlwau"
