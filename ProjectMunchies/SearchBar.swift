//
//  SearchBar.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 7/27/23.
//

import SwiftUI

struct SearchBar: View {
    
    @Binding var searchText: String
    @State private var isEditing: Bool = false
    
    
    
    var body: some View {
        HStack{
            TextField("Search...", text: $searchText)
                .frame(width: 380, height: 50)
                .background(Color(red: 0.949, green: 0.949, blue: 0.97))
                .cornerRadius(15)
              //  .shadow(radius: 5, x:5 , y: 5)
                .overlay(
                    HStack{
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            
                        if isEditing {
                            Button(action: {
                                self.searchText = ""
                            }) {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.gray)
                            }
                        }
                        
                        
                    }
                )
                .onTapGesture {
                    self.isEditing = true
                }
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(searchText: .constant(""))
    }
}
