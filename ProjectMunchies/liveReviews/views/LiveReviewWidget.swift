//
//  LiveReviewWidget.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 1/30/24.
//

import SwiftUI

struct LiveReviewWidget: View {
    @State private var isDropdownOpen: Bool = false
    @State private var liveReviews: [ReviewModel] = []
    
    var body: some View {
        GeometryReader{ geoReader in
            VStack(alignment: .leading){
                HStack {
                    Button(action: {
                        withAnimation {
                            isDropdownOpen.toggle()
                        }
                    }) {
                        
                        Text("Live Reviews ")
                            .foregroundColor(.white)
                            .font(.system(size: 20, weight: .bold))
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(Color.green)
                                    .frame(height: 35)
                            )
                            .opacity(0.7)
                        
                        Image(systemName: isDropdownOpen ? "chevron.up" : "chevron.down")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 12, height: 12)
                            .foregroundColor(.white)
                    }
                    .padding()
                    .zIndex(1)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .overlay(
                    VStack(spacing: 15) {
                        if isDropdownOpen {
                            ScrollView {
                                LazyVStack(spacing: 18) {
                                    ForEach(self.liveReviews, id: \.self) { review in
                                        HStack(alignment: .top) {
                                            Image(systemName: "person.circle")
                                                .resizable()
                                                .frame(width: 30, height: 30)
                                                .background(Color.black.opacity(0.2))
                                                .aspectRatio(contentMode: .fill)
                                                .clipShape(Circle())
                                                .padding(.trailing, 25)
                                            
                                            VStack(alignment: .leading, spacing: 5) {
                                                Text(review.body)
                                                    .foregroundColor(.white)
                                                    .font(.system(size: 16))
                                                
                                                Text("by Anonymous user")
                                                    .foregroundColor(.purple)
                                                    .font(.system(size: 15))
                                            }
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            
                                        }
                                        .padding(.horizontal)
                                    }
                                }
                            }
                            .frame(width: geoReader.size.width * 0.75,                            height: min(geoReader.size.height * 0.60, CGFloat(self.liveReviews.count) * 57.0))
                            .padding()
                            .background(Color.black.opacity(0.7))
                            .cornerRadius(15)
                            .offset(x: -8, y: geoReader.size.height * 0.215)
                        }
                    }
                )
                .frame(maxHeight: .infinity)
            }
            .padding(.leading)
        }
    }
}

#Preview {
    LiveReviewWidget()
}
