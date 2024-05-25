//
//  ViewSelection.swift
//  ProjectMunchies
//
//  Created by Marcus Mckoy on 5/23/24.
//

import Foundation

enum ViewSelection: Identifiable {
    case myBunchies
    case myReviews
    case settings
    case none
    
    var id: Int {
        hashValue
    }
}
