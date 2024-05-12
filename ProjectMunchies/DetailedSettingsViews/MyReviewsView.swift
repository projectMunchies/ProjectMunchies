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
                                 }
                                 .padding()
                                 
                                 Spacer()
                             }
                             .padding()
                             .onAppear {
                                 viewModel.fetchAllReviews { _ in }
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
                                 selectedView = 2
                                 isSettingsPresented = true
                             }) {
                                 Label("Settings", systemImage: "lock.fill")
                             }
                         } label: {
                             Image(systemName: "person.circle")
                                 .resizable()
                                 .frame(width: 30, height: 30)
                                 .foregroundColor(.black)
                         }
                         .padding(.horizontal, 16)
                         .padding(.top, 16)
                         .sheet(isPresented: $isSettingsPresented) {
                             if selectedView == 2 {
                                 SettingsView()
                             }
                         }
                     }
                 }

                 struct MyReviewsView_Previews: PreviewProvider {
                     static var previews: some View {
                         MyReviewsView()
                     }
                 }
