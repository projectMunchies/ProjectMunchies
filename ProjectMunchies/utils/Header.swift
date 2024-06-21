//
//  Header.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 8/12/23.
//

import SwiftUI

struct Header: View {
    @Binding var sheetIndents: Set<PresentationDetent>
    @Binding var activeTab: NavBarTabsModel
    @State private var showPrefPopover: Bool = false
    @State private var showIntroPopover: Bool = false
    @State private var isSettingsPresented: Bool = false
    @State private var selectedView: Int?
    @State var navigationTag: String?
    
    var body: some View {
        GeometryReader{ geoReader in
            ZStack{
                //                Color.blue
                //                    .ignoresSafeArea()
                HStack{
                    Spacer()
                    logoWithText(for: geoReader)
                    Spacer()
                    searchButton(for: geoReader)
                    //                    Spacer()
                    //                    messageIcon(for: geoReader)
                    
                }
            }
        }
        
    }
    
    public func logoWithText(for geoReader: GeometryProxy) -> some View {
        HStack{
            ZStack{
                Image("crunchBunchAppIcon")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: geoReader.size.width * 0.14, height: geoReader.size.height * 0.14)
                    .position(x:geoReader.size.width * 0.04, y:geoReader.size.height * 0.5)
                
                Image("crunchBunchText")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: geoReader.size.width * 0.4, height: geoReader.size.height * 0.4)
                    .position(x:geoReader.size.width * 0.3, y:geoReader.size.height * 0.51)
            }
        }
        
    }
    
    //    public func messageIcon(for geoReader: GeometryProxy) -> some View {
    //        VStack {
    //            Button(action: {
    //                self.sheetIndents = [.medium, .large]
    //                self.activeTab = .bunchies
    //            }) {
    //                Image(systemName: "message.and.waveform")
    //                    .resizable()
    //                    .frame(width: 30, height: 30)
    //                    .foregroundColor(.white)
    //            }
    //        }
    //        .padding(.horizontal, 16)
    //        .padding(.top, 16)
    //    }
    //
    
    public func searchButton(for geoReader: GeometryProxy) -> some View {
        VStack{
            NavigationLink(destination: SearchView()){
                Image(systemName: "magnifyingglass.circle")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.white)
            }
            .position(x:geoReader.size.width * 0.37, y:geoReader.size.height * 0.51)
        }
    }
}

#Preview {
    HomeView()
}
