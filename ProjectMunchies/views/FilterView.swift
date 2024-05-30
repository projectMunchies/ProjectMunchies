//
//  FilterView.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 5/30/24.
//

import SwiftUI

struct FilterView: View {
    @State private var navbarIndex: Int = 0
    @State private var filterLvlOneIndices: [Int] = []
    @State private var filterLvlTwoIndices: [Int] = []
    
    var body: some View {
        VStack{
            getFilterLvlOne()
            
            if !filterLvlOneIndices.isEmpty {
                getFilterLvlTwo()
            }
            
            Button(action: {
                //  self.searchText = "chipotle"
                //  startSearch.toggle()
                //  self.useMapAlerts = false
                //                    setSheetBoundary(lowestPoint: 90, highestPoint: 90)
                self.navbarIndex = 0
                self.filterLvlOneIndices.removeAll()
            }){
                ZStack{
                    Text("")
                        .frame(width: 350, height: 60)
                        .background(.gray)
                        .cornerRadius(30)
                    
                    Text("Search")
                        .foregroundColor(.white)
                }
            }
            .padding(.top)
        }
        
    }
    
    private func getFilterLvlOne() -> some View {
        LazyVStack{
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 30){
                    ForEach(filterLvlOne) { filterIcon in
                        Button(action: {
                            if filterLvlOneIndices.contains(filterIcon.id) {
                                let index = filterLvlOneIndices.firstIndex(of: filterIcon.id)
                                filterLvlOneIndices.remove(at: index!)
                            } else {
                                filterLvlOneIndices.append(filterIcon.id)
                            }
                            
                        }){
                            VStack{
                                ZStack{
                                    Circle()
                                        .foregroundColor(filterLvlOneIndices.contains(filterIcon.id) ? .green : .gray)
                                        .frame(width: 60, height: 60)
                                    
                                    if navbarIndex == 0 {
                                        Image(filterIcon.icon)
                                            .resizable()
                                            .frame(width: 30, height: 30)
                                    }
                                }
                                
                                if navbarIndex == 0 {
                                    Text(filterIcon.name)
                                        .foregroundColor(.white)
                                }
                            }
                        }
                    }
                }
            }
            .padding(.leading, 20)
        }
    }
    
    private func getFilterLvlTwo() -> some View {
        LazyVStack{
            ScrollView{
                if filterLvlOneIndices.contains(where: {$0 == 1}) {
                    Divider()
                        .background(.gray)
                    
                    getSpecialsFilter()
                }
                
                if filterLvlOneIndices.contains(where: {$0 == 2}) {
                    Divider()
                        .background(.gray)
                    
                    getPortionsFilter()
                }
            }
        }
    }
    
    private func getSpecialsFilter() -> some View {
        VStack{
            Text("Specials")
                .bold()
                .foregroundColor(.gray)
                .font(.title2)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 30){
                    ForEach(filterSpecialsLvl) { filterIcon in
                        Button(action: {
                            filterLvlTwoIndices.append(filterIcon.id)
                        }){
                            VStack{
                                ZStack{
                                    Circle()
                                        .foregroundColor(self.filterLvlTwoIndices.contains(filterIcon.id) ? .green : .gray)
                                        .frame(width: 60, height: 60)
                                    
                                    if navbarIndex == 0 {
                                        Image(filterIcon.icon)
                                            .resizable()
                                            .frame(width: 30, height: 30)
                                    }
                                }
                                
                                if navbarIndex == 0 {
                                    Text(filterIcon.name)
                                        .foregroundColor(.white)
                                }
                            }
                        }
                    }
                }
            }
            .padding(.leading, 20)
        }
    }
    
    private func getPortionsFilter() -> some View {
        VStack{
            Text("Portions")
                .bold()
                .foregroundColor(.gray)
                .font(.title2)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 30){
                    ForEach(filterSpecialsLvl) { filterIcon in
                        Button(action: {
                            filterLvlTwoIndices.append(filterIcon.id)
                        }){
                            VStack{
                                ZStack{
                                    Circle()
                                        .foregroundColor(self.filterLvlTwoIndices.contains(filterIcon.id) ? .green : .gray)
                                        .frame(width: 60, height: 60)
                                    
                                    if navbarIndex == 0 {
                                        Image(filterIcon.icon)
                                            .resizable()
                                            .frame(width: 30, height: 30)
                                    }
                                }
                                
                                if navbarIndex == 0 {
                                    Text(filterIcon.name)
                                        .foregroundColor(.white)
                                }
                            }
                        }
                    }
                }
            }
            .padding(.leading, 20)
        }
    }
}

#Preview {
    FilterView()
}
