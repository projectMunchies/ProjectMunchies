//
//  SpecialsService.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 6/1/24.
//

import Foundation

class SpecialsService: ObservableObject {
    private let specialsRepository = SpecialsRepository()
    
    public func GetSpecial(specialId: String) async throws -> SpecialModel {
        let special = try await specialsRepository.Get(specialId: specialId)
        return special
    }
    
    public func GetSpecials(specialIds: [String]) async throws -> [SpecialModel] {
        let specials = try await specialsRepository.Get(specialIds: specialIds)
        return specials
    }
    
    public func GetAfterDate(date: Date) async throws -> [SpecialModel] {
        let specials = try await specialsRepository.GetAfter(date: date)
        return specials
    }
    
}
