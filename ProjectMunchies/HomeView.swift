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
              
                CardsView()
                headerSection(for: geoReader)
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
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
