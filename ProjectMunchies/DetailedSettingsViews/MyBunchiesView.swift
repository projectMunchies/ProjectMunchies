import SwiftUI
import FirebaseAuth
import FirebaseFirestore

struct MyBunchiesView: View {
    @ObservedObject var reviewsViewModel = ReviewsViewModel()
    
    @StateObject private var homeViewModel = HomeViewModel()
    @Binding var profileImage: UIImage
    
    @State private var username: String = ""
    @State private var rating: Int?
    
    var body: some View {
        TabView {
            NavigationStack {
                VStack(spacing: 20) {
                    HStack {
                        Text("Bunchies")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                        
                        Spacer()
                    }
                    .padding(.top, 15)
                    
                    if let rating = rating {
                        HStack(spacing: 4) {
                            ForEach(0..<5) { index in
                                Image(systemName: index < rating ? "star.fill" : "star")
                                    .foregroundColor(.yellow)
                            }
                        }
                    }
                    
                    VStack(spacing: 20) {
                        HStack(spacing: 20) {
                            NavigationLink(destination: MyReviewsView(reviewsViewModel: reviewsViewModel)) {
                                ButtonView(title: "My Reviews", imageName: "star.fill")
                            }

//                            NavigationLink(destination: ContactsView()) {
//                                ButtonView(title: "Contacts", imageName: "person.fill")
//                            }
                        }

                        NavigationLink(destination: FoodDiscover()) {
                            ButtonView(title: "Food Discover", imageName: "fork.knife")
                        }
                    }
                    .padding()
                    .aspectRatio(1, contentMode: .fit)
                    Spacer()
                                   }
                .onAppear {
                    fetchUserReviews()
                    getCurrentUsername { username in
                        self.username = username
                        self.rating = reviewsViewModel.userRating[username]
                    }
                }
                .navigationBarBackButtonHidden(true)
            }
            .tabItem {
                Image(systemName: "fork.knife")
                Text("Bunchies")
            }
            
            SettingsView(profileImage: $profileImage)
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                }
        }
    }
    
    private func fetchUserReviews() {
        getCurrentUsername { username in
            reviewsViewModel.getUserReviews(profileId: username) { _ in }
            reviewsViewModel.getUserLikedReviews(profileId: username) { likedReviews in
                reviewsViewModel.userLikedReviews = likedReviews
            }
        }
    }
    
    private func getCurrentUsername(completion: @escaping (String) -> Void) {
        let currentUser = Auth.auth().currentUser
        let username = currentUser?.email?.components(separatedBy: "@").first ?? ""
        print("Current username: \(username)")
        completion(username)
    }
}

struct ReviewCell: View {
    let review: ReviewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(review.username)
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

struct ButtonView: View {
    let title: String
    let imageName: String
    
    var body: some View {
        VStack {
            Image(systemName: imageName)
                .font(.title)
                .foregroundColor(.white)
            
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.blue)
        .cornerRadius(10)
        .aspectRatio(1, contentMode: .fit)
    }
}

struct MyBunchiesView_Previews: PreviewProvider {
    static var previews: some View {
        let defaultImage = UIImage(named: "defaultProfileImage") ?? UIImage()
        MyBunchiesView(profileImage: .constant(defaultImage))
    }
}
