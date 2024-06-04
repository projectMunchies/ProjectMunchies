//
//  Test.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 5/28/24.
//

import SwiftUI

struct AutoScrollView: View {
    var color: Color
    var items: [ReviewModel]
    
    @State private var data = [ReviewModel]()
    @State private var selectedMenuItem: Int = 0
    @State private var isExpanded: Bool = false
    @State private var indentLow: Int = 90
    @State private var indentHigh: Int = 90
    @State private var selectedIndex: Int = -1
    
    let timer = Timer.publish(every: 2, on: .main, in: .common).autoconnect()
    
    var body: some View {
        GeometryReader { proxy in
            VStack {
                ScrollView(.vertical, showsIndicators: false) {
                    ScrollViewReader{ sr in
                        VStack {
                            ForEach(self.data.indices, id:\.self) { index in
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(color.gradient)
                                    .frame(height: self.isExpanded && self.selectedIndex == index ? 150 : 50)
                                    .overlay {
                                        OverlayView(proxy: proxy, index: index, data: self.data, isExpanded: self.isExpanded, selectedMenuItem: self.$selectedMenuItem,selectedIndex: self.$selectedIndex)
                                    }
                                    .onTapGesture {
                                        if self.isExpanded && selectedIndex == index {
                                            withAnimation(.easeInOut(duration: 0.3)) {
                                                setSheetBoundary(lowestPoint: 300, highestPoint: 300)
                                                self.selectedIndex = -1
                                                self.isExpanded.toggle()
                                            }
                                        } else {
                                            withAnimation(.easeInOut(duration: 0.3)) {
                                                setSheetBoundary(lowestPoint: 800, highestPoint: 800)
                                                self.selectedIndex = index
                                                self.isExpanded.toggle()
                                            }
                                        }
                                    }
                            }
                        }
                        .onChange(of: self.data.count) { _ in
                            withAnimation {
                                sr.scrollTo(self.data.count - 1)
                            }
                        }
                    }
                }
            }
            .onReceive(timer) { time in
                data.append(
                    ReviewModel(
                        id: UUID().uuidString,
                        rating: 2,
                        body: "",
                        title: "This is the Title",
                        userId: "",
                        venueId: "",
                        timeStamp: Date.today(),
                        activityId: ""
                    ))
                
                
            }
        }
    }
    
    private func setSheetBoundary(lowestPoint: Int, highestPoint: Int) {
        self.indentLow = lowestPoint
        self.indentHigh = highestPoint
    }
}

#Preview {
    AutoScrollView(color: Color.blue, items: liveReviewSamples)
}

struct OverlayView: View {
    var proxy: GeometryProxy
    var index: Int
    
    var data: [ReviewModel]
    var isExpanded: Bool
    @Binding var selectedMenuItem: Int
    @Binding var selectedIndex: Int
    
    
    @State private var indentLow: Int = 90
    @State private var indentHigh: Int = 90
    @State private var starRating: Int = 4
    
    var body: some View {
        if self.isExpanded && selectedIndex == index {
            ExpandedCell(selectedMenuItem: self.$selectedMenuItem, proxy: proxy, starRating: self.$starRating)
        } else {
            Cell(data: self.data, index: index, starRating: self.$starRating)
        }
    }
}

private struct Cell: View {
    var data: [ReviewModel]
    var index: Int
    @Binding var starRating: Int
    
    var body: some View {
        ZStack {
            VStack(alignment: .center) {
                Text("\(self.data[index].title)")
                    .font(.system(size: 25))
                    .bold()
                    .foregroundColor(.white)
                
                RatingView(rating: self.$starRating)
                // not sure why font works here and not frame
                    .font(.system(size: 12))
            }
            
            Text("Tap To Expand")
                .foregroundColor(.white)
                .font(.system(size: 10))
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .trailing)
            
        }
        .padding(15)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

private struct ExpandedCell: View {
    @Binding var selectedMenuItem: Int
    var proxy: GeometryProxy
    @Binding var starRating: Int
    
    var body: some View {
        VStack{
            Details()
                .contextMenu {
                    // on long press contextMenu modifier display this
                    MenuWidget()
                }
        }
        .onChange(of: selectedMenuItem) {
            switch selectedMenuItem {
            case 0:
                true
            case 1:
                true
            case 2:
                true
            default:
                break
            }
        }
    }
    
    private func MenuWidget() -> some View{
        VStack{
            Button(action: {
                selectedMenuItem = 0
            }) {
                Label("Go to Venue", systemImage: "person.2.square.stack")
            }
            
            Button(action: {
                selectedMenuItem = 1
            }) {
                Label("Minimize", systemImage: "star.fill")
            }
            
            Button(action: {
                selectedMenuItem = 2
            }) {
                Label("Some other shit", systemImage: "lock.fill")
            }
            
        }
    }
    
    private func Details() -> some View{
        ZStack{
            VStack(alignment: .leading) {
                Image("Guy")
                    .resizable()
                    .frame(width: 60, height: 70)
                    .scaledToFit()
                    .clipShape(Circle())
                
                VStack(alignment: .leading) {
                    Text("Bob Snow")
                        .foregroundColor(.white)
                        .font(.system(size: 12))
                    
                    Text("Tampa,FL")
                        .foregroundColor(.white)
                        .font(.system(size: 12))
                }
                Spacer(minLength: 0)
            }
            .padding(10)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack(alignment: .trailing) {
                
                Text("This shit was cold of fuck I hate it f this place on my momma! I aint even lying either this shit sucks This shit was cold of fuck I hate it f this place on my momma! I aint even lying either this shit sucks")
                    .foregroundColor(.white)
                    .font(.system(size: 20))
                    .frame(width: proxy.size.width * 0.65)
                
                Spacer(minLength: 0)
                
                Text("Hold for More")
                    .foregroundColor(.white)
                    .font(.system(size: 12))
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
            .padding(15)
        }
    }
}
