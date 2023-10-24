//
//  DetailView.swift
//  UICarousel
//
//  Created by DotZ3R0 on 9/2/23.
//

import SwiftUI

struct DetailView: View {
    var profile: ProfileModel
    @Binding var showDetailVew: Bool
    @Binding var currentCardSize: CGSize
    @Binding var detailImages: [UIImage]
    
    var animation: Namespace.ID
    @State var showDetailContent: Bool = false
    @State var offset: CGFloat = 0
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack{
                HStack(spacing:0){
                        ForEach(detailImages, id: \.self){ detailImage in
                            Image(uiImage: detailImage)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: currentCardSize.width * 0.2, height: currentCardSize.height * 0.6)
                                .cornerRadius(30)
                                .padding(.trailing)
                        }
                }
                    .position(x:currentCardSize.width * 0.05, y:currentCardSize.height * 0.3)
                
                VStack(spacing: 5){
                    Text("About \(profile.fullName)")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity,alignment: .center)
                        .padding(.top,25)
                        .padding(.bottom,5)
                    
                    HStack{
                        Spacer()
                        Text("Occupation:")
                        Text("\(profile.occupation)")
                        Spacer()
                    }
                    
                    HStack{
                        Spacer()
                        Text("Location:")
                        Text("\(profile.location)")
                        Spacer()
                    }
                    
                    HStack{
                        Spacer()
                        Text("Favorite Restaurant:")
                        Text("\(profile.favRestaurant)")
                        Spacer()
                    }
                    HStack{
                        Spacer()
                        Text("Favorite Food:")
                        Text("\(profile.favFood)")
                        Spacer()
                    }
                    
                    HStack{
                        Spacer()
                        Text("Hobbies:")
                        Text(profile.hobbies.joined(separator: ", "))
                        Spacer()
                    }
                    
                    Text(sampleText)
                        .multilineTextAlignment(.leading)
                    
                    Button{
                        
                    }label: {
                        Text("Send Invite")
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .padding(.vertical)
                            .frame(maxWidth: .infinity)
                            .background{
                                RoundedRectangle(cornerRadius: 10, style: .continuous)
                                    .fill(.gray)
                            }
                    }
//                    .padding(.top,20)
//                    .padding(.trailing,80)
                }
                .opacity(showDetailContent ? 1 : 0)
                .offset(y: showDetailContent ? 0 : 200)
            }
            .modifier(OffsetModifier(offset: $offset))
        }
       // .coordinateSpace(name: "SCROLL")
        //.frame(maxWidth: .infinity, maxHeight: .infinity)
        .background{
            Rectangle()
                .fill(.ultraThinMaterial)
                .ignoresSafeArea()
        }
        .onAppear {
            withAnimation(.easeInOut){
                showDetailContent = true
            }
        }
        .onChange(of: offset) { newValue in
            // your own custom threshold for going back
            if newValue > 120{
                withAnimation(.easeInOut){
                    showDetailContent = false
                }

                DispatchQueue.main.asyncAfter(deadline: .now() + 0.05){
                    withAnimation(.easeInOut){
                        showDetailVew = false
                    }
                }
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewCarousel()
    }
}
