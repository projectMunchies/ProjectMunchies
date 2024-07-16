//
//  UserDetailModel.swift
//  ProjectMunchies
//
//  Created by Marcus Mckoy on 7/15/24.
//

import Foundation
import SwiftUI

enum UserDetailModel: String, CaseIterable {
    case bunchies = "Bunchies"
    case chat = "Chat"
    
    var systemImage: String {
        switch self {
        case .bunchies:
            return "person.text.rectangle"
        case .chat:
            return "bell.and.waveform"
        }
    }
}

