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
    case explore = "Explore"
    case crunchAI = "CrunchAI"
    case profile = "Profile"
    case settings = "Settings"
    case home = "Home"
    
    // sheetViews not in navBar
    case bunchies = "Bunchies"
    case venue = "Venue"
    
    var symbol: String {
        switch self  {
        case .filter:
            "figure.2.arms.open"
        case .liveReviews:
            "macbook.and.iphone"
        case .explore:
            "globe.badge.chevron.backward"
        case .crunchAI:
            "circle.grid.2x2.fill"
        case .bunchies:
            "circle.grid.2x2.fill"
        case .profile:
            "person.fill"
        case .settings:
            "gearshape.circle"
        case .venue:
            "circle.grid.2x2.fill"
        case .home:
            "house.fill"
     
        }
    }
    
    // add cases to this once new features are complete
    static let mainCases: [NavBarTabsModel] = [.home, .liveReviews, .profile, .settings, .venue]
}
