//
//  ProfileView.swift
//  ProjectMunchies
//
//  Created by Marcus Mckoy on 6/4/24.
//

import SwiftUI

struct ProfileView: View {
    @Binding var sheetIndents: Set<PresentationDetent>
    @StateObject private var homeViewModel = ProfilesViewModel()
    @State private var showSheet = false
    @State private var isEditingInfo = false
    @State var isLargeImageAlert: Bool = false
    @State private var userName: String = ""
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var phoneNumber: String = ""
    @State private var DOB: String = ""
    
    var body: some View {
        ZStack{
            
            Color.gray.ignoresSafeArea()
            VStack{
                imageSection()
                
                if isEditingInfo {
                    editProfileView()
                } else {
                    profileView()
                }
                
                mainButtons()
            }
        }
    }
    
    private func profileView() -> some View {
        VStack{
            Text("dotZ3r0")
                .font(.system(size: 30))
                .foregroundColor(.white)
                .opacity(0.6)
                .bold()
        }
    }
    private func editProfileView() -> some View {
        VStack{
            VStack{
                Text("UserName:")
                    .font(.system(size: 20))
                    .foregroundColor(.white)
                    .padding(.trailing, 270)
                    .opacity(0.6)
                    .bold()
                
                TextField("UserName", text: $userName)
                    .frame(width: 360, height: 50)
                    .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                    .background(Color(red: 0.949, green: 0.949, blue: 0.97))
                    .foregroundColor(.black)
                    .cornerRadius(15)
            }
            .padding(.bottom)
            
            
            VStack{
                Text("Name:")
                    .font(.system(size: 20))
                    .foregroundColor(.white)
                    .padding(.trailing, 270)
                    .opacity(0.6)
                    .bold()
                
                TextField("Name", text: $name)
                    .frame(width: 360, height: 50)
                    .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                    .background(Color(red: 0.949, green: 0.949, blue: 0.97))
                    .foregroundColor(.black)
                    .cornerRadius(15)
            }
            .padding(.bottom)
            
            
            VStack{
                Text("Email:")
                    .font(.system(size: 20))
                    .foregroundColor(.white)
                    .padding(.trailing, 270)
                    .opacity(0.6)
                    .bold()
                
                TextField("Email", text: $email)
                    .frame(width: 360, height: 50)
                    .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                    .background(Color(red: 0.949, green: 0.949, blue: 0.97))
                    .foregroundColor(.black)
                    .cornerRadius(15)
            }
            .padding(.bottom)
            
            VStack{
                Text("Phone Number:")
                    .font(.system(size: 20))
                    .foregroundColor(.white)
                    .padding(.trailing, 240)
                    .opacity(0.6)
                    .bold()
                
                TextField("Phone Number:", text: $phoneNumber)
                    .frame(width: 360, height: 50)
                    .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                    .background(Color(red: 0.949, green: 0.949, blue: 0.97))
                    .foregroundColor(.black)
                    .cornerRadius(15)
            }
            .padding(.bottom)
            
            VStack{
                Text("Date of Birth:")
                    .font(.system(size: 20))
                    .foregroundColor(.white)
                    .padding(.trailing, 250)
                    .opacity(0.6)
                    .bold()
                
                TextField("Date of Birth:", text: $DOB)
                    .frame(width: 360, height: 50)
                    .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                    .background(Color(red: 0.949, green: 0.949, blue: 0.97))
                    .foregroundColor(.black)
                    .cornerRadius(15)
            }
            .padding(.bottom)
            
        }
    }
    
    private func imageSection() -> some View {
        VStack {
            ZStack{
                Image(uiImage: homeViewModel.profileImage)
                    .resizable()
                    .frame(width: 150, height: 150)
                    .background(Color.black.opacity(0.2))
                    .aspectRatio(contentMode: .fill)
                    .clipShape(Circle())
                
            
                    Button(action: {
                        if isEditingInfo {
                            showSheet = true
                        }
                      
                        if !isEditingInfo {
                            isEditingInfo.toggle()
                        }
                      
                    }) {
                        Image(systemName: isEditingInfo ? "plus.circle.fill" : "pencil.circle.fill")
                            .resizable()
                            .frame(width: 40, height: 40)
                    }
                    .padding(.top,120)
                    .padding(.leading,90)
            }
        }
    }
    
    private func mainButtons() -> some View {
        VStack {
            if isEditingInfo {
                Button(action: {
                        //                    homeViewModel.uploadStorageFile(image: homeViewModel.profileImage, profileId: homeViewModel.userProfile.id) { message in
                        //                        if message == "image too large" {
                        //                            isLargeImageAlert.toggle()
                        //                        }
                        //                    }
                    isEditingInfo.toggle()
                }) {
                    Text("Save Profile")
                        .frame(width: 360, height: 50)
                        .foregroundColor(.white)
                        .background(Color.gray)
                        .cornerRadius(10)
                }
            }
         
        }
    }
}

#Preview {
    ProfileView(sheetIndents: .constant([.height(60),.medium, .large]))
}
