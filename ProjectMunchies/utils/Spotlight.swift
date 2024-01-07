//
//  Spotlight.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 1/7/24.
//

import SwiftUI

extension View {
    // MARK: New modifier for adding elements for spotlight preview
    @ViewBuilder
    func addSpotlight(_ id: Int, shape: SpotlightShape = .rectangle, roundedRadius: CGFloat = 0, text: String = "")-> some View {
        self
        // MARK: Using anchor preference for retreiving view's bounds region
            .anchorPreference(key: BoundsKey.self, value: .bounds) {[
                id: BoundsKeyProperties(shape: shape, anchor: $0, text: text, radius: roundedRadius)]}
    }
    
    @ViewBuilder
    func addSpotlightOverlay(show: Binding<Bool>, currentSpot: Binding<Int>) -> some View {
        self
            .overlayPreferenceValue(BoundsKey.self) { values in
                GeometryReader{ proxy in
                    if let preference = values.first(where: { item in
                        item.key == currentSpot.wrappedValue
                    }){
                        let screenSize = proxy.size
                        let anchor = proxy[preference.value.anchor]
                        
                        // MARK: Spotlight view
                        SpotlightHelperView(screenSize: screenSize, rect: anchor, show: show, currentSpot: currentSpot, properties: preference.value){
                            if currentSpot.wrappedValue <= (values.count){
                                currentSpot.wrappedValue += 1
                            }else {
                                show.wrappedValue = false
                            }
                        }
                    }
                }
                .ignoresSafeArea()
                .animation(.easeInOut, value: show.wrappedValue)
                .animation(.easeInOut, value: currentSpot.wrappedValue)
            }
    }
    
    // MARK: Helper view
    @ViewBuilder
    func SpotlightHelperView(screenSize: CGSize, rect: CGRect, show: Binding<Bool>, currentSpot: Binding<Int>, properties: BoundsKeyProperties, onTap: @escaping ()->()) -> some View {
        Rectangle()
            .fill(.ultraThinMaterial)
            .environment(\.colorScheme, .dark)
            .opacity(show.wrappedValue ? 1 : 0)
        // MARK: Spotlight text
            .overlay(alignment: .topLeading){
                Text(properties.text)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                // MARK: Extracting text size
                    .opacity(0)
                    .overlay {
                        GeometryReader{ proxy in
                            let textSize = proxy.size
                            
                            Text(properties.text)
                                .font(.title2)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                            // MARK: Dynamic text alignment
                            // MARK: Horizontal checking
                                .offset(x: (rect.minX + textSize.width) > (screenSize.width - 15) ? -((rect.minX + textSize.width) - (screenSize.width - 15) ) : 0)
                            // MARK: Vertical checking
                                .offset(y: (rect.maxY + textSize.height) > (screenSize.height - 50) ? -(textSize.height + (rect.maxY - rect.minY) + 30) : 30)
                        }
                        .offset(x: rect.minX, y: rect.maxY)
                    }
            }
        //  MARK: Reverse masking the current spot
        // By doing this, the currently spotlighted View will be highlighted
            .mask {
                Rectangle()
                    .overlay(alignment: .topLeading) {
                        let radius = properties.shape == .circle ? (rect.width / 2)
                        : (properties.shape == .rectangle ? 0 : properties.radius)
                        RoundedRectangle(cornerRadius: radius, style: .continuous)
                            .frame(width: rect.width, height: rect.height)
                            .offset(x: rect.minX, y: rect.minY)
                            .blendMode(.destinationOut)
                    }
            }
            .onTapGesture {
                // MARK: Updating spotlight spot
                // If available
                onTap()
            }
    }
}

// MARK: Spotlight shape
enum SpotlightShape {
    case circle
    case rectangle
    case rounded
}

// MARK: Bounds preference key
struct BoundsKey: PreferenceKey {
    static var defaultValue: [Int: BoundsKeyProperties] = [:]
    
    static func reduce(value: inout [Int : BoundsKeyProperties], nextValue: () -> [Int : BoundsKeyProperties]) {
        value.merge(nextValue()){$1}
    }
}

// MARK: Bounds preference key properties
struct BoundsKeyProperties {
    var shape: SpotlightShape
    var anchor: Anchor<CGRect>
    var text: String = ""
    var radius: CGFloat = 0
}
