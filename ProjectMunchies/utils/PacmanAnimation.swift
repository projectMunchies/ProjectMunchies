//
//  PacmanAnimation.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 1/30/24.
//

import SwiftUI

struct PacmanAnimation: View {
    var body: some View {
        TimelineView(.animation) { timeline in
            Canvas { context, size in
                let center = CGPoint(x: size.width/2, y: size.height/2)
                let timenow  = timeline.date.timeIntervalSince1970 * 100
                let delta = abs(timenow.remainder(dividingBy: 50))
                
                var path = Path()
                path.addArc(center: center, radius: size.width/2,
                            startAngle: Angle(degrees: delta), endAngle: Angle(degrees: 360 - delta), clockwise: false)
                path.addLine(to: center)
                
                // Draw background circle
                context.fill(path, with: .color(.blue))
                
                // Draw eyes
                context.fill(Path(ellipseIn: CGRect(x: size.width / 2, y: size.height / 4,
                                                    width: 3, height: 3)), with: .color(.black))
            }
            .frame(width: 30, height: 30)
        }
    }
}

#Preview {
    PacmanAnimation()
}
