//
//  VenueViewModel.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 1/29/24.
//

import Foundation

class VenuesViewModel: ObservableObject {
    private let service = VenuesService()

    @Published var venue = emptyVenueModel
    @Published var venues: [VenueModel] = []
    
    public func GetVenue(venueId: String) async throws {
        var venue = try await service.GetVenue(venueId: venueId)
        self.venue = venue
    }
    
    public func GetVenues(venueIds: [String]) async throws {
        var venues = try await service.GetVenues(venueIds: venueIds)
        self.venues = venues
    }
}
