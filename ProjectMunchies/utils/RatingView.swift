//
//  RatingView.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 10/30/23.
//

import SwiftUI

struct RatingView: View {
    var label = ""
    var maximumRating = 5

    @Binding var rating: Int
    
    var body: some View {
            StarRatingSlider(
                     count: $rating,
                     minimum: 1,
                     maximum: 5,
                     spacing: 8
                 ) { active, i in
                     Image(systemName: "star.fill")
                         .scaledToFit()
                         .foregroundColor(active ? .yellow : .gray.opacity(0.3))
                 }
                 .animation(.easeOut(duration: 0.1), value: rating)
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(label: "", rating: .constant(4))
    }
}

public struct StarRatingSlider<Content>: View where Content: View {
    @Binding public var count: Int
    var minimum: Int = 0
    var maximum: Int = 5
    var spacing: CGFloat = 8
    
    @ViewBuilder var content: (Bool, Int) -> Content
    @State private var starWidth: CGFloat = 0
    
    public var body: some View {
        HStack(spacing: spacing) {
            ForEach(0..<maximum, id: \.self) { i in
                content(i < count, i)
                    .contentSize(width: $starWidth)
                    .onTapGesture {
                        count = i + 1
                    }
            }
        }
        .gesture(
            DragGesture().onChanged(changeDragGesture(value:))
        )
    }
    
    private func changeDragGesture(value: DragGesture.Value) {
        let maximum = maximum
        let minimum = minimum
        let starWidth = starWidth
        let spacing = spacing
        
        let x = value.location.x
        if x < 0 {
            return
        }
        
        let count = Int(x / CGFloat(starWidth + spacing)) + minimum
        switch count {
        case let x where x < minimum:
            self.count = minimum
        case let x where x > maximum:
            self.count = maximum
        default:
            self.count = count
        }
    }
}

struct SizeModifiers: ViewModifier {
    @Binding var size: CGSize
    @Binding var width: CGFloat
    @Binding var height: CGFloat
    var maximum: Bool = false

    func body(content: Content) -> some View {
        content
            .overlay(
                GeometryReader { proxy in
                    Color.clear.onAppear {
                        size = proxy.size
                        width = proxy.size.width
                        height = proxy.size.height
                    }
                    .onChange(of: proxy.size) { newValue in
                        if maximum {
                            size = CGSize(width: max(width, newValue.width), height: max(height, newValue.height))
                            width = size.width
                            height = size.height
                        } else {
                            size = newValue
                            width = newValue.width
                            height = newValue.height
                        }
                    }
                }
            )
    }
}

extension View {
    func contentSize(_ size: Binding<CGSize>) -> some View {
        self.modifier(SizeModifiers(size: size, width: .constant(0), height: .constant(0)))
    }

    func contentSize(height: Binding<CGFloat>, maximum: Bool = false) -> some View {
        self.modifier(SizeModifiers(size: .constant(CGSize(width: 0, height: 0)), width: .constant(0), height: height, maximum: maximum))
    }

    func contentSize(width: Binding<CGFloat>) -> some View {
        self.modifier(SizeModifiers(size: .constant(CGSize(width: 0, height: 0)), width: width, height: .constant(0)))
    }

    func contentSize(width: Binding<CGFloat>, height: Binding<CGFloat>) -> some View {
        self.modifier(SizeModifiers(size: .constant(CGSize(width: 0, height: 0)), width: width, height: height))
    }
}




