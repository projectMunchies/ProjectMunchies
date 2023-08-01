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
                id: "",
                title: "",
                location: "",
                description: "",
                participants: [],
                eventDate: Date.now
            ),
            EventModel(
                id: "",
                title: "",
                location: "",
                description: "",
                participants: [],
                eventDate: Date.now
            ),
            EventModel(
                id: "",
                title: "",
                location: "",
                description: "",
                participants: [],
                eventDate: Date.now
            ),
            EventModel(
                id: "",
                title: "",
                location: "",
                description: "",
                participants: [],
                eventDate: Date.now
            ),
        ]
    }
    
    static var cardSampleData: ProfileModel {
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
            ProfileModel(
             id: "d21387d1-fd1d-44b2-bc9c-03dfc8aa3e39",
             fullName: "gdf",
             location: "",
             description: "",
             gender: "",
             fcmTokens: []
            ),
            ProfileModel(
                id: "f244f9a3-1f31-4d02-a509-99cb00bd1481",
                fullName: "gdf",
                location: "",
                description: "",
                gender: "",
                fcmTokens: []
               )
        ]
    }
}


