//
//  DetailView.swift
//  UICarousel
//
//  Created by DotZ3R0 on 9/2/23.
//

import SwiftUI

struct DetailView: View {
    var movie: Movie
    @Binding var showDetailVew: Bool
    @Binding var detailMovie: Movie?
    @Binding var currentCardSize: CGSize
    
    var animation: Namespace.ID
    @State var showDetailContent: Bool = false
    @State var offset: CGFloat = 0
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack{
                Image(movie.artwork)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: currentCardSize.width, height: currentCardSize.height * 0.67)
                    .cornerRadius(15)
                    .matchedGeometryEffect(id: movie.id, in: animation)
                
                VStack(spacing: 5){
                    Text("About \(movie.movieTitle)")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity,alignment: .center)
                        .padding(.top,25)
                        .padding(.bottom,5)
                    
                    HStack{
                        Spacer()
                        Text("Occupation:")
                        Text("\(movie.occupation)")
                        Spacer()
                    }
                    
                    HStack{
                        Spacer()
                        Text("Location:")
                        Text("\(movie.location)")
                        Spacer()
                    }
                    
                    HStack{
                        Spacer()
                        Text("Favorite Restaurant:")
                        Text("\(movie.favRestaurant)")
                        Spacer()
                    }
                    HStack{
                        Spacer()
                        Text("Favorite Food:")
                        Text("\(movie.favFood)")
                        Spacer()
                    }
                    
                    HStack{
                        Spacer()
                        Text("Hobbies:")
                        Text(movie.hobbies.joined(separator: ", "))
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
                    .padding(.top,20)
                }
                .opacity(showDetailContent ? 1 : 0)
                .offset(y: showDetailContent ? 0 : 200)
            }
            .padding()
            .modifier(OffsetModifier(offset: $offset))
        }
        .coordinateSpace(name: "SCROLL")
        .frame(maxWidth: .infinity, maxHeight: .infinity)
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
