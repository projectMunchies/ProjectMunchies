import Foundation
import SwiftUI

struct Hobby: Identifiable, Codable, Hashable {
    let id = UUID()
    let name: String
    let imageName: String
    var isSelected: Bool = false
}

struct Occupation: Identifiable, Codable, Hashable {
    let id = UUID()
    let name: String
    let imageName: String
    var isSelected: Bool = false
}

struct Cuisine: Identifiable, Codable, Hashable {
    let id = UUID()
    let name: String
    let imageName: String
    var isSelected: Bool = false
}

struct Location: Identifiable, Codable, Hashable {
    let id = UUID()
    let name: String
    let type: LocationType
}

enum LocationType: String, Codable {
    case state
    case country
}

class PersonalInfoModel: ObservableObject {
    @Published var hobbies: [Hobby] = [
        Hobby(name: "Football", imageName: "sportscourt.fill"),
        Hobby(name: "Basketball", imageName: "basketball.fill"),
        Hobby(name: "Tennis", imageName: "tennisball.fill"),
        Hobby(name: "Swimming", imageName: "figure.pool.swim"),
        Hobby(name: "Cycling", imageName: "bicycle"),
        Hobby(name: "Reading", imageName: "book.fill"),
        Hobby(name: "Cooking", imageName: "fork.knife"),
        Hobby(name: "Gaming", imageName: "gamecontroller.fill"),
        Hobby(name: "Music", imageName: "music.note"),
        Hobby(name: "Photography", imageName: "camera.fill"),
        Hobby(name: "Painting", imageName: "paintbrush.fill"),
        Hobby(name: "Hiking", imageName: "figure.hiking"),
        Hobby(name: "Yoga", imageName: "figure.mind.and.body"),
        Hobby(name: "Traveling", imageName: "airplane")
    ]
    
    @Published var occupations: [Occupation] = [
        Occupation(name: "Software Developer", imageName: "desktopcomputer"),
        Occupation(name: "Teacher", imageName: "book"),
        Occupation(name: "Doctor", imageName: "stethoscope"),
        Occupation(name: "Nurse", imageName: "cross.case"),
        Occupation(name: "Engineer", imageName: "wrench.and.screwdriver"),
        Occupation(name: "Accountant", imageName: "calculator"),
        Occupation(name: "Lawyer", imageName: "text.book.closed"),
        Occupation(name: "Artist", imageName: "paintpalette"),
        Occupation(name: "Sales Representative", imageName: "cart"),
        Occupation(name: "Marketing Specialist", imageName: "megaphone"),
        Occupation(name: "Chef", imageName: "takeoutbag.and.cup.and.straw"),
        Occupation(name: "Architect", imageName: "building.2"),
        Occupation(name: "Journalist", imageName: "newspaper"),
        Occupation(name: "Entrepreneur", imageName: "briefcase"),
        Occupation(name: "Scientist", imageName: "flask"),
        Occupation(name: "Police Officer", imageName: "shield"),
        Occupation(name: "Firefighter", imageName: "flame"),
        Occupation(name: "Pilot", imageName: "airplane.circle"),
        Occupation(name: "Electrician", imageName: "bolt"),
        Occupation(name: "Plumber", imageName: "drop")
    ]
    @Published var cuisines: [Cuisine] = [
            Cuisine(name: "Italian", imageName: "fork.knife"),
            Cuisine(name: "Chinese", imageName: "takeoutbag.and.cup.and.straw"),
            Cuisine(name: "Mexican", imageName: "flame"),
            Cuisine(name: "Japanese", imageName: "fish"),
            Cuisine(name: "Indian", imageName: "leaf"),
            Cuisine(name: "French", imageName: "wineglass"),
            Cuisine(name: "Thai", imageName: "leaf.arrow.circlepath"),
            Cuisine(name: "Greek", imageName: "sun.min"),
            Cuisine(name: "Spanish", imageName: "sun.max"),
            Cuisine(name: "American", imageName: "flag"),
            Cuisine(name: "Middle Eastern", imageName: "moon.stars"),
            Cuisine(name: "Korean", imageName: "sparkles"),
            Cuisine(name: "Vietnamese", imageName: "leaf.arrow.triangle.circlepath"),
            Cuisine(name: "Mediterranean", imageName: "drop"),
            Cuisine(name: "Brazilian", imageName: "flame.fill")
        ]
    @Published var locations: [Location] = [
            // US States
            Location(name: "Alabama", type: .state),
            Location(name: "Alaska", type: .state),
            Location(name: "Arizona", type: .state),
            // ... (add all US states)
            
            // Countries
            Location(name: "Afghanistan", type: .country),
            Location(name: "Albania", type: .country),
            Location(name: "Algeria", type: .country),
            // ... (add all countries)
        ]
    
    
    @Published var username: String = ""
    @Published var age: String = ""
    @Published var location: String = ""
    @Published var favoriteCuisines: String = ""
    @Published var selectedLocation: Location?
    
    func selectHobby(_ hobby: Hobby) {
            if let index = hobbies.firstIndex(where: { $0.id == hobby.id }) {
                hobbies[index].isSelected.toggle()
            }
        }
        
        func selectOccupation(_ occupation: Occupation) {
            occupations.indices.forEach { occupations[$0].isSelected = false }
            if let index = occupations.firstIndex(where: { $0.id == occupation.id }) {
                occupations[index].isSelected = true
            }
        }
        
        func selectCuisine(_ cuisine: Cuisine) {
            if let index = cuisines.firstIndex(where: { $0.id == cuisine.id }) {
                cuisines[index].isSelected.toggle()
            }
        }
        
        func getSelectedHobbies() -> [Hobby] {
            return hobbies.filter { $0.isSelected }
        }
        
        func getSelectedOccupation() -> Occupation? {
            return occupations.first { $0.isSelected }
        }
        
        func getSelectedCuisines() -> [Cuisine] {
            return cuisines.filter { $0.isSelected }
        }
    }
    
