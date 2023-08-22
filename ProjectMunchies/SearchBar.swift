//
//  SearchBar.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 7/27/23.
//

import SwiftUI

struct SearchBar: View {
    
    @Binding var searchText: String
    @Binding var startSearch: Bool
    @State private var isEditing: Bool = false
    
    
    
    var body: some View {
            HStack{
                TextField("Search...", text: $searchText)
                    .frame(width: 380, height: 50)
                    .background(Color(red: 0.949, green: 0.949, blue: 0.97))
                    .foregroundColor(.black)
                    .cornerRadius(15)
                  //  .shadow(radius: 5, x:5 , y: 5)
                    .overlay(
                        HStack{
                            Spacer()
                            
                            if isEditing {
                                Button(action: {
                                    self.startSearch.toggle()
                                }) {
                                    Image(systemName: "magnifyingglass")
                                        .foregroundColor(.blue)
                                }
                                .padding(.trailing,10)
                                
                                Button(action: {
                                    self.searchText = ""
                                }) {
                                    Image(systemName: "multiply.circle.fill")
                                        .foregroundColor(.gray)
                                }
                            }
//
//                            Spacer()
//                                .frame(width: geoReader.size.width * 0.85)
                        }
                    )
                    .onTapGesture {
                        self.isEditing = true
                    }
            }
            .ignoresSafeArea(.keyboard, edges: .bottom)
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(searchText: .constant(""), startSearch: .constant(false))
    }
}
