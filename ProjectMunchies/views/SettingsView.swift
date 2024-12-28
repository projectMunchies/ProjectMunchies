//
//  SettingsView.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 7/30/23.
//

import SwiftUI
import Firebase

struct SettingsView: View {
    @Binding var sheetIndents: Set<PresentationDetent>
    @Binding var activeTab: NavBarTabsModel
    @EnvironmentObject var viewRouter: ViewRouter
    @StateObject private var homeViewModel = ProfilesViewModel()
//    @State private var showSheet = false
//    @State private var isEditingInfo = false
//    @State var isLargeImageAlert: Bool = false
//    @State private var showHamburgerMenu: Bool = false

    var body: some View {
                VStack {
//                    imageSection()
//                    
//                    if isEditingInfo {
//                        EditProfileView()
//                    }
                    Spacer()
                    mainButtons()
                    Spacer()
                }
//                .sheet(isPresented: $showSheet) {
//                    ImagePicker(sourceType: .photoLibrary, selectedImage: $homeViewModel.profileImage)
//                        .background(Color.white.cornerRadius(20))
//                        .padding()
//                }
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
//
//    private func imageSection() -> some View {
//        VStack {
//            ZStack{
//                Image(uiImage: homeViewModel.profileImage)
//                    .resizable()
//                    .frame(width: 200, height: 200)
//                    .background(Color.black.opacity(0.2))
//                    .aspectRatio(contentMode: .fill)
//                    .clipShape(Circle())
//
//                
//                if isEditingInfo {
//                    Button(action: {
//                        showSheet = true
//                    }) {
//                        Image(systemName: "pencil.circle.fill")
//                            .resizable()
//                            .frame(width: 40, height: 40)
//                    }
//                    .position(x: 250, y: 180)
//                }
//            }
//                    
////            // Horizontal circular buttons
////            HStack {
////                Button(action: {
////                    // Handle "My Bunchies" action
////                }) {
////                    Image(systemName: "plus.circle")
////                        .resizable()
////                        .frame(width: 40, height: 40)
////                        .foregroundColor(.white)
////                        .background(Color.gray)
////                        .clipShape(Circle())
////                }
////                .padding()
////                .sheet(isPresented: $showSheet) {
////                   // BunchiesView()
////                }
////
////                Button(action: {
////                    // Handle "Privacy and Security" action
////                }) {
////                    Image(systemName: "lock.fill")
////                        .resizable()
////                        .frame(width: 38, height: 38)
////                        .font(.system(size: 1))
////                        .foregroundColor(Color(red: 255/255, green: 215/255, blue: 100/255))
////                        .background(Color.black)
////                        .clipShape(Circle())
////                        .overlay(
////                                        Circle()
////                                            .stroke(Color.white, lineWidth: 3)
////                                    )                }
////                .padding()
////
////                Button(action: {
////                    // Handle "My Reviews" action
////                }) {
////                    Image(systemName: "star.fill")
////                        .resizable()
////                        .frame(width: 38, height: 38)
////                        .foregroundColor(.white)
////                        .background(Color.gray)
////                        .clipShape(Circle())
////                        .overlay(
////                                        Circle()
////                                            .stroke(Color.white, lineWidth: 3)
////                                    )
////                }
////                .padding()
////            }
//        }
//    }
    
    private func mainButtons() -> some View {
        VStack {
//                        Button(action: {
//                            if isEditingInfo {
            //                    homeViewModel.uploadStorageFile(image: homeViewModel.profileImage, profileId: homeViewModel.userProfile.id) { message in
            //                        if message == "image too large" {
            //                            isLargeImageAlert.toggle()
            //                        }
            //                    }
//                            }
//                            isEditingInfo.toggle()
//                        }) {
//                            Text(isEditingInfo ? "Save Profile" : "Edit Profile")
//                                .frame(width: 360, height: 50)
//                                .foregroundColor(.white)
//                                .background(Color.gray)
//                                .cornerRadius(10)
//                        }
            
                Button(action: {
                    signOutUser()
                }) {
                    Text("Sign Out")
                        .frame(width: 360, height: 50)
                        .background(Color.gray)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                }
    
                Button(action: {
                    deleteUser()
                }) {
                    Text("Delete Account")
                        .frame(width: 360, height: 50)
                        .background(Color.gray)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                }
        
            
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(sheetIndents: .constant([.height(60),.medium, .large]), activeTab: .constant(.settings))
    }
}
