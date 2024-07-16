//
//  OffsetModifier.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 1/30/24.
//

import SwiftUI

struct OffsetModifier: ViewModifier {
    @Binding var offset: CGFloat
    
    
    func body(content: Content) -> some View {
    content
            .overlay {
                GeometryReader{proxy in
                    let minY = proxy.frame(in: .named("SCROLL")).minY
                    
                    Color.clear
                        .preference(key: OffsetKey.self, value: minY)
                }
                .onPreferenceChange(OffsetKey.self) {minY in
                    self.offset = minY
                }
            }
    }
}

struct OffsetKey: PreferenceKey{
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

extension View {
    @ViewBuilder
    func offsetX(completion: @escaping (CGFloat) -> ()) -> some View {
        self
            .overlay {
                GeometryReader {
                    let minX = $0.frame(in: .scrollView).minX
                    Color.clear
                        .preference(key: OffsetKey.self, value: minX)
                        .onPreferenceChange(OffsetKey.self, perform: { value in
                            completion(value)
                        })
                }
            }
    }
}

extension [Card] {
    func indexOf(_ card: Card) -> Int {
        return self.firstIndex(of: card) ?? 0
    }
}
struct AnchorKey: PreferenceKey {
    static var defaultValue: [String: Anchor<CGRect>] = [:]
    
    static func reduce(value: inout [String: Anchor<CGRect>], nextValue: () -> [String: Anchor<CGRect>]) {
        value.merge(nextValue(), uniquingKeysWith: { $1 })
    }
}
