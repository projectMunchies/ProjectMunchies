//
//  SpecialsService.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 6/1/24.
//

import Foundation

class SpecialsService {
    private let specialsRepository = SpecialsRepository()
    
    public func GetSpecial(specialId: String) async throws -> SpecialModel {
        let special = try await specialsRepository.Get(specialId: specialId)
        return special
    }
    
    public func GetSpecials(specialIds: [String]) async throws -> [SpecialModel] {
        let specials = try await specialsRepository.Get(specialIds: specialIds)
        return specials
    }
    
    public func GetRecentSpecials() async throws -> [SpecialModel] {
        let specials = try await specialsRepository.GetRecent()
        return specials
    }
    
}
