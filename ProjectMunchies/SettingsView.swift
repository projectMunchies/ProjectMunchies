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
    @State private var showHamburgerMenu: Bool = false
    
    var body: some View {
        GeometryReader{ geoReader in
            ZStack{
                Color.white
                    .ignoresSafeArea()
                ZStack{
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
                    .position(x: geoReader.frame(in: .local).midX, y: geoReader.size.height * 0.65)
                    
                    Text("Settings")
                        .bold()
                        .foregroundColor(.black)
                        .font(.largeTitle)
                        .position(x:geoReader.size.width * 0.2, y:geoReader.size.height * 0.1)
                    
                    Header(showHamburgerMenu: $showHamburgerMenu, isLoading: .constant(false), foodFilter: .constant(MockService.foodFilterSampleData))
                }
                .disabled(self.showHamburgerMenu ? true : false)
            }
            
            //Display HamburgerMenu
            if self.showHamburgerMenu {
                HamburgerMenu(showHamburgerMenu: self.$showHamburgerMenu, geoReader: geoReader)
                    .frame(width: geoReader.size.width/2)
                    .padding(.trailing, geoReader.size.width * 0.5)
            }
        }
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
