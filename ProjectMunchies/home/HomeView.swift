//
//  HomeView.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 7/27/23.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var homeViewModel = HomeViewModel()
    
    @State private var showAddImagePopover: Bool = false
    @State private var input1: String = ""
    @State private var isLoading: Bool = false
    @State private var showHamburgerMenu: Bool = false
    @State private var showImageSheet: Bool = false
    @State private var editInfo: Bool = false
    @State private var profileImage: UIImage = UIImage()
    
    var body: some View {
        GeometryReader{ geoReader in
            ZStack{
                Color.white
                    .ignoresSafeArea()
                
                ZStack{
                    if isLoading {
                        ProgressView()
                            .tint(.black)
                    } else {
                        CardsView(geoReader: geoReader)
                            .position(x:geoReader.size.width * 0.5, y:geoReader.size.height * 0.55)
                    }
                    
                    subHeaderSection(for: geoReader)
                        .position(x:geoReader.size.width * 0.55, y:geoReader.size.height * 0.12)
                    Header(showHamburgerMenu: $showHamburgerMenu, isLoading: $isLoading)
                }
                .disabled(self.showHamburgerMenu ? true : false)
                .onAppear{
                    homeViewModel.getUserProfile() {(userProfileId) -> Void in
                        if userProfileId != "" {
                            //get profileImage
                            homeViewModel.getImageStorageFile(profileId: userProfileId)
                        } else {
                            homeViewModel.createUserProfile() {(newUserProfileId) -> Void in
                                if newUserProfileId != "" {
                                    showAddImagePopover.toggle()
                                }
                            }
                        }
                    }
                }
                .popover(isPresented: $showAddImagePopover) {
                    addImagePopover(for: geoReader)
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
    
    private func subHeaderSection(for geoReader: GeometryProxy) -> some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack{
                ZStack{
                    Text("")
                        .frame(width: 120, height: 35)
                        .background(Color("MainColor"))
                        .cornerRadius(15)
                    
                    Text("Happy Hour")
                        .foregroundColor(.white)
                        .font(.title3)
                }
                
                ZStack{
                    Text("")
                        .frame(width: 140, height: 35)
                        .background(Color("MainColor"))
                        .cornerRadius(15)
                    
                    Text("8:30-9:30pm")
                        .foregroundColor(.white)
                        .font(.title3)
                }
                
                ZStack{
                    Text("")
                        .frame(width: 110, height: 35)
                        .background(Color("MainColor"))
                        .cornerRadius(15)
                    
                    Text("Tomorrow")
                        .foregroundColor(.white)
                        .font(.title2)
                }
                
                ZStack{
                    Text("")
                        .frame(width: 110, height: 35)
                        .background(Color("MainColor"))
                        .cornerRadius(15)
                    
                    Text("Tomorrow")
                        .foregroundColor(.white)
                        .font(.title2)
                }
            }
        }
        .frame(height: 100)
    }
    
    private func addImagePopover(for geoReader: GeometryProxy) -> some View {
        ZStack{
            Color.white
            
            VStack{
                Group{
                    Text("Add profile image")
                        .foregroundColor(Color("MainColor"))
                        .font(.custom("Chalkduster", size: geoReader.size.height * 0.035))
                        .multilineTextAlignment(.center)
                    
                    imageSection(for: geoReader)
                    Spacer()
                        .frame(height: geoReader.size.height * 0.04)
                }
                
                Button(action: {
                    //if SaveImage button displayed, save image, close popover and open showIntroPopover
                    if editInfo == true {
                        homeViewModel.uploadStorageFile(image: homeViewModel.profileImage, profileId: homeViewModel.userProfile.id)
                        showAddImagePopover.toggle()
                    }
                    editInfo.toggle()
                }) {
                    Text(editInfo ? "Save Image" : "Add Image")
                        .font(.system(size: 25))
                        .frame(width: 380, height: 70)
                        .background(Color.green)
                        .cornerRadius(40)
                        .foregroundColor(.white)
                }
                .padding(.top)
            }
        }
        .sheet(isPresented: $showImageSheet){
            // Pick an image from the photo library:
            ImagePicker(sourceType: .photoLibrary, selectedImage: $profileImage)
            
            //  If you wish to take a photo from camera instead:
            // ImagePicker(sourceType: .camera, selectedImage: self.$image)
        }
    }
    
    private func imageSection(for geoReader: GeometryProxy) -> some View {
        VStack{
            Image(uiImage: profileImage)
                .resizable()
                .frame(width: 150, height: 150)
                .background(Color.black.opacity(0.2))
                .aspectRatio(contentMode: .fill)
                .clipShape(Circle())
            
            if(editInfo) {
                Button(action: {
                    showImageSheet = true
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
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
