//
//  ProfileView.swift
//  ProjectMunchies
//
//  Created by Marcus Mckoy on 6/4/24.
//

import SwiftUI

struct ProfileView: View {
    @Binding var sheetIndents: Set<PresentationDetent>
    @Binding var activeTab: NavBarTabsModel
    
    var body: some View {
        Text("My Reviews and star rating here along with settings")
        Button(action: {
            self.sheetIndents = [.height(60), .medium, .large]
            self.activeTab = .filter
        }) {
            Text("Close")
                .padding(.vertical, 10)
                .padding(.horizontal, 20)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    ProfileView(sheetIndents: .constant([.height(60),.medium, .large]), activeTab: .constant(.profile))
}
