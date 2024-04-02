//
//  Group.swift
//  ProjectMunchies
//
//  Created by Marcus Mckoy on 2/21/24.
//

import Foundation
import Contacts

struct Group: Identifiable {
    var id = UUID()
    var name: String
    var emoji: String
    var members: [CNContact]
    
    init(name: String, emoji: String, members: [CNContact]) {
        self.name = name
        self.emoji = emoji
        self.members = members
    }
}
