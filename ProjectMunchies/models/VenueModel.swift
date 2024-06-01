//
//  VenueModel.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 11/23/23.
//

import Foundation
import MapKit

struct VenueModel: Identifiable{
//    //Needed to conform to Equatable
//    static func == (lhs: VenueModel, rhs: VenueModel) -> Bool {
//        return lhs.id == rhs.id && lhs.coordinates == rhs.coordinates
//    }
//    
//    //Needed to conform to Hashable
//    func hash(into hasher: inout Hasher) {
//        hasher.combine(id)
//    }
    
    var id: String
    var name: String
    var rating: Int
    var address: String
    var hasBrunch: Bool
    var reviewIds: [String]
    var specialIds: [String]
    var hasHappyHour: Bool
//    var coordinates: CLLocationCoordinate2D
//    var reviews: [ReviewModel]
//    var specials: [SpecialModel]
}

var emptyVenueModel = VenueModel(id: "",  name: "", rating: 0,address: "", hasBrunch: true, reviewIds: [], specialIds: [], hasHappyHour: true)

var venuesSample: [VenueModel] = [
    VenueModel(id: "1",  name: "venueOne", rating: 0,address: "", hasBrunch: true, reviewIds: [], specialIds: [], hasHappyHour: true),
    VenueModel(id: "2",  name: "venueTwo", rating: 3,address: "", hasBrunch: true, reviewIds: [], specialIds: [], hasHappyHour: false),
    VenueModel(id: "3",  name: "venueThree", rating: 5,address: "", hasBrunch: false, reviewIds: [], specialIds: [], hasHappyHour: true)
]
