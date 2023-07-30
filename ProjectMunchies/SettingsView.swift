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
    
    var body: some View {
        GeometryReader{ geoReader in
            ZStack{
                Color.white
                    .ignoresSafeArea()
                
                VStack{
                    Button(action: {
                        signOutUser()
                    }) {
                        Text("Sign Out")
                            .frame(width: 400, height: 60)
                            .background(Color.gray)
                            .cornerRadius(40)
                            .foregroundColor(.white)
                    }
                    
                    Button(action: {
                       deleteUser()
                    }) {
                        Text("Delete Account")
                            .frame(width: 400, height: 60)
                            .background(Color.gray)
                            .cornerRadius(40)
                            .foregroundColor(.white)
                    }
                }
               // .position(x: geoReader.frame(in: .local).midX, y: geoReader.size.height * 0.65)
                
                Text("Settings")
                    .bold()
                    .foregroundColor(.black)
                    .font(.largeTitle)
                    .position(x:geoReader.size.width * 0.2, y:geoReader.size.height * 0.1)
                
                headerSection(for: geoReader)
            }
        }
    
    }
    
    private func headerSection(for geoReader: GeometryProxy) -> some View {
        HStack{
            Spacer()
            HStack(spacing: 10){
                Image(systemName: "line.3.horizontal")
                    .resizable()
                    .frame(width: 25, height: 20)
                    .font(.system(size: 35))
                    .foregroundColor(.black)
                
                Text("Crunch Bunch")
                    .bold()
                    .foregroundColor(.black)
                    .font(.title2)
            }
            
            Spacer()
                .frame(width: geoReader.size.width * 0.35)
            
            HStack(spacing: 20){
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .font(.system(size: 35))
                    .foregroundColor(.black)
                
                Image(systemName: "bell")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .font(.system(size: 35))
                    .foregroundColor(.black)
            }
            Spacer()
        }
        .position(x:geoReader.size.width * 0.5, y:geoReader.size.height * 0.03)
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
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
