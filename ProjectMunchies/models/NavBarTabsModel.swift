//
//  Tab.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 5/30/24.
//

import SwiftUI

/// Tabs
enum NavBarTabsModel: String, CaseIterable {
    case filter = "Filter"
    case liveReviews = "Live Reviews"
    case crunchAI = "CrunchAI"
    
    var symbol: String {
        switch self  {
        case .filter:
            "figure.2.arms.open"
        case .liveReviews:
            "macbook.and.iphone"
        case .crunchAI:
            "circle.grid.2x2.fill"
        }
    }
}
