//
//  PulsingCircle.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 2/11/24.
//

import SwiftUI

struct PulsingCircle: View {
    @State private var scale: CGFloat = 0.5
    
    var body: some View {
        GeometryReader{ geoReader in
            VStack{
                Circle()
                    .foregroundColor(.pink)
                    .scaleEffect(self.scale, anchor: .center)
                    .animation(
                        Animation.easeInOut(duration: 0.6)
                            .repeatForever(), value: self.scale
                    )
                    .onAppear {
                        self.scale = 1
                    }
                    .frame(width: geoReader.size.width * 0.9, height: geoReader.size.height * 0.9)
                    .position(x: geoReader.frame(in: .local).midX, y: geoReader.frame(in: .local).midY)
            }
        }
    }
}

#Preview {
    PulsingCircle()
}
