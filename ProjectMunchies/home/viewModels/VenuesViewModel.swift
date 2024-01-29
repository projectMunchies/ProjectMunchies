//
//  VenueViewModel.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 1/29/24.
//

import Foundation
import UIKit
import Firebase
import FirebaseStorage
import FirebaseAuth

class VenuesViewModel: ObservableObject {
    let storage = Storage.storage()
    let db = Firestore.firestore()
     
    @Published var profileImage: UIImage = UIImage()

}

