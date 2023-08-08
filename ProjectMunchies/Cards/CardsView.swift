//
//  CardsView.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 7/27/23.
//

import SwiftUI

struct CardsView: View {
    @StateObject public var viewModel = CardViewModel()
    @State
    private var cards: [ProfileModel] = MockService.profilesSampleData
    
    let geoReader: GeometryProxy
    
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
                                    .animation(.spring())
                                    .offset(x: 0, y: self.cards.cardOffset(cardId: index))
                                }

                        }
                    }
                    .onAppear{
                        viewModel.getStorageFiles(cardImages: MockService.profilesSampleData)
                    }
                  
               }
    }
}

struct CardsView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader{ proxy in
            CardsView(geoReader: proxy)
        }
   
    }
}
