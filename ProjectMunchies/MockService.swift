//
//  MockData.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 7/27/23.
//

import Foundation


enum MockService {
    static var eventsSampleData: [EventModel] {
        [
            EventModel(
                id: "cf432344",
                title: "Itialian night with",
                location: "Magginos, Tampa,Fl",
                description: "Enjoy a great night with some great people",
                participants: ["dasfdsfweefcae","fdsafdsfessfd"],
                eventDate: Date.now
            ),
//            EventModel(
//                id: "jkhblhjkbkjbjkblk",
//                title: "Taco Tuesdays",
//                location: "Mugelitos, Tampa,Fl",
//                description: "Taco tuesdays youj already know what it be",
//                participants: ["fer3f4f3f34","faee43434343"],
//                eventDate: Date.now
//            )
//            EventModel(
//                id: "",
//                title: "",
//                location: "",
//                description: "",
//                participants: [],
//                eventDate: Date.now
//            ),
//            EventModel(
//                id: "",
//                title: "",
//                location: "",
//                description: "",
//                participants: [],
//                eventDate: Date.now
//            ),
        ]
    }
    
    static var userProfileSampleData: ProfileModel {
        ProfileModel(
        id: "",
        fullName: "",
        location: "",
        description: "",
        gender: "",
        fcmTokens: []
       )
    }
    
    static var profilesSampleData: [ProfileModel] {
        [
            ProfileModel(
             id: "8ff57448-387d-41f4-be45-bc879be23fbf",
             fullName: "John Walter",
             location: "Tampa,Fl",
             description: "",
             gender: "",
             fcmTokens: []
            ),
            ProfileModel(
             id: "a6ce1c0b-0cdb-4eaf-bca8-d124e39819ea",
             fullName: "Jordan Hooten",
             location: "Tampa,Fl",
             description: "",
             gender: "",
             fcmTokens: []
            ),
            ProfileModel(
             id: "a6f3b606-93c9-4d6b-a4f8-98ee66181206",
             fullName: "Payton",
             location: "St.Pete,Fl",
             description: "",
             gender: "",
             fcmTokens: []
            ),
            ProfileModel(
             id: "b37b0143-d3cc-495d-bfdc-1fec2d8fcf98",
             fullName: "Kristie",
             location: "Tampa,Fl",
             description: "",
             gender: "",
             fcmTokens: []
            ),
            ProfileModel(
             id: "d21387d1-fd1d-44b2-bc9c-03dfc8aa3e39",
             fullName: "Robert",
             location: "Tampa,Fl",
             description: "",
             gender: "female",
             fcmTokens: []
            ),
            ProfileModel(
                id: "f244f9a3-1f31-4d02-a509-99cb00bd1481",
                fullName: "Ashely Vega",
                location: "Clearwater,Fl",
                description: "",
                gender: "female",
                fcmTokens: []
               )
        ]
    }
    
    static var profilesSampleData2: [ProfileModel] {
        [
            ProfileModel(
             id: "8ff57448-387d-41f4-be45-bc879be23fbf",
             fullName: "fgdg",
             location: "",
             description: "",
             gender: "",
             fcmTokens: []
            ),
            ProfileModel(
             id: "a6ce1c0b-0cdb-4eaf-bca8-d124e39819ea",
             fullName: "ww",
             location: "",
             description: "",
             gender: "",
             fcmTokens: []
            ),
            ProfileModel(
             id: "a6f3b606-93c9-4d6b-a4f8-98ee66181206",
             fullName: "gadf",
             location: "",
             description: "",
             gender: "",
             fcmTokens: []
            ),
            ProfileModel(
             id: "b37b0143-d3cc-495d-bfdc-1fec2d8fcf98",
             fullName: "gdf",
             location: "",
             description: "",
             gender: "",
             fcmTokens: []
            ),
//            ProfileModel(
//             id: "d21387d1-fd1d-44b2-bc9c-03dfc8aa3e39",
//             fullName: "gdf",
//             location: "",
//             description: "",
//             gender: "",
//             fcmTokens: []
//            ),
//            ProfileModel(
//                id: "f244f9a3-1f31-4d02-a509-99cb00bd1481",
//                fullName: "gdf",
//                location: "",
//                description: "",
//                gender: "",
//                fcmTokens: []
//               )
        ]
    }
}


