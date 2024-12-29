//
//  HomeView.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 12/27/24.
//

import SwiftUI

struct HomeView: View {
    @Binding var sheetIndents: Set<PresentationDetent>
    @Binding var settingsDetent: PresentationDetent
    
    var body: some View {
        VStack{
                ProfileView(sheetIndents: $sheetIndents, settingsDetent: $settingsDetent)
        }
    }
}

#Preview {
    HomeView(sheetIndents: .constant([.height(60),.medium, .large]),settingsDetent: .constant(.height(60)))
}
