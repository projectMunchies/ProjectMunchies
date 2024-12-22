//
//  venueTabsView.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 9/9/24.
//

import SwiftUI

struct venueTabsView: View {
    var body: some View {
        GeometryReader{ geoReader in
            VStack{
                ZStack{
                    Text("Specials")
                        .bold()
                        .font(.system(size: 15))
                        .foregroundColor(.white)
                        .overlay {
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(.white, lineWidth: 2)
                                .frame(width: 80, height: 25)
                        }
                    
                    ZStack{
                        Circle()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.red)

                        Text("1")
                            .bold()
                            .font(.system(size: 15))
                            .foregroundColor(.white)
                    }
                    .position(x: geoReader.size.width * 0.7, y:geoReader.size.height * 0.48)
                }
            }
        }
    }
}

#Preview {
        venueTabsView()
}
