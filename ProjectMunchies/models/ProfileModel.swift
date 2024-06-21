//
//  CardModel.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 7/28/23.
//

import Foundation
import SwiftUI

struct ProfileModel: Identifiable, Equatable, Hashable {
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
    var requestingUserId: String?

    init(id: String, fullName: String, location: String, description: String, gender: String, age: String, fcmTokens: [String], messageThreadIds: [String], occupation: String, hobbies: [String], reviewIds: [String], isMockData: Bool, profileImage: UIImage, requestingUserId: String? = nil) {
        self.id = id
        self.fullName = fullName
        self.location = location
        self.description = description
        self.gender = gender
        self.age = age
        self.fcmTokens = fcmTokens
        self.messageThreadIds = messageThreadIds
        self.occupation = occupation
        self.hobbies = hobbies
        self.reviewIds = reviewIds
        self.isMockData = isMockData
        self.profileImage = profileImage
        self.requestingUserId = requestingUserId
    }

    init(dictionary: [String: Any]) {
        self.id = dictionary["id"] as? String ?? ""
        self.fullName = dictionary["fullName"] as? String ?? ""
        self.location = dictionary["location"] as? String ?? ""
        self.description = dictionary["description"] as? String ?? ""
        self.gender = dictionary["gender"] as? String ?? ""
        self.age = dictionary["age"] as? String ?? ""
        self.fcmTokens = dictionary["fcmTokens"] as? [String] ?? []
        self.messageThreadIds = dictionary["messageThreadIds"] as? [String] ?? []
        self.occupation = dictionary["occupation"] as? String ?? ""
        self.hobbies = dictionary["hobbies"] as? [String] ?? []
        self.reviewIds = dictionary["reviewIds"] as? [String] ?? []
        self.isMockData = dictionary["isMockData"] as? Bool ?? false
        self.profileImage = UIImage() // Initialize with an empty image or load from a URL if available
        self.requestingUserId = dictionary["requestingUserId"] as? String
    }

    
    static var sampleText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod, nulla sit amet aliquam lacinia, nisl nisl aliquam nisl, nec aliquam nisl nisl sit amet nisl. Sed euismod, nulla sit amet aliquam lacinia, nisl nisl aliquam nisl, nec aliquam nisl nisl sit amet nisl."
    
    static var emptyProfileModel = ProfileModel(id: "", fullName: "", location: "", description: "", gender: "", age: "", fcmTokens: [], messageThreadIds: [], occupation: "", hobbies: [], reviewIds: [], isMockData: false, profileImage: UIImage())
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
