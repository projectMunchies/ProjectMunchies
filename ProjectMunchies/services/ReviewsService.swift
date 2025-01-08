//
//  ReviewsService.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 6/1/24.
//

import Foundation

class ReviewsService {
    private let reviewsRepository = ReviewsRepository()
    
    public func GetReview(reviewId: String) async throws -> ReviewModel {
        let review = try await reviewsRepository.Get(reviewId: reviewId)
        return review
    }
    
    public func GetReviews(reviewIds: [String]) async throws -> [ReviewModel] {
        let reviews = try await reviewsRepository.Get(reviewIds: reviewIds)
        return reviews
    }
    
    public func GetRecentReviews() async throws -> [ReviewModel] {
        let reviews = try await reviewsRepository.GetRecent()
        return reviews
    }
}
