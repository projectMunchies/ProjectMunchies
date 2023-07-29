//
//  EventView.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 7/27/23.
//

import SwiftUI

struct EventView: View {
    var body: some View {
        GeometryReader { geoReader in
            ZStack{
                Text("Event Details")
                    .bold()
                    .foregroundColor(.black)
                    .font(.largeTitle)
                    .position(x:geoReader.size.width * 0.35, y:geoReader.size.height * 0.1)
                
                Text("Italian Date Night")
                    .bold()
                    .foregroundColor(.black)
                    .font(.system(size: 25))
                    .position(x:geoReader.size.width * 0.5, y:geoReader.size.height * 0.15)
                
                Text("with")
                    .bold()
                    .foregroundColor(.black)
                    .font(.system(size: 25))
                    .position(x:geoReader.size.width * 0.5, y:geoReader.size.height * 0.18)
                
                Image("Guy")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .cornerRadius(300)
                    .position(x:geoReader.size.width * 0.5, y:geoReader.size.height * 0.35)
                
                
                Text("June 2nd, 2024 (3 days)")
                    .bold()
                    .foregroundColor(.black)
                    .font(.system(size: 25))
                    .position(x:geoReader.size.width * 0.5, y:geoReader.size.height * 0.55)
                
                Text("3:00 pm")
                    .bold()
                    .foregroundColor(.black)
                    .font(.system(size: 15))
                    .position(x:geoReader.size.width * 0.5, y:geoReader.size.height * 0.58)

                Text("Magginos, Tampa, Fl")
                    .bold()
                    .foregroundColor(.black)
                    .font(.system(size: 25))
                    .position(x:geoReader.size.width * 0.5, y:geoReader.size.height * 0.65)

                Text("Description")
                    .bold()
                    .foregroundColor(.black)
                    .font(.system(size: 25))
                    .position(x:geoReader.size.width * 0.5, y:geoReader.size.height * 0.7)
//
//                Text("blah blah blah ablah blah ablah blah")
//                    .bold()
//                    .foregroundColor(.black)
//                    .font(.largeTitle)
//                    .position(x:geoReader.size.width * 0.5, y:geoReader.size.height * 0.1)
                
                HStack{
                    Button(action: {
            
                    }) {
                        Text("Edit")
                            .frame(width: 180, height: 60)
                            .background(Color.gray)
                            .cornerRadius(40)
                            .foregroundColor(.white)
                    }
                    
                    Button(action: {
            
                    }) {
                        Text("Send Invite")
                            .frame(width: 180, height: 60)
                            .background(Color.gray)
                            .cornerRadius(40)
                            .foregroundColor(.white)
                    }
                }
                .position(x:geoReader.size.width * 0.5, y:geoReader.size.height * 0.9)

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
}

struct EventView_Previews: PreviewProvider {
    static var previews: some View {
        EventView()
    }
}
