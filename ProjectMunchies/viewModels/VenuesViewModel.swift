//
//  VenueViewModel.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 1/29/24.
//

import Foundation
import UIKit
import MapKit
import Firebase
import FirebaseStorage
import FirebaseAuth

class VenuesViewModel: ObservableObject {
    private let venuesService = VenuesService()
     
    @Published var profileImage: UIImage = UIImage()
    @Published var specialsVenues : [VenueModel] = []
    @Published var reviewsVenues : [VenueModel] = []
    @Published var venue = VenueModel(
        id: "",
        name: "",
        coordinates: CLLocationCoordinate2D(latitude: 0.0, longitude: 0.0),
        address: "", 
        reviews: [],
        specials: []
    )
    
    
    
    

}

