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
    let textFieldName: String
    let geoReader: GeometryProxy
    
    var body: some View {
            HStack{
                TextField("", text: $searchText)
                    .placeholder(when: searchText.isEmpty) {
                         Text(textFieldName).foregroundColor(.white)
                            .opacity(0.7)
                 }
                    .padding()
                    .frame(width: geoReader.size.width * 0.91, height:  geoReader.size.height * 0.06)
                    .background(Color("MainColor"))
                    .foregroundColor(.white)
                    .cornerRadius(15)
                    .position(x: geoReader.frame(in: .local).midX, y: geoReader.frame(in: .local).midY)
                    .overlay(
                        HStack{
                            Spacer()
                            
                            if self.searchText != "" {
//                                Button(action: {
//                                    self.startSearch.toggle()
//                                }) {
//                                    Image(systemName: "magnifyingglass")
//                                        .foregroundColor(.blue)
//                                }
//                                .padding(.trailing,10)
                                
                                Button(action: {
                                    self.searchText = ""
                                    self.isEditing.toggle()
                                }) {
                                    Image(systemName: "multiply.circle.fill")
                                        .resizable()
                                        .frame(width: 25, height: 25)
                                        .foregroundColor(.gray)
                                }
                                .padding(30)
                            }
//
//                            Spacer()
//                                .frame(width: geoReader.size.width * 0.85)
                        }
                    )
                    .onTapGesture {
                        self.isEditing.toggle()
                    }
                    .onSubmit {
                        if searchText != "" {
                            self.startSearch.toggle()
                        }
                       
                    }
            }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader{ proxy in
            SearchBar(searchText: .constant("uhuy"), startSearch: .constant(false), textFieldName: "Search...", geoReader: proxy)
        }
    }
}
