//
//  HamburgerMenu.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 7/31/23.
//

import SwiftUI

struct HamburgerMenu: View {
    @Binding var showHamburgerMenu: Bool
    let geoReader : GeometryProxy
    var body: some View {
        //GeometryReader{ geoReader in
            ZStack{
                Color.white
                    .ignoresSafeArea()
                
                VStack(alignment: .leading){
                    NavigationLink(destination: SettingsView()) {
                        HStack{
                            Image(systemName: "gear")
                                .foregroundColor(.gray)
                                .imageScale(.large)
                            Text("Settings")
                                .foregroundColor(.gray)
                                .font(.headline)
                        }
                        .padding(.top,100)
                    }
                    
                    Spacer()
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(.white)
                
                Button(action:{
                    withAnimation{
                        showHamburgerMenu.toggle()
                    }
                }) {
                        Image(systemName: "line.3.horizontal")
                            .resizable()
                            .frame(width: 25, height: 20)
                            .font(.system(size: 35))
                            .foregroundColor(.black)
                }
                .position(x: geoReader.size.width * 0.18, y: geoReader.size.height * 0.03)
            }
       // }
      
    }
}

struct HamburgerMenu_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader{ proxy in
            HamburgerMenu(showHamburgerMenu: .constant(true), geoReader: proxy)
        }
       
    }
}
