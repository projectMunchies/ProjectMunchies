//
//  MyReviewsIView.swift
//  ProjectMunchies
//
//  Created by Marcus Mckoy on 2/3/24.
//
import SwiftUI

struct MyReviewsView: View {
    @StateObject var viewModel = ReviewsViewModel() // Inject ReviewsViewModel
    @State private var isSettingsPresented = false
    @State private var selectedView: Int?
    @State private var showAllReviews = false

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
                                ForEach(viewModel.reviews) { review in
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
            .padding()
            .onAppear {
                // Fetch new reviews based on what you post
                viewModel.getAllNewReviews { newReviews in
                    // Do something with new reviews if needed
                    // In this case, it will automatically update the view
                }
            }
            .sheet(isPresented: $isSettingsPresented) {
                if let selectedView = selectedView {
                    switch selectedView {
                    case 0:
                        MyBunchiesView()
                    case 1:
                        MyReviewsView()
                    case 2:
                        SettingsView()
                    default:
                        EmptyView()
                    }
                }
            }
            .navigationBarItems(
                leading: VStack(alignment: .leading) {
                    Text("My Reviews").font(.title)
                    HStack {
                        ForEach(0..<5) { _ in
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                        }
                    }
                },
                trailing: profileIcon()
            )
        }
    }

    // Profile icon function
    @ViewBuilder
    func profileIcon() -> some View {
        Menu {
            Button(action: {
                selectedView = 0
            }) {
                Label("My Bunchies", systemImage: "person.2.square.stack")
            }
            Button(action: {
                selectedView = 1
            }) {
                Label("My Reviews", systemImage: "star.fill")
            }
            Button(action: {
                selectedView = 2
            }) {
                Label("Settings", systemImage: "lock.fill")
            }
        } label: {
            Image(systemName: "person.circle")
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundColor(.black)
        }
    }
}

struct MyReviewsView_Previews: PreviewProvider {
    static var previews: some View {
        MyReviewsView()
    }
}
