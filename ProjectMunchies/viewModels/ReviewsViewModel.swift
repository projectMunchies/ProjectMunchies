//
//  ReviewsViewModel.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 1/29/24.
//

import Foundation

class ReviewsViewModel: ObservableObject {
    private let service = ReviewsService()
    
    @Published var review: ReviewModel = emptyReviewModel
    @Published var reviews: [ReviewModel] = []
    @Published var recentReviews : [ReviewModel] = []
    
    public func GetReview(reviewId: String) async throws {
        let review = try await service.GetReview(reviewId: reviewId)
        self.review = review
    }
    
    public func GetReviews(reviewIds: [String]) async throws {
        let reviews = try await service.GetReviews(reviewIds: reviewIds)
        self.reviews = reviews
    }
    
    public func GetRecentReviews() async throws {
        let recentReviews = try await service.GetRecentReviews()
        self.recentReviews = recentReviews
    }
}
