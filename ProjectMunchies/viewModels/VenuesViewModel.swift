//
//  VenueViewModel.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 1/29/24.
//

import Foundation
import MapKit

class VenuesViewModel: ObservableObject {
     private var reviewsViewModel = ReviewsViewModel()
     private var specialsViewModel = SpecialsViewModel()
    
    private let service = VenuesService()

    @Published var venue = emptyVenueModel
    @Published var venues: [VenueModel] = []
    @Published var reviewVenues: [VenueModel] = []
    @Published var specialVenues: [VenueModel] = []
    @Published var venueLocations: [VenueLocation] = []
    
    public func GetVenue(venueId: String) async throws {
        var venue = try await service.GetVenue(venueId: venueId)
        self.venue = venue
    }
    
    public func GetVenues(venueIds: [String]) async throws {
        var venues = try await service.GetVenues(venueIds: venueIds)
        self.venues = venues
    }
    
    public func GetMapAlerts() async throws {
        let twoWeeksAgo = Date().previous(.friday, considerToday: true)
        
        try await reviewsViewModel.GetRecentReviews(date: twoWeeksAgo)
        try await specialsViewModel.GetRecentSpecials(date: twoWeeksAgo)
        
        var reviewVenueIds: [String] = []
        var specialVenueIds: [String] = []
        
        reviewsViewModel.recentReviews.forEach{reviewVenueIds.append($0.venueId)}
        specialsViewModel.recentSpecials.forEach{specialVenueIds.append($0.venueId)}
        
//        self.venueLocations = [
//            VenueLocation(name: "Chiptole", coordinate: CLLocationCoordinate2D(latitude: 27.9601701, longitude: -82.50759)),
//            VenueLocation(name: "Ricks on the River", coordinate: CLLocationCoordinate2D(latitude: 27.9628309, longitude: -82.4763924))
//        ]
        
        
        if(!reviewVenueIds.isEmpty) {
            self.reviewVenues = try await service.GetVenues(venueIds: reviewVenueIds)
        }
        
        if(!specialVenueIds.isEmpty) {
            self.specialVenues = try await service.GetVenues(venueIds: specialVenueIds)
        }
    }
}

struct VenueLocation: Identifiable {
    let id = UUID()
    var name: String
    var coordinate: CLLocationCoordinate2D
}
