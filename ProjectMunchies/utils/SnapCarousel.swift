//
//  SnapCarousel.swift
//  SnapWheelCarousel
//
//  Created by DotZ3R0 on 9/2/23.
//

import SwiftUI

struct SnapCarousel<Content: View,T: Identifiable>: View {
    var content: (T) -> Content
    var list: [T]
    
    //Properties...
    var spacing: CGFloat
    var trailingSpace: CGFloat
    @Binding var swipeIndex: Int
    init(spacing: CGFloat = 15, trailingSpace: CGFloat = 100, swipeIndex: Binding<Int>, items: [T], @ViewBuilder content: @escaping (T)->Content){
        self.list = items
        self.spacing = spacing
        self.trailingSpace = trailingSpace
        self._swipeIndex = swipeIndex
        self.content = content
    }
    
    //Offset...
    @GestureState var offset: CGFloat = 0
    @State var currentIndex: Int = 0
    @State var imageIndex: Int = 0
    
    var body: some View{
        GeometryReader{proxy in
            //Setting the current Width for snap Carousel...
            // One Sided snap Carousel...
            
            let width = proxy.size.width - (trailingSpace - spacing)
            let adjustmentWidth = (trailingSpace / 2) - spacing
            
            HStack(spacing: spacing){
                ForEach(list){item in
                    content(item)
                        .frame(width: proxy.size.width - trailingSpace)
                        .offset(y: getOffset(item: item, width: width))
                }
            }
            //Spacing will be horizontal padding...
            .padding(.horizontal,spacing)
            .offset(x: (CGFloat(currentIndex) * -width) + (currentIndex != 0 ? adjustmentWidth : 0) + offset)
            .gesture(
            DragGesture()
                .updating($offset, body: { value, out, _ in
                    // Making it a little bit slower
                    out = (value.translation.width / 1.5)
                })
                .onEnded({ value in
                    // Updating Current Index...
                    let offsetX = value.translation.width
                    
                    //were going to convert the translation into progress (0 -1)
                    // and round the value...
                    // based on the progress increasing or decresing the currentIndex...
                    
                    let progress = -offsetX / width
                    let roundIndex = progress.rounded()
                    
                    // setting min...
                    currentIndex = max(min(currentIndex + Int(roundIndex), list.count - 1), 0)
                    //updating index...
                    currentIndex = swipeIndex
                })
                .onChanged({ value in
                    // updating only index...
                    
                    // Updating Current Index...
                    let offsetX = value.translation.width
                    
                    //were going to convert the translation into progress (0 -1)
                    // and round the value...
                    // based on the progress increasing or decresing the currentIndex...
                    
                    let progress = -offsetX / width
                    let roundIndex = progress.rounded()
                    
                    // setting min...
                    swipeIndex = max(min(currentIndex + Int(roundIndex), list.count - 1), 0)
                })
            )
        }
        //Animating when offset =  0
        .animation(.easeInOut, value: offset == 0)
    }
    
    //Moving View based on scroll Offset...
    func getOffset(item: T,width: CGFloat)->CGFloat{
        //Progress...
        // Shifting Current Item to Top.
        let progress = ((offset < 0 ? offset : -offset) / width) * 60
        let topOffset = -progress < 60 ? progress : -(progress + 120)
        let previous = getIndex(item: item) - 1 == currentIndex ? (offset < 0 ? topOffset : -topOffset) : 0
        let next = getIndex(item: item) + 1 == currentIndex ? (offset < 0 ? -topOffset : topOffset) : 0
        //safety check between 0 to max list size....
        let checkBetween = currentIndex >= 0 && currentIndex < list.count ? (getIndex(item: item) - 1 == currentIndex ? previous : next) : 0
        
        //checking current...
        // if so shifting view to top...

        return getIndex(item: item) ==  currentIndex ? -60 - topOffset : checkBetween
    }
    
    // Fetching Index...
    func getIndex(item: T)->Int{
        let index = list.firstIndex{ currentItem in
            return currentItem.id == item.id
        } ?? 0
        return index
    }
}

struct Home_PreviewsCarousel: PreviewProvider {
    static var previews: some View {
        HomeViewCarousel()
    }
}
