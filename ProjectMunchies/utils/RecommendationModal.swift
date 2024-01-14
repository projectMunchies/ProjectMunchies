//
//  Modal.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 1/7/24.
//

import SwiftUI
import MapKit

struct RecommendationModal: View {
    @Binding var showModal: Bool
    @Binding var startSearch: Bool
    @Binding var searchText: String
    @Binding var position: MapCameraPosition
    @Binding var showVenueFilter: Bool
    @Binding var venue: VenueModel
    
    @State private var cards: [Card] = sampleCards
    
    let timer = Timer.publish(every: 2, on: .main, in: .common).autoconnect()
    @State private var counter = 0
    @State private var words: [String] = ["predicting...","fetching preferences...","fetching history..."]
    @State private var emptyWords: [String] = []
    @State private var displayModal: Bool = false
    // @State private var showVenueFilter: Bool = true
    
    @State private var searchResults: [MKMapItem] = []
    // @State private var venue: VenueModel = venueSample
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 27.9506,
            longitude: -82.4572
        ),
        span: MKCoordinateSpan(
            latitudeDelta: 0.001,
            longitudeDelta: 0.001
        )
    )
    
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
                if counter == 3 {
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
        .onAppear {
            self.cards = cardDeck.randomElement() ?? sampleCards
        }
    }
    
    public func recommendationSearch(for query: String) {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = query
        request.resultTypes = .pointOfInterest
        request.region = self.region
        Task {
            let search = MKLocalSearch(request: request)
            let response = try? await search.start()
            searchResults = response?.mapItems ?? []
            
            for result in searchResults {
                let venue = VenueModel(coordinate: result.placemark.coordinate, name: result.name ?? "", address: result.placemark.title ?? "")
                self.venue = venue
                //print(venue)
            }
            // print(searchResults)
        }
        // self.startSearch = false
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
                //                Image(card.image)
                //                    .resizable()
                //                    .aspectRatio(contentMode: .fill)
                //                    .frame(width: size.width, height: size.height)
                //                    .frame(width: frameWidth)
                //                    .clipShape(.rect(cornerRadius: 25))
                //                    .offset(x: minX > 0 ?  0 : -cappedWidth)
                //                    .offset(x: -card.previousOffset)
                
                AsyncImage(url: URL(string: card.image)) { image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: size.width, height: size.height)
                .frame(width: frameWidth)
                .overlay(
                    LinearGradient(gradient: Gradient(colors: [.black.opacity(0.7), .clear]),
                                       startPoint: .top,
                                       endPoint: .center)
                    )
                .clipShape(.rect(cornerRadius: 25))
                .offset(x: minX > 0 ?  0 : -cappedWidth)
                .offset(x: -card.previousOffset)
               
                
                VStack{
                    Text(card.mealType)
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                    
                    Spacer()
                        .frame(height: 150)
                    Button(action: {
                        withAnimation {
                            searchText = card.title
                            recommendationSearch(for: self.searchText)
                            startSearch = true
                            
                            self.showModal.toggle()
                        }
                    }){
                        ZStack{
                            Text("")
                                .frame(width: 300, height: 70)
                                .background(.gray)
                                .cornerRadius(30)
                            
                            Text("\(card.title)")
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
                .onChange(of: self.venue.coordinate) {
                    position =  MapCameraPosition.item(MKMapItem(placemark: .init(coordinate: venue.coordinate)))
                    // print("should see coordinate ->\(venue)")
                    //showVenueFilter.toggle()
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
    RecommendationModal(showModal: .constant(true), startSearch: .constant(false), searchText: .constant(""),position: .constant(MapCameraPosition.automatic), showVenueFilter: .constant(false), venue: .constant(venueSample))
}
