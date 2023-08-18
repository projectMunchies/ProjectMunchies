//
//  CardView.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 7/27/23.
//

import SwiftUI

struct CardView: View {
    @StateObject private var cardViewModel = CardViewModel()
    @State
    private var translation: CGSize = .zero
    private var geoReader: GeometryProxy
    private var card: ProfileModel
    private var index: Int
    private var onRemove: (_ card: ProfileModel) -> Void
    private var threshold: CGFloat = 0.1
    
    enum LikeDislike: Int {
        case like, dislike, none
    }
    
    @State private var swipeStatus: LikeDislike = .none
    
    init(geoReader: GeometryProxy, card: ProfileModel, index: Int, onRemove: @escaping (_ card: ProfileModel)
         -> Void) {
        self.geoReader = geoReader
        self.card = card
        self.index = index
        self.onRemove = onRemove
    }
    
    var body: some View {
        GeometryReader{ geoReader in
            ZStack{
                ZStack{
                    Image(uiImage: cardViewModel.profileImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 380, height: geoReader.size.height * 0.75)
                        .cornerRadius(30)
                    ZStack{
                        //gradient
                        Text("")
                            .frame(width: 380,height: 220)
                            .background(
                                LinearGradient(gradient: Gradient(colors: [.clear,.black,.black]), startPoint: .top, endPoint: .bottom)
                            )
                            .opacity(0.7)
                            .cornerRadius(30)
                            .position(x:geoReader.size.width * 0.5,  y:geoReader.size.height * 0.73)
                        
                        
                        ZStack{
                            
                            Text("\(card.fullName)")
                                .foregroundColor(.white)
                                .bold()
                                .font(.system(size: 20))
                                .position(x:geoReader.size.width * 0.2, y:geoReader.size.height * 0.66)
                                .padding(.leading)
                            
                            
                            Text("\(card.location)")
                                .foregroundColor(.white)
                                .font(.system(size: 15))
                                .position(x:geoReader.size.width * 0.2, y:geoReader.size.height * 0.7)
                            
                            
                            buttons()
                            //.padding(.bottom,800)
                                .position(x:geoReader.size.width * 0.5, y:geoReader.size.height * 0.82)
                        }
                    }
                }
                overlayss()
            }
            .onAppear{
                cardViewModel.getStorageFile(profileId: card.id)
            }
            .position(x: geoReader.frame(in: .local).midX , y: geoReader.frame(in: .local).midY )
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
    
    private func buttons() -> some View {
        HStack(spacing: 20){
            Button(action: {
                self.translation.width = -350
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    self.swipeStatus = .dislike
                    onRemove(self.card)
                }
            }) {
                ZStack{
                    Text("")
                        .frame(width: 160, height: 60)
                        .background(Color.white)
                        .cornerRadius(40)
                        .foregroundColor(.gray)
                    
                    Image(systemName: "xmark")
                        .font(.system(size: 25))
                        .foregroundColor(.black)
                }
            }
            
            Button(action: {
                self.translation.width = 350
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    self.swipeStatus = .like
                    onRemove(self.card)
                }
                
            }) {
                ZStack{
                    Text("")
                        .frame(width: 160, height: 60)
                        .background(Color("MainColor"))
                        .cornerRadius(40)
                    // .foregroundColor(.gray)
                    
                    Image(systemName: "fork.knife")
                        .font(.system(size: 25))
                        .foregroundColor(.white)
                }
            }
            
            //            ZStack{
            //                Text("")
            //                    .frame(width: 80, height: 60)
            //                    .background(.pink)
            //                    .cornerRadius(40)
            //                   // .foregroundColor(.gray)
            //
            //                Image(systemName: "arrow.counterclockwise")
            //                    .font(.system(size: 30))
            //                    .foregroundColor(.white)
            //            }
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { proxy in
            CardView(geoReader: proxy, card: MockService.profilesSampleData[0], index: 18, onRemove: {_ in})
        }
        
    }
}
