//
//  FirebaseFunctionLiveReview.swift
//  ProjectMunchies
//
//  Created by Marcus Mckoy on 1/18/24.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct Comment: Identifiable, Codable {
    @DocumentID var id: String?
    var text: String
}

class FirestoreManager {
    static let shared = FirestoreManager()

    private let db = Firestore.firestore()
    private let collectionName = "liveFeedComments"

    func addLiveFeedComment(comment: String, completion: @escaping (Error?) -> Void) {
        do {
            let newComment = Comment(text: comment)
            try db.collection(collectionName).addDocument(from: newComment) { error in
                completion(error)
            }
        } catch {
            completion(error)
        }
    }

    func getLiveFeedComments(completion: @escaping (Result<[Comment], Error>) -> Void) {
        db.collection(collectionName).addSnapshotListener { querySnapshot, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let documents = querySnapshot?.documents else {
                completion(.success([])) // No documents, return empty array
                return
            }

            let comments = documents.compactMap { document -> Comment? in
                Result { try document.data(as: Comment.self) }
                    .mapError { $0 as Error }
                    .value
            }

            completion(.success(comments))
        }
    }
}
