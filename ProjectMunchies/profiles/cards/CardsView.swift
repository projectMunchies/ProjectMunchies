//
//  CardsView.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 7/27/23.
//

import SwiftUI
import FirebaseAuth

struct CardsView: View {
    @StateObject public var viewModel = CardViewModel()
    @State private var cards: [ProfileModel] = []
    @State private var isCardsFilter: Bool = false
    @State private var isLoadCards: Bool = false
    
    let geoReader: GeometryProxy
    let foodFilter: FoodFilterModel
    let filteredCards: [ProfileModel]
    let userProfileId: String
    
    var body: some View {
        ZStack{
            Color.white
                .ignoresSafeArea()
            
            ZStack{
                ForEach(Array(self.cards.enumerated()), id: \.offset){ index, card in
                    if index > self.cards.count - 4 {
                        NavigationLink(destination: ProfileView(card: card)) {
                            CardView(geoReader: geoReader, card: card, index: index, onRemove: { removedUser in
                                self.cards.removeAll {$0.id == removedUser.id}
                            })
                        }
                        .buttonStyle(MyButtonStyle())
                        .animation(.spring())
                        .offset(x: 0, y: self.cards.cardOffset(cardId: index))
                    }
                }
            }
            .onAppear{
                if !isLoadCards && filteredCards.isEmpty {
                    getProfiles(filterProfileIds: []){(profiles) in
                        if !profiles.isEmpty {
                            filterCards()
                            isLoadCards.toggle()
                        }
                    }
                }else if !filteredCards.isEmpty {
                    self.cards = filteredCards.shuffled()
                    filterCards()
                }else {
                    filterCards()
                }
            }
        }
    }
    
    private func filterCards() {
        // 18 <= age <= 70
        let ageFilteredCards: [ProfileModel] = self.cards.filter{Int($0.age) ?? 0 >= Int(foodFilter.ageRangeFrom) ?? 0 &&  Int($0.age) ?? 0 <= Int(foodFilter.ageRangeTo) ?? 0}
        
        if foodFilter.gender.lowercased() == "male" {
            self.cards = ageFilteredCards.filter({$0.gender.lowercased() == "male"})
        }
        else if foodFilter.gender.lowercased() == "female" {
            self.cards = ageFilteredCards.filter({$0.gender.lowercased() == "female"})
        }
        else if foodFilter.gender.lowercased() == "pick" {
            self.cards = ageFilteredCards
        }
    }
    
    public func getProfiles(filterProfileIds: [String], completed: @escaping (_ profiles: [ProfileModel]) -> Void) {
        if filterProfileIds.isEmpty {
            db.collection("profiles")
                .whereField("id", isNotEqualTo: userProfileId)
                .limit(to: 3)
                .getDocuments() {(querySnapshot, err) in
                    if let err = err {
                        print("Error getting documents: \(err)")
                        completed([])
                    }else {
                        for document in querySnapshot!.documents {
                            let data = document.data()
                            if !data.isEmpty{
                                let profile = ProfileModel(id: data["id"] as? String ?? "", fullName: data["fullName"] as? String ?? "", location: data["location"] as? String ?? "", description: data["description"] as? String ?? "", gender: data["gender"] as? String ?? "", age: data["age"] as? String ?? "", fcmTokens: data["fcmTokens"] as? [String] ?? [], messageThreadIds: data["messageThreadIds"] as? [String] ?? [],occupation: data["occupation"] as? String ?? "", favRestaurant: data["favRestaurant"] as? String ?? "" , favFood: data["favFood"] as? String ?? "", hobbies: data["hobbies"] as? [String] ?? [], eventIds: data["eventIds"] as? [String] ?? [], isMockData: data["isMockData"] as? Bool ?? false, bunchIds: data["bunchIds"] as? [String] ?? [])
                                self.cards.append(profile)
                            }
                        }
                        // very stupid but I have to do this. There is no shuffle()
                        var shuffled = self.cards.shuffled()
                        self.cards = shuffled
                        completed(self.cards)
                    }
                }
        }else {
            var profiles: [ProfileModel] = []
            var profileIds: [String] = []
            var batches: [Any] = []
            profileIds = filterProfileIds
            
            while(!profileIds.isEmpty){
                let batch = Array(profileIds.prefix(10))
                let count = profileIds.count
                if count < 10{
                    profileIds.removeSubrange(ClosedRange(uncheckedBounds: (lower: 0, upper: count - 1)))
                }else {
                    profileIds.removeSubrange(ClosedRange(uncheckedBounds: (lower: 0, upper: 9)))
                }
                
                batches.append(
                    db.collection("profiles")
                        .whereField("id", in: batch)
                        .limit(to: 20)
                        .getDocuments() {(querySnapshot, err) in
                            if let err = err {
                                print("Error getting documents: \(err)")
                                completed([])
                            }else {
                                for document in querySnapshot!.documents {
                                    let data = document.data()
                                    if !data.isEmpty{
                                        let profile = ProfileModel(id: data["id"] as? String ?? "", fullName: data["fullName"] as? String ?? "", location: data["location"] as? String ?? "", description: data["description"] as? String ?? "", gender: data["gender"] as? String ?? "", age: data["age"] as? String ?? "", fcmTokens: data["fcmTokens"] as? [String] ?? [], messageThreadIds: data["messageThreadIds"] as? [String] ?? [],occupation: data["occupation"] as? String ?? "", favRestaurant: data["favRestaurant"] as? String ?? "" , favFood: data["favFood"] as? String ?? "", hobbies: data["hobbies"] as? [String] ?? [], eventIds: data["eventIds"] as? [String] ?? [], isMockData: data["isMockData"] as? Bool ?? false, bunchIds: data["bunchIds"] as? [String] ?? [])
                                        profiles.append(profile)
                                    }
                                }
                                completed(profiles)
                            }
                            
                        }
                )
            }
        }
    }
    
    struct MyButtonStyle: ButtonStyle {
        public func makeBody(configuration: MyButtonStyle.Configuration) -> some View {
            configuration.label
                .opacity(1)
            
            // You can also add other animated properties
                .scaleEffect(configuration.isPressed ? 0.97 : 1)
        }
    }
    
    struct CardsView_Previews: PreviewProvider {
        static var previews: some View {
            GeometryReader{ proxy in
                CardsView(geoReader: proxy, foodFilter: MockDataService.foodFilterSampleData, filteredCards: mockProfiles, userProfileId: "")
            }
            
        }
    }
}
