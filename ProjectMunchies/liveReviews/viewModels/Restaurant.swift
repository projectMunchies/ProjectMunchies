//
//  Restaurant.swift
//  ProjectMunchies
//
//  Created by Marcus Mckoy on 3/22/24.
//



import Foundation
import CoreLocation

extension CLLocationCoordinate2D: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(latitude)
        hasher.combine(longitude)
    }
}

struct Restaurant: Identifiable, Hashable {
    let id: String
    let name: String
    let address: String
    let coordinates: CLLocationCoordinate2D
}
