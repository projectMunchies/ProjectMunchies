//
//  SheetBackgroundView.swift
//  ProjectMunchies
//
//  Created by Marcus Mckoy on 5/23/24.
//

import SwiftUI

struct SheetBackgroundView: View {
    var body: some View {
        Color.clear
            .edgesIgnoringSafeArea(.all)
            .background(
                VisualEffectView(effect: UIBlurEffect(style: .systemThinMaterial))
                    .edgesIgnoringSafeArea(.all)
            )
    }
}

struct VisualEffectView: UIViewRepresentable {
    var effect: UIVisualEffect?
    
    func makeUIView(context: UIViewRepresentableContext<Self>) -> UIVisualEffectView {
        UIVisualEffectView()
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: UIViewRepresentableContext<Self>) {
        uiView.effect = effect
    }
}
