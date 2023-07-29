//
//  Extensions.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 7/28/23.
//

import SwiftUI

extension DragGesture.Value {
    func percentage(in geometry: GeometryProxy) -> CGFloat {
        abs(translation.width / geometry.size.width)
    }
}

extension Array where Element == CardModel {
    func cardOffset(cardId: Int) -> CGFloat {
        CGFloat(count - 1 - cardId) * 8
    }
    
    func cardWidth(in geometry: GeometryProxy, cardId: Int) -> CGFloat {
        geometry.size.width - cardOffset(cardId: cardId)
    }
}
