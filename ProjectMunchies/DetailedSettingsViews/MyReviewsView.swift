//
//  MyReviewsIView.swift
//  ProjectMunchies
//
//  Created by Marcus Mckoy on 2/3/24.
//
import SwiftUI
import FirebaseAuth
import FirebaseFirestore


struct MyReviewsView: View {
    @ObservedObject var reviewsViewModel: ReviewsViewModel
    
    @State private var showAllReviews = false
    @State private var showLikedReviews = false
    
    var body: some View {
        VStack(alignment: .leading) {
            Button(action: {
                showAllReviews.toggle()
            }) {
                HStack {
                    Text("My Reviews")
                        .font(.headline)
                        .padding(.top)
                    Spacer()
                    Image(systemName: showAllReviews ? "chevron.down" : "chevron.right")
                }
            }
            
            if showAllReviews {
                ScrollView {
                    LazyVStack(alignment: .leading, spacing: 16) {
                        ForEach(reviewsViewModel.userReviews, id: \.id) { review in
                            ReviewCell(review: review)
                        }
                    }
                }
                .frame(height: 200)
            }
            
            Button(action: {
                showLikedReviews.toggle()
            }) {
                HStack {
                    Text("Liked Reviews")
                        .font(.headline)
                        .padding(.top)
                    Spacer()
                    Image(systemName: showLikedReviews ? "chevron.down" : "chevron.right")
                }
            }
            
            if showLikedReviews {
                ScrollView {
                    LazyVStack(alignment: .leading, spacing: 16) {
                        ForEach(reviewsViewModel.userLikedReviews, id: \.id) { review in
                            ReviewCell(review: review)
                        }
                    }
                }
                .frame(height: 200)
            }
        }
        .padding()
        .navigationTitle("My Reviews")
    }
}
   


