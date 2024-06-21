//
//  BunchiesTabModel.swift
//  ProjectMunchies
//
//  Created by Marcus Mckoy on 6/21/24.
//

import Foundation
import SwiftUI

///Tab's
enum BunchiesTabModel: String, CaseIterable {
    case activity = "activity"
    case bunchies = "Bunchies"
    case chats = "Chats"

    
    var systemImage: String {
        switch self {
        case .activity:
                 return "bell.and.waveform"
        case .bunchies:
            return "person.text.rectangle"
        case .chats:
            return "bubble.left.and.bubble.right"
        }
    }
}
