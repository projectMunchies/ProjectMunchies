//
//  HomeView.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 7/27/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        GeometryReader{ geoReader in
            ZStack{
                Color.white
                    .ignoresSafeArea()
                
                ZStack{
                    CardsView()
                        .position(x:geoReader.size.width * 0.5, y:geoReader.size.height * 0.52)
                    headerSection(for: geoReader)
                    subHeaderSection(for: geoReader)
                }
            }
          
            
        }
      
       
    }
    
    private func headerSection(for geoReader: GeometryProxy) -> some View {
        HStack{
            Spacer()
            HStack(spacing: 10){
                Image(systemName: "line.3.horizontal")
                    .resizable()
                    .frame(width: 25, height: 20)
                    .font(.system(size: 35))
                    .foregroundColor(.black)
                
                Text("Munchies")
                    .bold()
                    .foregroundColor(.black)
                    .font(.title2)
            }
            
            Spacer()
                .frame(width: geoReader.size.width * 0.35)
            
            HStack(spacing: 20){
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .font(.system(size: 35))
                    .foregroundColor(.black)
                
                Image(systemName: "bell")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .font(.system(size: 35))
                    .foregroundColor(.black)
            }
            Spacer()
        }
        .position(x:geoReader.size.width * 0.5, y:geoReader.size.height * 0.03)
    }
    
    private func subHeaderSection(for geoReader: GeometryProxy) -> some View {
        HStack{
            Text("Preferences")
                .bold()
                .foregroundColor(.black)
                .font(.largeTitle)
            
            Image(systemName: "line.3.horizontal.circle")
                .resizable()
                .frame(width: 35, height: 35)
                .font(.system(size: 35))
                .foregroundColor(.black)
        }
        .position(x:geoReader.size.width * 0.35, y:geoReader.size.height * 0.1)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
