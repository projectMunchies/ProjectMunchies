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
    
    //Animated View properties
    @State var currentIndex: Int = 0
    
    
    var body: some View {
        GeometryReader{ geoReader in
            ZStack{
                Color.white
                    .ignoresSafeArea()
                
                BGView()
                
                ZStack{
                    VStack{
                        imageSection(for: geoReader)
                        
                        Spacer()
                            .frame(height:geoReader.size.height * 0.08)
                        
                        mainButtons(for: geoReader)
                    }
                    .position(x: geoReader.frame(in: .local).midX, y: geoReader.size.height * 0.52)
                    .sheet(isPresented: $showSheet){
                                            // Pick an image from the photo library:
                                            ImagePicker(sourceType: .photoLibrary, selectedImage: $homeViewModel.profileImage)
                                            
                                            //  If you wish to take a photo from camera instead:
                                            // ImagePicker(sourceType: .camera, selectedImage: self.$image)
                                        }
                    
                    Text("Settings")
                        .bold()
                        .foregroundColor(.black)
                        .font(.largeTitle)
                        .position(x:geoReader.size.width * 0.2, y:geoReader.size.height * 0.1)
                    
                    Header(showHamburgerMenu: $showHamburgerMenu, isLoading: .constant(false), foodFilter: .constant(MockService.foodFilterSampleData), filteredCards: .constant([]), homeViewModel: homeViewModel)
                }
                .position(x: geoReader.frame(in: .local).midX , y: geoReader.frame(in: .local).midY)
                .disabled(self.showHamburgerMenu ? true : false)
            }
            //.navigationBarBackButtonHidden(true)
            .onAppear {
                homeViewModel.getUserProfile() {(userProfileId) -> Void in
                    if userProfileId != "" {
                        //get profileImage
                        homeViewModel.getImageStorageFile(profileId: userProfileId)
                    }
                }
            }
            
            //Display HamburgerMenu
            if self.showHamburgerMenu {
                HamburgerMenu(showHamburgerMenu: self.$showHamburgerMenu, geoReader: geoReader)
                    .frame(width: geoReader.size.width/2)
                    .padding(.trailing, geoReader.size.width * 0.5)
            }
        }
    }
    
    
    // Blurred BG
    @ViewBuilder
    func BGView()->some View{
        GeometryReader{proxy in
            let size = proxy.size
            
            TabView(selection: $currentIndex) {
                ForEach(movies.indices, id: \.self){index in
                    Image(movies[index].artwork)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: size.width, height: size.height)
                        .clipped()
                        .tag(index)
                    
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .animation(.easeInOut, value: currentIndex)
            
            let color: Color = .white
            //Custom Gradient
            LinearGradient(colors: [
                .white,
                .clear,
                color

            ], startPoint: .top, endPoint: .bottom)
            
            // Blurred Overlay
            Rectangle()
                .fill(.ultraThinMaterial)
        }
        .ignoresSafeArea()
    }
    
    
    
    private func deleteUser(){
        let user = Auth.auth().currentUser
        user?.delete() { error in
            if let error = error {
                print("Error deleting account")
                print(error)
                
            }else {
                viewRouter.currentPage = .signinPage
            }
        }
    }
    
    private func signOutUser(){
        let firebaseAuth = Auth.auth()
        do{
            try firebaseAuth.signOut()
        }catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
            return
        }
        viewRouter.currentPage = .signinPage
    }
    
    private func imageSection(for geoReader: GeometryProxy) -> some View {
        VStack{
            Image(uiImage: homeViewModel.profileImage)
                .resizable()
                .frame(width: 250, height: 250)
                .background(Color.black.opacity(0.2))
                .aspectRatio(contentMode: .fill)
                .clipShape(Circle())
            
            if(editInfo) {
                Button(action: {
                    showSheet = true
                }) {
                    Text("Upload Image")
                        .font(.headline)
                        .frame(width: geoReader.size.width * 0.4, height: geoReader.size.height * 0.04)
                        .background(Color.blue)
                        .cornerRadius(geoReader.size.height * 0.04)
                        .shadow(radius: 10, x: 10, y: 10)
                        .foregroundColor(Color.white)
                }
            }
        }
    }
//
//    private func saveAllInfo(){
//        if editInfo == false {
//            homeViewModel.updateUserProfile {(profileId) -> Void in
//                if profileId != "" {
//                    uploadStorageFile(image: homeViewModel.profileImage, profileId: homeViewModel.userProfile.id)
//                }
//
//
//
//            }
//        }
//    }
    
//    private func uploadStorageFile(image: UIImage, profileId: String){
//            let storageRef = storage.reference().child("\(String(describing: profileId))"+"/images/image.jpg")
//
//            let data = image.jpegData(compressionQuality: 0.2)
//
//            let metadata = StorageMetadata()
//            metadata.contentType = "image/jpg"
//
//            if let data = data {
//                storageRef.putData(data, metadata: metadata) { (metadata, error) in
//                    if let error = error {
//                        print("Error while uploading file: ", error)
//                    }
//
//                    if let metadata = metadata {
//                        print("Metadata: ", metadata)
//                    }
//                }
//            }
//        }
    
    private func mainButtons(for geoReader: GeometryProxy) -> some View {
        VStack{
            Button(action: {
                if editInfo == true {
                    homeViewModel.uploadStorageFile(image: homeViewModel.profileImage, profileId: homeViewModel.userProfile.id) {(message) -> Void in
                        if message == "image too large" {
                            isLargeImageAlert.toggle()
                        }
                    }
                }
                        editInfo.toggle()
                       // saveAllInfo()
                    }) {
                        Text(editInfo ? "Save Profile" : "Edit Profile")
                            .foregroundColor(.white)
                            .frame(width: geoReader.size.width * 0.8, height: geoReader.size.height * 0.08)
                            .background(Color.gray)
                            .cornerRadius(geoReader.size.width * 0.06)
                            .shadow(radius: geoReader.size.width * 0.02, x: geoReader.size.width * 0.04, y: geoReader.size.width * 0.04)
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
