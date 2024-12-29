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
    @Binding var settingsDetent: PresentationDetent
    @Binding var activeTab: NavBarTabsModel
    @EnvironmentObject var viewRouter: ViewRouter
    @StateObject private var homeViewModel = ProfilesViewModel()
    
    var body: some View {
        VStack {
            Spacer()
            mainButtons()
            Spacer()
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
    
    private func mainButtons() -> some View {
        VStack {
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
        SettingsView(sheetIndents: .constant([.height(60),.medium, .large]),settingsDetent: .constant(.height(60)), activeTab: .constant(.settings))
    }
}
