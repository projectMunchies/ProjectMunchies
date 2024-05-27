//
//  SettingsView.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 7/30/23.
//
import SwiftUI
import Firebase

struct SettingsView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @StateObject private var homeViewModel = HomeViewModel()
    @State private var showImagePicker = false
    @State private var editInfo = false
    @State var isLargeImageAlert: Bool = false
    @State private var userProfileId = ""
    @Binding var profileImage: UIImage
    
    var body: some View {
        NavigationStack {
            GeometryReader { geoReader in
                ZStack {
                    Color.white
                    
                    VStack {
                        
                        
                        imageSection(for: geoReader)
                        
                        Spacer()
                            .frame(height: geoReader.size.height * 0.08)
                        
                        mainButtons(for: geoReader)
                    }
                    .position(x: geoReader.frame(in: .local).midX, y: geoReader.size.height * 0.5)
                    
                    Text("Settings")
                        .bold()
                        .foregroundColor(.black)
                        .font(.largeTitle)
                        .position(x: geoReader.size.width * 0.2, y: geoReader.size.height * 0.02)
                }
                .position(x: geoReader.frame(in: .local).midX, y: geoReader.frame(in: .local).midY)
            }
            .navigationBarBackButtonHidden(true)
            .onAppear {
                homeViewModel.getUserProfile { userProfileId in
                    if userProfileId != "" {
                        homeViewModel.getImageStorageFile(profileId: userProfileId)
                    }
                }
            }
            .sheet(isPresented: $showImagePicker, onDismiss: nil) {
                ImagePicker(sourceType: .photoLibrary, selectedImage: $homeViewModel.profileImage)
                    .background(Color.white.cornerRadius(20))
                    .padding()
            }
        }
    }
    
    private func deleteUser() {
        let user = Auth.auth().currentUser
        user?.delete { error in
            if let error = error {
                print("Error deleting account")
                print(error)
            } else {
                viewRouter.currentPage = .signinPage
            }
        }
    }
    
    private func signOutUser() {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
            return
        }
        viewRouter.currentPage = .signinPage
    }
    
    private func imageSection(for geoReader: GeometryProxy) -> some View {
        VStack {
            Image(uiImage: homeViewModel.profileImage)
                .resizable()
                .frame(width: 250, height: 250)
                .background(Color.black.opacity(0.2))
                .aspectRatio(contentMode: .fill)
                .clipShape(Circle())
            
            if editInfo {
                Button(action: {
                    showImagePicker = true
                }) {
                    Text("Upload Image")
                        .font(.headline)
                        .frame(width: geoReader.size.width * 0.4, height: geoReader.size.height * 0.04)
                        .background(Color.blue)
                        .cornerRadius(geoReader.size.height * 0.04)
                        .foregroundColor(Color.white)
                }
            }
        }
        .onChange(of: homeViewModel.profileImage) { newImage in
            profileImage = newImage
        }
    }
    
    private func mainButtons(for geoReader: GeometryProxy) -> some View {
        VStack {
            Button(action: {
                if editInfo {
                    homeViewModel.uploadStorageFile(image: homeViewModel.profileImage, profileId: homeViewModel.userProfile.id) { message in
                        if message == "image too large" {
                            isLargeImageAlert.toggle()
                        } else {
                            profileImage = homeViewModel.profileImage
                        }
                    }
                }
                editInfo.toggle()
            }) {
                Text(editInfo ? "Save Profile" : "Edit Profile")
                    .foregroundColor(.white)
                    .frame(width: geoReader.size.width * 0.8, height: geoReader.size.height * 0.08)
                    .background(Color.gray)
                    .cornerRadius(geoReader.size.width * 0.06)
            }
            
            Button(action: {
                signOutUser()
            }) {
                Text("Sign Out")
                    .frame(width: geoReader.size.width * 0.8, height: geoReader.size.height * 0.08)
                    .background(Color.gray)
                    .cornerRadius(geoReader.size.width * 0.06)
                    .foregroundColor(.white)
            }
            
            Button(action: {
                deleteUser()
            }) {
                Text("Delete Account")
                    .frame(width: geoReader.size.width * 0.8, height: geoReader.size.height * 0.08)
                    .background(Color.gray)
                    .cornerRadius(geoReader.size.width * 0.06)
                    .foregroundColor(.white)
            }
        }
    }
    
    
    
    struct SettingsView_Previews: PreviewProvider {
        static var previews: some View {
            
            let viewRouter = ViewRouter()
            let homeViewModel = HomeViewModel()
            
            let previewImage = UIImage(named: "defaultProfileImage") ?? UIImage()
            
            return NavigationView {
                SettingsView(profileImage: .constant(previewImage))
                    .environmentObject(viewRouter)
                    .environmentObject(homeViewModel)
            }
        }
    }
}
