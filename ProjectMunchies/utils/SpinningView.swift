//
//  SpinningView.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 1/30/24.
//

import SwiftUI

struct SpinningView: View {
    @State private var isSpinning = true
    
    var body: some View {
        VStack {
            Spacer()
            
            if isSpinning {
                SpinningEllipse()
            } else {
                ResetEllipse()
            }
            
            Spacer()
        }
        .navigationTitle("Spinning Animation")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct SpinningEllipse: View {
    @State private var width: CGFloat = 30
    
    var body: some View {
        ZStack{
            Ellipse()
                .frame(width: width, height: 30)
                .foregroundColor(.orange)
            
            Text("2")
                .frame(width: width, height: 10)
        }
        .onAppear {
            withAnimation(.easeInOut.repeatForever(autoreverses: true).speed(1)) {
                width = 0
            }
        }
    }
}

struct ResetEllipse: View {
    var body: some View {
        ZStack{
            Ellipse()
                .frame(width: 40, height: 40)
                .foregroundColor(.orange)
            
            Text("2")
                .frame(width: 40, height: 40)
        }
        
    }
}

#Preview {
    SpinningView()
}
