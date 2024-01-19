//
//  FirebaseRevLivemodel.swift
//  ProjectMunchies
//
//  Created by Marcus Mckoy on 1/19/24.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

class LiveFeedViewModel: ObservableObject {
    @Published var liveFeedComments: [String] = []

    private var db = Firestore.firestore()

    func fetchLiveFeedData() {
        // Replace "yourCollection" with the actual name of your collection in Firestore
        db.collection("yourCollection").document("yourDocument").addSnapshotListener { (snapshot, error) in
            guard let document = snapshot else {
                print("Error fetching document: \(error!)")
                return
            }

            guard let data = document.data() else {
                print("Document data is empty.")
                return
            }

            // Assuming you have a field named "comments" in your document
            if let comments = data["comments"] as? [String] {
                self.liveFeedComments = comments
            }
        }
    }
}
