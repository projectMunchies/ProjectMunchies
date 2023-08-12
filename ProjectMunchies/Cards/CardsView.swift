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
                                .buttonStyle(MyButtonStyle())
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

struct MyButtonStyle: ButtonStyle {
 public func makeBody(configuration: MyButtonStyle.Configuration) -> some View {
     configuration.label
         .opacity(configuration.isPressed ? 1 : 1)

         // You can also add other animated properties
         .scaleEffect(configuration.isPressed ? 0.97 : 1)
 }
}

struct CardsView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader{ proxy in
            CardsView(geoReader: proxy)
        }
   
    }
}
