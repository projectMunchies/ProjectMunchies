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

    var body: some View {
        NavigationView {
            VStack {
                // Display live reviews based on what you post
                if !viewModel.newReviews.isEmpty {
                    ForEach(viewModel.newReviews) { review in
                        // Display each live review
                        Text(review.title)
                        Text(review.body)
                        // Add more properties as needed
                    }
                } else {
                    Text("No new reviews yet")
                }
                Button("Close") {
                    // Close the sheet
                }
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
