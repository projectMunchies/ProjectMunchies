//
//  Modal.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 1/7/24.
//

import SwiftUI

struct Modal: View {
    @Binding var showModal: Bool
    @State private var cards: [Card] = [
        .init(image: "greenLemon", title: "Breakfast"),
        .init(image: "greenLemon", title: "Lunch"),
        .init(image: "greenLemon", title: "Dinner")
    ]
    
    let timer = Timer.publish(every: 2, on: .main, in: .common).autoconnect()
    @State private var counter = 0
    @State private var words: [String] = ["predicting...","users preferences...","bullshit...","one more.."]
    @State private var emptyWords: [String] = []
    @State private var displayModal: Bool = false
    
    var body: some View {
        VStack {
            GeometryReader {
                let size = $0.size
                
                if !displayModal {
                    VStack{
                        ForEach(emptyWords, id: \.self) { emwords in
                                Text("\(emwords)")
                                .font(.title2)
                        }
                            ProgressView()
                    }
                    .position(x: $0.frame(in: .local).midX, y: $0.size.height * 0.5)
                    
                } else {
                    ScrollView(.horizontal) {
                        HStack(spacing: 10) {
                            ForEach(cards) { card in
                                CardView(card)
                            }
                        }
                        .padding(.trailing, size.width - 180)
                        .scrollTargetLayout()
                    }
                    .scrollTargetBehavior(.viewAligned)
                    .scrollIndicators(.hidden)
                    .clipShape(.rect(cornerRadius: 25))
                }
            }
            .padding(.horizontal, 15)
            .padding(.top, 30)
            .frame(height: 210)
            .onReceive(timer) { time in
                if counter == 5 {
                   // timer.upstream.connect().cancel()
                    withAnimation{
                        displayModal.toggle()
                    }
                }else  {
                    if !words.isEmpty {
                        self.emptyWords.append(words.first ?? "")
                        self.words.removeFirst()
                    }
                }
                counter += 1
            }
            
            Spacer(minLength: 0)
        }
    }
    
    
    /// CardView
   @ViewBuilder
    func CardView(_ card: Card) -> some View {
        GeometryReader { proxy in
            let size = proxy.size
            let minX = proxy.frame(in: .scrollView).minX
            /// 190: 180 - Card Width; 10 - Spacing
            let reducingWidth = (minX / 190) * 130
            let cappedWidth = min(reducingWidth, 130)
            
            let frameWidth = size.width - (minX > 0 ? cappedWidth : -cappedWidth)
            
            ZStack{
                Image(card.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: size.width, height: size.height)
                    .frame(width: frameWidth)
                    .clipShape(.rect(cornerRadius: 25))
                    .offset(x: minX > 0 ?  0 : -cappedWidth)
                    .offset(x: -card.previousOffset)
                
                VStack{
                    Text(card.title)
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)

                    Spacer()
                        .frame(height: 120)
                    Button(action: {
                        withAnimation {
                            self.showModal.toggle()
                       }
                       
                    }){
                        ZStack{
                            Text("")
                                .frame(width: 200, height: 70)
                                .background(.gray)
                                .cornerRadius(30)
                            
                            Text("Green Lemon")
                                .font(.title)
                                .foregroundColor(.white)
                        }
                        .frame(width: frameWidth)
                        .clipShape(.rect(cornerRadius: 25))
                        // dont think we need these 2 offsets
                        .offset(x: minX > 0 ?  0 : -cappedWidth)
                        .offset(x: -card.previousOffset)
                      
                    }
                }
              
            }
        }
        .frame(width: 310, height: 350)
        .offsetX { offset in
            let reducingWidth = (offset / 190) * 100
            let index = cards.indexOf(card)
            
            if cards.indices.contains(index + 1) {
                cards[index + 1].previousOffset = (offset < 0 ? 0 : reducingWidth)
            }
        }
    }
    
}


#Preview {
    Modal(showModal: .constant(true))
}
