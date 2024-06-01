//
//  VenuesService.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 5/27/24.
//

import Foundation
import Firebase
import MapKit


class VenuesService: ObservableObject {
    private let venuesRepository = VenuesRepository()
    
    public func GetVenue(venueId: String) async throws -> VenueModel {
       var venue = try await venuesRepository.Get(venueId: venueId)
        return venue
    }
    
    public func GetVenues(venueIds: [String]) async throws -> [VenueModel] {
       var venues = try await venuesRepository.Get(venueIds: venueIds)
        return venues
    }
}
