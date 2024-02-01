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
    @State private var showSheet = false
    @State private var editInfo = false
    @State var isLargeImageAlert: Bool = false
    @State private var showHamburgerMenu: Bool = false

    var body: some View {
        GeometryReader { geoReader in
            ZStack {
                Color.white
                    .ignoresSafeArea()

                VStack {
                    imageSection(for: geoReader)

                    Spacer()
                        .frame(height: geoReader.size.height * 0.08)

                    mainButtons(for: geoReader)
                }
                .position(x: geoReader.frame(in: .local).midX, y: geoReader.size.height * 0.5)
                .sheet(isPresented: $showSheet) {
                    ImagePicker(sourceType: .photoLibrary, selectedImage: $homeViewModel.profileImage)
                        .background(Color.white.cornerRadius(20))
                        .padding()
                }

                Text("Settings")
                    .bold()
                    .foregroundColor(.black)
                    .font(.largeTitle)
                    .position(x: geoReader.size.width * 0.2, y: geoReader.size.height * 0.02)
            }
            .position(x: geoReader.frame(in: .local).midX, y: geoReader.frame(in: .local).midY)
            .disabled(showHamburgerMenu)

            // Display HamburgerMenu
            if self.showHamburgerMenu {
                HamburgerMenu(showHamburgerMenu: self.$showHamburgerMenu, geoReader: geoReader)
                    .frame(width: geoReader.size.width / 2)
                    .padding(.trailing, geoReader.size.width * 0.5)
            }
        }
        .navigationBarBackButtonHidden(true)
        .onAppear {
            homeViewModel.getUserProfile { userProfileId in
                if userProfileId != "" {
                    homeViewModel.getImageStorageFile(profileId: userProfileId)
                }
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
                    showSheet = true
                }) {
                    Text("Upload Image")
                        .font(.headline)
                        .frame(width: geoReader.size.width * 0.4, height: geoReader.size.height * 0.04)
                        .background(Color.blue)
                        .cornerRadius(geoReader.size.height * 0.04)
                        .foregroundColor(Color.white)
                }
            }
                    
            // Horizontal circular buttons
            HStack {
                Button(action: {
                    // Handle "My Bunchies" action
                }) {
                    Image(systemName: "circle.grid.2x2.fill")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(.white)
                        .background(Color.gray)
                        .clipShape(Circle())
                }
                .padding()

                Button(action: {
                    // Handle "Privacy and Security" action
                }) {
                    Image(systemName: "lock.fill")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(.white)
                        .background(Color.gray)
                        .clipShape(Circle())
                }
                .padding()

                Button(action: {
                    // Handle "My Reviews" action
                }) {
                    Image(systemName: "star.fill")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(.white)
                        .background(Color.gray)
                        .clipShape(Circle())
                }
                .padding()
            }
        }
    }
    private func mainButtons(for geoReader: GeometryProxy) -> some View {
        VStack {
            Button(action: {
                if editInfo {
                    homeViewModel.uploadStorageFile(image: homeViewModel.profileImage, profileId: homeViewModel.userProfile.id) { message in
                        if message == "image too large" {
                            isLargeImageAlert.toggle()
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
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
