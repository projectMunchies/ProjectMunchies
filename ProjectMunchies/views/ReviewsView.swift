//
//  ReviewsView.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 5/31/24.
//

import SwiftUI

struct ReviewsView: View {
    @Binding var sheetIndents: Set<PresentationDetent>
    @Binding var activeTab: NavBarTabsModel
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
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
    ReviewsView(sheetIndents: .constant([.height(60),.medium, .large]), activeTab: .constant(.reviews))
}
