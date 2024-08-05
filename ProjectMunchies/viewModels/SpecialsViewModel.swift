//
//  SpecialsViewModel.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 1/29/24.
//

import Foundation

class SpecialsViewModel: ObservableObject {
    private let service = SpecialsService()
    
    @Published var special: SpecialModel = emptySpecialModel
    @Published var specials: [SpecialModel] = []
    @Published var recentSpecials : [SpecialModel] = []
    
    public func GetSpecial(specialId: String) async throws {
        let special = try await service.GetSpecial(specialId: specialId)
        self.special = special
    }
    
    public func GetSpecials(specialIds: [String]) async throws {
        let specials = try await service.GetSpecials(specialIds: specialIds)
        self.specials = specials
    }
    
    public func GetRecentSpecials() async throws {
        let recentSpecials = try await service.GetRecentSpecials()
        self.recentSpecials = recentSpecials
    }
}
