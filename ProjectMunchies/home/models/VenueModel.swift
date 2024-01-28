//
//  VenueModel.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 11/23/23.
//

import Foundation
import MapKit

struct VenueModel: Identifiable {
    var id: String
    var name: String
    var coordinate: CLLocationCoordinate2D
    var address: String
    var reviews: [ReviewModel]
    var specials: [SpecialModel]
}

var venueSample = VenueModel(id: "0",  name: "", coordinate: CLLocationCoordinate2D(latitude: 0.0, longitude: 0.0), address: "", reviews: [], specials: [])
var venuesSample: [VenueModel] = [
    VenueModel(id: "0", name: "bdgd", coordinate: CLLocationCoordinate2D(latitude: 27.9432414,
                                                  longitude: -82.4503545), address: "", reviews: [], specials: []),
    VenueModel(id: "1", name: "gdf", coordinate: CLLocationCoordinate2D(latitude: 27.9626861,
                                                  longitude: -82.4937287), address: "", reviews: [], specials: []),
    VenueModel(id: "2", name: "4yg4", coordinate: CLLocationCoordinate2D(latitude: 28.024146, longitude: -82.452467), address: "", reviews: [], specials: [])
]
