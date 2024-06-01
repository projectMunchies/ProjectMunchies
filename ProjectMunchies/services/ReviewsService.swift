//
//  ReviewsService.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 6/1/24.
//

import Foundation

class ReviewsService: ObservableObject {
    private let reviewsRepository = ReviewsRepository()
    
    public func GetReview(reviewId: String) async throws -> ReviewModel {
        var review = try await reviewsRepository.Get(reviewId: reviewId)
        return review
    }
    
    public func GetReviews(reviewIds: [String]) async throws -> [ReviewModel] {
        var reviews = try await reviewsRepository.Get(reviewIds: reviewIds)
        return reviews
    }
    
    public func GetAfterDate(date: Date) async throws -> [ReviewModel] {
        var reviews = try await reviewsRepository.GetAfter(date: date)
        return reviews
    }
}
