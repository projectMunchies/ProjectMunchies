//
//  TabModel.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 2/11/24.
//

import SwiftUI

enum TabModel: String, CaseIterable {
    case recent = "Recent"
    case top = "Top"
    case popular = "Popular"
    
    var systemImage: String {
        switch self {
        case .recent:
            return "message.badge"
        case .top:
            return "arrow.up.message"
        case .popular:
            return "bubble.left.and.bubble.right"
        }
    }
}
