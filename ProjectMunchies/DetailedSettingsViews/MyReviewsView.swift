//
//  MyReviewsIView.swift
//  ProjectMunchies
//
//  Created by Marcus Mckoy on 2/3/24.
//
import SwiftUI
import FirebaseAuth


struct MyReviewsView: View {
    @StateObject var viewModel = ReviewsViewModel() // Inject ReviewsViewModel
    @State private var isSettingsPresented = false
    @State private var selectedView: Int?
    @State private var showAllReviews = false
    @State private var submittedReviews: [ReviewModel] = []
    @State private var showLikedReviews = false
    
    
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer().frame(height: 50)
                
                VStack(alignment: .leading) {
                    Text("Favorites")
                        .font(.headline)
                        .padding(.top)
                    
                    // Display favorite reviews
                    // Add your code here to show favorite reviews
                    Button(action: {
                        showAllReviews.toggle()
                    }) {
                        Text("All Reviews")
                            .font(.headline)
                            .padding(.top)
                    }
                    
                    if showAllReviews {
                        ScrollView {
                            VStack(alignment: .leading, spacing: 16) {
                                ForEach(viewModel.allReviews) { review in
                                    HStack {
                                        VStack(alignment: .leading) {
                                            Text(review.title)
                                                .font(.subheadline)
                                            Text(review.body)
                                                .font(.caption)
                                        }
                                        Spacer()
                                        HStack {
                                            ForEach(0..<5) { index in
                                                Image(systemName: index < review.rating ? "star.fill" : "star")
                                                    .foregroundColor(.yellow)
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        .frame(height: 200)
                    }
                    
                    
                    
                    Button(action: {
                        showLikedReviews.toggle()
                    }) {
                        Text("Liked Reviews")
                            .font(.headline)
                            .padding(.top)
                    }
                    
                    if showLikedReviews {
                        ScrollView {
                            VStack(alignment: .leading, spacing: 16) {
                                ForEach(viewModel.likedReviews) { review in
                                    HStack {
                                        VStack(alignment: .leading) {
                                            Text(review.title)
                                                .font(.subheadline)
                                            Text(review.body)
                                                .font(.caption)
                                        }
                                        Spacer()
                                        HStack {
                                            ForEach(0..<5) { index in
                                                Image(systemName: index < review.rating ? "star.fill" : "star")
                                                    .foregroundColor(.yellow)
                                            }
                                        }
                                    }
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
                                viewModel.fetchAllReviews { _ in }
                                viewModel.fetchLikedReviews { reviews in
                                    // Handle the fetched liked reviews if needed
                                    print("Fetched \(reviews.count) liked reviews")
                                }
                            }
                            .navigationBarItems(trailing: profileIcon())
                        }
                    }
                    
                    @ViewBuilder
                    func profileIcon() -> some View {
                        Menu {
                            Button(action: {
                                selectedView = 1
                                isSettingsPresented = true
                            }) {
                                Label("My Reviews", systemImage: "star.fill")
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
                            case 1:
                                MyReviewsView()
                                    .onDisappear {
                                        // Update the necessary state variables to show the navbarDetails and homeView
                                        // For example:
                                        // self.showNavbarDetails = true
                                        // self.showHomeView = true
                                    }
                            case 2:
                                SettingsView()
                            default:
                                EmptyView()
                            }
                        }
                    }
                }

                struct MyReviewsView_Previews: PreviewProvider {
                    static var previews: some View {
                        MyReviewsView()
                    }
                }
