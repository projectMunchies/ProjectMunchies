//
//  IndiviualCardsInGroup.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 10/11/23.
//

import SwiftUI

struct IndividualCardsInGroup: View {
    var profileId: String
    let size: CGSize
    @StateObject private var cardViewModel2 = CardViewModel()
    @State var showImage: Bool = false
    @State var individualCard: ProfileModel = ProfileModel(id: "", fullName: "", location: "", description: "", gender: "",age: "", fcmTokens: [], messageThreadIds: [], occupation: "" , favRestaurant: "", favFood: "", hobbies: [],eventIds: [], isMockData: false, bunchIds: [])
    
    var body: some View {
        VStack{
            Image(uiImage: cardViewModel2.profileImage2)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: size.height * 0.2, height: size.height * 0.2)
                .background(.gray)
                .cornerRadius(20)
                .padding(2)
        }
        .onAppear{
            getProf(profileId: profileId){(profileId) in
                if !profileId.isEmpty{
                    cardViewModel2.getStorageFile2(profileId: profileId)
                }
            }
        }
    }
    
    private func getProf(profileId: String, completed: @escaping (_ profileId: String) -> Void){
        db.collection("profiles")
            .whereField("id", isEqualTo: profileId)
            .limit(to: 10)
            .getDocuments() {(querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                    completed("")
                }else {
                    for document in querySnapshot!.documents {
                        let data = document.data()
                        if !data.isEmpty{
                            let profile = ProfileModel(id: data["id"] as? String ?? "", fullName: data["fullName"] as? String ?? "", location: data["location"] as? String ?? "", description: data["description"] as? String ?? "", gender: data["gender"] as? String ?? "", age: data["age"] as? String ?? "", fcmTokens: data["fcmTokens"] as? [String] ?? [], messageThreadIds: data["messageThreadIds"] as? [String] ?? [],occupation: data["occupation"] as? String ?? "", favRestaurant: data["favRestaurant"] as? String ?? "" , favFood: data["favFood"] as? String ?? "", hobbies: data["hobbies"] as? [String] ?? [], eventIds: data["eventIds"] as? [String] ?? [], isMockData: data["isMockData"] as? Bool ?? false, bunchIds: data["bunchIds"] as? [String] ?? [])
                            self.individualCard = profile
                        }
                    }
                    completed(self.individualCard.id)
                }
            }
    }
}

struct IndividualCardsInGroup_Previews: PreviewProvider {
    static var previews: some View {
        IndividualCardsInGroup(profileId: "", size: .zero)
    }
}
