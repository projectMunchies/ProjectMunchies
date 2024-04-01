//
//  TabModel.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 2/11/24.
//

import SwiftUI

enum TabModel: String, CaseIterable {
    case recent = "Recent"

    case popular = "Popular"
    case new = "New"
    
    var systemImage: String {
        switch self {
        case .recent:
            return "message.badge"
       
        case .popular:
            return "bubble.left.and.bubble.right"
        case .new:
            return "plus.circle.fill"
        
        }
    }
}
