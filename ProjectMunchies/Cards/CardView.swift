//
//  CardView.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 7/27/23.
//

import SwiftUI

struct CardView: View {
    @State
    private var translation: CGSize = .zero
    private var card: CardModel
    private var index: Int
    private var onRemove: (_ card: CardModel) -> Void
    private var threshold: CGFloat = 0.1
    
    enum LikeDislike: Int {
        case like, dislike, none
    }
    
    @State private var swipeStatus: LikeDislike = .none
    
    init(card: CardModel, index: Int, onRemove: @escaping (_ card: CardModel)
         -> Void) {
        self.card = card
        self.index = index
        self.onRemove = onRemove
    }
    
    
    
    
    
    var body: some View {
        GeometryReader{ geoReader in
            ZStack{
                Rectangle()
                    .foregroundColor(.gray)
                    .cornerRadius(40)
                    .frame(width: 350, height: 500)
                
                overlayss()
                
                VStack{
                    ZStack{
                        Image("Guy")
                            .resizable()
                            .frame(width: 380, height: 500)
                            .cornerRadius(30)
                        
                        ZStack{
                            Text("")
                                .frame(width: 350,height: 100)
                                .background(.white)
                                .cornerRadius(30)
                                .position(x:200 , y:560)
                            
                            
                            VStack{
                                ZStack{
                                    Text("")
                                        .frame(width: 120, height: 30)
                                        .background(.blue)
                                        .cornerRadius(25)
                                    
                                    
                                    Text("Italian food")
                                        .foregroundColor(.white)
                                    
                                }
                                .position(x:100 , y:180)
                                
                                
                                Text("Ashely, 23")
                                    .foregroundColor(.black)
                                    .bold()
                                    .font(.system(size: 20))
                                    .position(x:200 , y:280)
                                
                                
                                Text("Tampa,FL")
                                    .foregroundColor(.black)
                                    .font(.system(size: 20))
                                    .position(x:200 , y:70)
                            }
                            
                        }
                        
                        
                        buttons()
                           // .padding(.top,20)
                            .position(x:300, y:470)
                    }
                }
               // .position(x:196 , y:510)
            }
            .animation(.spring())
            .offset(x: translation.width, y: 0)
            .rotationEffect(.degrees(
                Double(self.translation.width /
                       geoReader.size.width)
                * 20), anchor: .bottom)
            .gesture(
            DragGesture()
                .onChanged{
                    //transaltion changes as you swipe card
                    translation = $0.translation
                    
                    //if card gets dragged a certain distance, set it to like/dislike
                    if $0.percentage(in: geoReader) >= threshold && translation.width < -110 {
                        self.swipeStatus = .dislike
                    } else if $0.percentage(in: geoReader) >= threshold && translation.width > 110 {
                        self.swipeStatus = .like
                    } else {
                        self.swipeStatus = .none
                    }
                    
                }.onEnded{_ in
                    if self.swipeStatus == .like {
                        onRemove(self.card)
                    } else if self.swipeStatus == .dislike {
                        onRemove(self.card)
                    }
                    //snap back to default position
                    translation = .zero
                }
            )
        }
        
    }
    
    private func buttons() -> some View {
        HStack(spacing: 10){
            ZStack{
                Text("")
                    .frame(width: 60, height: 50)
                    .background(Color.gray)
                    .cornerRadius(20)
                    .foregroundColor(.gray)
                
                Image(systemName: "xmark")
                    .font(.system(size: 35))
                    .foregroundColor(.blue)
            }
            
            ZStack{
                Text("")
                    .frame(width: 60, height: 50)
                    .background(.pink)
                    .cornerRadius(20)
                   // .foregroundColor(.gray)
                
                Image(systemName: "fork.knife")
                    .font(.system(size: 35))
                    .foregroundColor(.red)
            }
        }
    }
    
    private func overlayss() -> some View {
        ZStack{
            if self.translation.width < -10 {
                Text("NOPE")
                    .font(.title3)
                    .bold()
                    .padding()
                    .cornerRadius(10)
                    .foregroundColor(.red)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.red, lineWidth: 5.0)
                    )
                    .padding(.leading, 205)
                    .rotationEffect(Angle.degrees(45))
            }
            
            if self.translation.width > 10 {
                Text("YES")
                    .font(.title3)
                    .bold()
                    .padding()
                    .cornerRadius(10)
                    .foregroundColor(.red)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.red, lineWidth: 5.0)
                    )
                    .padding(.leading, 205)
                    .rotationEffect(Angle.degrees(45))
            }
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: MockService.cardSampleData, index: 18, onRemove: {_ in})
    }
}
