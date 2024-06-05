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
    
    // tabs in profileIcon cant be display in NavBar
    // needs to be here to display on mainSheet
    case bunchies = "Bunchies"

  
    
    
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
            "gearshape.circle"
     
        }
    }
}
