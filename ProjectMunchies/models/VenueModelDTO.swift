//
//  VenueModelDTO.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 6/7/24.
//

import Foundation
import MapKit

struct VenueModelDTO: Identifiable {
    var id: String
    var name: String
    var coordinates: CLLocationCoordinate2D
}
