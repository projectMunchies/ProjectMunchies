//
//  VenueModel.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 11/23/23.
//

import Foundation
import MapKit

struct VenueModel: Identifiable {
    var id: UUID = .init()
    var coordinate: CLLocationCoordinate2D
    var name: String
    var address: String
}


var venueSample = VenueModel(coordinate: CLLocationCoordinate2D(latitude: 0.0, longitude: 0.0), name: "", address: "")

var venuesSample: [VenueModel] = [
    VenueModel(coordinate: CLLocationCoordinate2D(latitude: 27.9432414,
                                                  longitude: -82.4503545), name: "bdgd", address: ""),
    VenueModel(coordinate: CLLocationCoordinate2D(latitude: 27.9937694,
                                                  longitude: -82.6449753), name: "gdf", address: ""),
    VenueModel(coordinate: CLLocationCoordinate2D(latitude: 0.0, longitude: 0.0), name: "4yg4", address: ""),
    VenueModel(coordinate: CLLocationCoordinate2D(latitude: 0.0, longitude: 0.0), name: "g454", address: "")

]
