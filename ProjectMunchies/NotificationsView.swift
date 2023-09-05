//
//  NotificationsView.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 8/1/23.
//

import SwiftUI

struct NotificationsView: View {
    var body: some View {
        ZStack{
            Color.white
                .ignoresSafeArea()
            
            Text("NO NOTIFICATIONS AT THIS TIME")
                .foregroundColor(.black)
        }
    }
}

struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView()
    }
}
