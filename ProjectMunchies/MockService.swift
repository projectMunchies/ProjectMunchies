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
    
    static var cardSampleData: CardModel {
       CardModel(
        id: "",
        fullName: "",
        location: "",
        description: ""
       )
    }
    
    static var cardsSampleData: [CardModel] {
        [
            CardModel(
             id: "",
             fullName: "fgdg",
             location: "",
             description: ""
            ),
            CardModel(
             id: "",
             fullName: "ww",
             location: "",
             description: ""
            ),
            CardModel(
             id: "",
             fullName: "gadf",
             location: "",
             description: ""
            ),
            CardModel(
             id: "",
             fullName: "gdf",
             location: "",
             description: ""
            )
        ]
    }
}


