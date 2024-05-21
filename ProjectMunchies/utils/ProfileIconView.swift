//
//  ProfileIconView.swift
//  ProjectMunchies
//
//  Created by Marcus Mckoy on 5/21/24.
//

import Foundation
import SwiftUI

@ViewBuilder func profileIcon(for geoReader: GeometryProxy) -> some View {
    VStack {
        Menu {
            NavigationLink(destination: MyBunchiesView()) {
                Label("My Bunchies", systemImage: "person.2.square.stack")
            }

            NavigationLink(destination: MyReviewsView()) {
                Label("My Reviews", systemImage: "star.fill")
            }

            NavigationLink(destination: SettingsView()) {
                Label("Settings", systemImage: "lock.fill")
            }
        } label: {
            Image(systemName: "person.circle")
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundColor(.white)
        }
    }
    .padding(.horizontal, 16)
    .padding(.top, 16)
}
