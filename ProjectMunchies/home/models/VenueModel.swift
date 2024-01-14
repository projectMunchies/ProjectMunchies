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
