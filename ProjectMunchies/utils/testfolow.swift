//
//  testfolow.swift
//  ProjectMunchies
//
//  Created by Marcus Mckoy on 5/22/24.
//

import SwiftUI
struct ContentView: View {
    @State private var isPresented = false
    var body: some View {
        Button("Present") {
            isPresented.toggle()
        }
        .fullScreenCover(isPresented: $isPresented) {
            ModalView()
        }
    }
}
