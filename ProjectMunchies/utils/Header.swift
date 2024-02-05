//
//  Header.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 8/12/23.
//

import SwiftUI

struct Header: View {
    @State private var showPrefPopover: Bool = false
    @State private var showIntroPopover: Bool = false
    //    @State private var foodFilterCategory = "Cuisine"
    //    @State private var foodFilterType = "Pick"
    //    @State private var foodFilterGender = "Pick"
    //    @State private var foodFilterLocation = "Pick"
    //    @State private var foodFilterAgeRangeFrom: Int = 18
    //    @State private var foodFilterAgeRangeTo: Int = 70
    @State private var isSettingsPresented: Bool = false
    @State private var selectedView: Int?
    
    var body: some View {
        GeometryReader{ geoReader in
            ZStack{
//                Color.blue
//                    .ignoresSafeArea()
                HStack{
                    Spacer()
                    logoWithText(for: geoReader)
                    Spacer()
                    profileIcon(for: geoReader)
                    Spacer()
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
                    .position(x:geoReader.size.width * 0.04, y:geoReader.size.height * 0.49)
                
                Image("crunchBunchText")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: geoReader.size.width * 0.4, height: geoReader.size.height * 0.4)
                    .position(x:geoReader.size.width * 0.3, y:geoReader.size.height * 0.5)
            }
        }
        
    }
    
    public func profileIcon(for geoReader: GeometryProxy) -> some View {
        VStack{
            Menu {
                Button(action: {
                    selectedView = 0
                }) {
                    Label("My Bunchies", systemImage: "person.2.square.stack")
                }
                
                Button(action: {
                    selectedView = 1
                }) {
                    Label("My Reviews", systemImage: "star.fill")
                }
                
                Button(action: {
                    selectedView = 2
                }) {
                    Label("Privacy and Security", systemImage: "lock.fill")
                }
            } label: {
                Image(systemName: "person.circle")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.white)
            }
        }
        .onChange(of: selectedView) {
            switch selectedView {
            case 0:
                isSettingsPresented = true
            case 1:
                isSettingsPresented = true
            case 2:
                isSettingsPresented = true
            default:
                break
            }
        }
        .padding(.horizontal, 16)
        .padding(.top, 16)
        .sheet(isPresented: $isSettingsPresented) {
            NavigationView {
                MyBunchiesView()
            }
        }
        
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header()
    }
}
