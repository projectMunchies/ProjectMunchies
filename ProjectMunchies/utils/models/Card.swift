//
//  Card.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 1/9/24.
//

import SwiftUI

struct Card: Identifiable, Hashable, Equatable {
    var id: UUID = .init()
    var image: String
    var title: String
    var previousOffset: CGFloat = 0
}
