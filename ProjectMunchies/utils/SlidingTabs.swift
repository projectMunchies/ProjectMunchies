//
//  SlidingTabs.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 10/21/23.
//

import SwiftUI

struct SlidingTabs: View {
    @Binding var slidingTabsIndex: Int
    let tabNames: [String]
    let geoReader: GeometryProxy
    
    var body: some View {
        VStack{
            HStack{
                Text("\(tabNames[0])")
                    .frame(width: geoReader.size.width * 0.3)
                    .foregroundColor(self.slidingTabsIndex == 0 ? .white : Color(.blue).opacity(0.7))
                    .fontWeight(.bold)
                    .padding(.vertical,geoReader.size.width * 0.03)
                    .padding(.horizontal,geoReader.size.width * 0.09)
                    .background(Color(.blue).opacity(self.slidingTabsIndex == 0 ? 1 : 0))
                    .clipShape(Capsule())
                    .onTapGesture {
                        withAnimation(.default){
                            self.slidingTabsIndex = 0
                        }
                    }

                Text("\(tabNames[1])")
                    .frame(width: geoReader.size.width * 0.3)
                    .foregroundColor(self.slidingTabsIndex == 1 ? .white : Color(.blue).opacity(0.7))
                    .fontWeight(.bold)
                    .padding(.vertical,geoReader.size.width * 0.03)
                    .padding(.horizontal,geoReader.size.width * 0.09)
                    .background(Color(.blue).opacity(self.slidingTabsIndex == 1 ? 1 : 0))
                    .clipShape(Capsule())
                    .onTapGesture {
                        withAnimation(.default){
                            self.slidingTabsIndex = 1
                        }
                    }
            }
            .frame(width: geoReader.size.width * 0.9)
            .background(Color.black.opacity(0.06))
            .clipShape(Capsule())
        }
    }
}

struct SlidingTabs_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader{ proxy in
            SlidingTabs(slidingTabsIndex: .constant(0), tabNames: ["Connect","Discover"], geoReader: proxy)
        }
    }
}
