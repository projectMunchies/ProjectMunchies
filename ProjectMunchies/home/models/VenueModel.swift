//
//  VenueModel.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 11/23/23.
//

import Foundation
import MapKit

struct VenueModel: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
    var name: String
    var address: String
}
