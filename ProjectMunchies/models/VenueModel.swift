//
//  VenueModel.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 11/23/23.
//

import Foundation
import MapKit

struct VenueModel: Identifiable, Hashable, Equatable {
    //Needed to conform to Equatable
    static func == (lhs: VenueModel, rhs: VenueModel) -> Bool {
        return lhs.id == rhs.id && lhs.coordinates == rhs.coordinates
    }
    
    //Needed to conform to Hashable
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    let id: String
    var name: String
    var coordinates: CLLocationCoordinate2D
    var address: String
    var reviews: [ReviewModel]
    var specials: [SpecialModel]
}

var emptyVenueModel = VenueModel(id: "",  name: "", coordinates: CLLocationCoordinate2D(latitude: 0.0, longitude: 0.0), address: "", reviews: [], specials: [])

var venuesSample: [VenueModel] = [
    VenueModel(id: "0", name: "bdgd", coordinates: CLLocationCoordinate2D(latitude: 27.9432414,
                                                  longitude: -82.4503545), address: "", reviews: [], specials: []),
    VenueModel(id: "1", name: "gdf", coordinates: CLLocationCoordinate2D(latitude: 27.9626861,
                                                  longitude: -82.4937287), address: "", reviews: [], specials: []),
    VenueModel(id: "2", name: "4yg4", coordinates: CLLocationCoordinate2D(latitude: 28.024146, longitude: -82.452467), address: "", reviews: [], specials: [])
]
