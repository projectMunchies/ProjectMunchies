//
//  EventsView.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 7/27/23.
//

import SwiftUI

struct EventsView: View {
    @State private var searchText: String = ""
    @State private var events: [EventModel] = MockService.eventsSampleData
    
    var body: some View {
        GeometryReader { geoReader in
            
            VStack{
                Text("Header")
                    .font(.largeTitle)
                
                SearchBar(searchText: $searchText)
                
                ScrollView{
                    VStack{
                        ForEach(self.events.filter({searchText.isEmpty ? true: $0.title.contains(searchText)})) { event in
                            NavigationLink(destination: EventView()) {
                                
                                Text("hello world")
                                    .frame(width: 300, height: 100)
                                    .background(.gray)
                                    .cornerRadius(30)
                            }
                        }
                    }
                }
            }
            .position(x: geoReader.frame(in: .local).midX, y: geoReader.size.height * 0.6)
      
        }
    }
}

struct EventsView_Previews: PreviewProvider {
    static var previews: some View {
        EventsView()
    }
}
