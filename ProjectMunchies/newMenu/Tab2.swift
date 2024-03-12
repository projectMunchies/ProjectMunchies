//
//  Tab2.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 2/24/24.
//

import SwiftUI

enum Tab2: String, CaseIterable {
    case people = "People"
    case devices = "Devices"
    case items = "Items"
    case me = "Me"
    
    var symbol: String {
        switch self {
        case .people:
            "figure.2.arms.open"
        case .devices:
            "macbook.and.iphone"
        case .items:
            "circle.grid.2x2.fill"
        case .me:
            "person.circle.fill"
        }
    }
}
