//
//  profilesViewModel.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 1/29/24.
//

import Foundation
import UIKit
import Firebase
import FirebaseStorage
import FirebaseAuth

class ProfilesViewModel: ObservableObject {
    let storage = Storage.storage()
    let db = Firestore.firestore()
     
    @Published var profiles: UIImage = UIImage()
}
