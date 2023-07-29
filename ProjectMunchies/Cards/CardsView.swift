//
//  CardsView.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 7/27/23.
//

import SwiftUI

struct CardsView: View {
    @State
    private var cards: [CardModel] = MockService.cardsSampleData
    
    var body: some View {
        GeometryReader{ geoReader in
            VStack{
                ZStack{
                    ForEach(Array(self.cards.enumerated()), id: \.offset){ index, card in
                        if index > self.cards.count - 4 {
                            CardView(geoReader: geoReader, card: card, index: index, onRemove: { removedUser in
                                self.cards.removeAll {$0.id == removedUser.id}

                            })
                            .animation(.spring())
                           // .frame(width: self.cards.cardWidth(in: geoReader, cardId: index), height: geoReader.size.height * 1.1)
                            .offset(x: 0, y: self.cards.cardOffset(cardId: index))
                        }
                    }
                }
            }
      
        }
      
    }
}

struct CardsView_Previews: PreviewProvider {
    static var previews: some View {
        CardsView()
    }
}
