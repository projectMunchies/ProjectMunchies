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
    @StateObject var viewModel = ReviewsViewModel()
    @StateObject private var homeViewModel = HomeViewModel()
    @State private var isSettingsPresented = false
    @State private var selectedView: Int?
    @State private var showAllReviews = false
    @State private var submittedReviews: [ReviewModel] = []
    @State private var showLikedReviews = false
    @State private var refreshViewToggle = false
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer().frame(height: 50)
                
                // Add the profileIcon() function to the top right corner
                HStack {
                    Spacer()
                    profileIcon()
                }
                
                VStack(alignment: .leading) {
                    Text("Favorites")
                        .font(.headline)
                        .padding(.top)
                    
                    // Display favorite reviews
                    // Add your code here to show favorite reviews
                    Button(action: {
                        showAllReviews.toggle()
                    }) {
                        Text("My Reviews")
                            .font(.headline)
                            .padding(.top)
                    }
                    
                    if showAllReviews {
                        ScrollView {
                            LazyVStack(alignment: .leading, spacing: 16) {
                                ForEach(viewModel.userReviews, id: \.id) { review in
                                    ReviewCell(review: review)
                                }
                            }
                        }
                        .frame(height: 200)
                    }
                    
                    Button(action: {
                        showLikedReviews.toggle()
                    }) {
                        Text("My Liked Reviews")
                            .font(.headline)
                            .padding(.top)
                    }
                    
                    if showLikedReviews {
                        ScrollView {
                            LazyVStack(alignment: .leading, spacing: 16) {
                                ForEach(viewModel.userLikedReviews, id: \.id) { review in
                                    ReviewCell(review: review)
                                }
                            }
                        }
                        .frame(height: 200)
                    }
                }
                .padding()
                
                Spacer()
            }
            .onAppear {
                homeViewModel.getUserProfile() { userId in
                    
                    viewModel.getUserReviews(userId: userId) { reviews in
                        DispatchQueue.main.async {
                            viewModel.userReviews = reviews
                        }
                    }
                    viewModel.getUserLikedReviews(userId: userId) { likedReviews in
                        DispatchQueue.main.async {
                            viewModel.userLikedReviews = likedReviews
                        }
                    }
                }
            }
        }
    }
    
    
    @ViewBuilder func profileIcon() -> some View {
        Menu {
            Button(action: {
                selectedView = 0
                isSettingsPresented = true
            }) {
                Label("My Bunchies", systemImage: "person.2.square.stack")
            }
            Button(action: {
                selectedView = 2
                isSettingsPresented = true
            }) {
                Label("Settings", systemImage: "gearshape.fill")
            }
        } label: {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundColor(.black)
        }
        .padding(.horizontal, 16)
        .padding(.top, 16)
        .sheet(isPresented: $isSettingsPresented) {
            switch selectedView {
            case 0:
                MyBunchiesView()
            case 2:
                SettingsView()
            default:
                EmptyView()
            }
        }
    }
}
                struct ReviewCell: View {
                    let review: ReviewModel
                    
                    var body: some View {
                        VStack(alignment: .leading) {
                            Text(review.profileId)
                                .font(.headline)
                            Text(review.body)
                                .font(.subheadline)
                            Text(Date().timeAgoDisplay(from: review.timeStamp))
                                .font(.caption)
                                .foregroundColor(.gray)
                            HStack {
                                ForEach(0..<5) { index in
                                    Image(systemName: index < review.rating ? "star.fill" : "star")
                                        .foregroundColor(.yellow)
                                }
                            }
                        }
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                    }
                }
    

struct MyReviewsView_Previews: PreviewProvider {
    static var previews: some View {
        MyReviewsView()
            
    }
}
