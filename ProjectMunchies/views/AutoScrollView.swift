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
    @State private var selectedView: Int?
    @State private var isExpanded: Bool = false
    @State private var indentLow: Int = 90
    @State private var indentHigh: Int = 90
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        GeometryReader { proxy in
            VStack {
                ScrollView(.vertical, showsIndicators: false) {
                    ScrollViewReader{ sr in
                        VStack {
                            ForEach(self.data.indices, id:\.self) { index in
                                
                                
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(color.gradient)
                                    .frame(height: self.isExpanded ? 150 : 50)
                                    .overlay {
                                        IsExpandedView(proxy: proxy, index: index, data: self.data, isExpanded: self.isExpanded)
                                        
                                    }
                                    .onTapGesture {
                                        if self.isExpanded {
                                            withAnimation(.easeInOut(duration: 0.3)) {
                                                setSheetBoundary(lowestPoint: 300, highestPoint: 300)
                                                self.isExpanded.toggle()
                                            }
                                        } else {
                                            withAnimation(.easeInOut(duration: 0.3)) {
                                                setSheetBoundary(lowestPoint: 800, highestPoint: 800)
                                                self.isExpanded.toggle()
                                            }
                                        }
                                    }
                            }
                        }.onChange(of: self.data.count) { _ in
                            withAnimation {
                                sr.scrollTo(self.data.count - 1)
                            }
                        }
                    }
                }
            }
            .onReceive(timer) { time in
                data.append(ReviewModel(id:"\(UUID().uuidString)", title: "", body: "", profileId: "", venueId: "", timeStamp: Date.today()))
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

struct IsExpandedView: View {
    var proxy: GeometryProxy
    var index: Int
    var data: [ReviewModel]
    var isExpanded: Bool
    
    @State private var selectedView: Int?
    @State private var indentLow: Int = 90
    @State private var indentHigh: Int = 90
    
    var body: some View {
        if self.isExpanded {
            VStack{
                Menu {
                    Button(action: {
                        selectedView = 0
                    }) {
                        Label("Go to Venue", systemImage: "person.2.square.stack")
                    }
                    
                    Button(action: {
                        selectedView = 1
                    }) {
                        Label("Minimize", systemImage: "star.fill")
                    }
                    
                    Button(action: {
                        selectedView = 2
                    }) {
                        Label("Some other shit", systemImage: "lock.fill")
                    }
                } label: {
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
            .onChange(of: selectedView) {
                switch selectedView {
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
        } else {
            VStack(alignment: .leading) {
                Text("item \(self.data[index].id)")
                    .foregroundColor(.white)
                
                Text("Tap To Expand")
                    .foregroundColor(.white)
                    .font(.system(size: 12))
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .trailing)
            }
            .padding(15)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}
