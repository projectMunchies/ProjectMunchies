//
//  GroupModel.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 10/12/23.
//

import Foundation

struct GroupModel: Identifiable, Hashable{
    var id: String
    var profileIds: [String]
    var groupProfile: ProfileModel
}

