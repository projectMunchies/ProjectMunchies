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
