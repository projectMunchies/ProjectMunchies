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
            GetFilterLvlOne()
            
            if !filterLvlOneIndices.isEmpty {
                GetFilterLvlTwo()
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
    
    private func GetFilterLvlOne() -> some View {
        LazyVStack{
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 30){
                    ForEach(filterLvlOne) { filterIcon in
                        FilterButton(filterIcon: filterIcon)
                    }
                }
            }
            .padding(.leading, 20)
        }
    }
    
    private func GetFilterLvlTwo() -> some View {
        LazyVStack{
            ScrollView{
                if filterLvlOneIndices.contains(where: {$0 == 1}) {
                    Divider()
                        .background(.gray)
                    
                    GetSpecialsFilter()
                }
                
                if filterLvlOneIndices.contains(where: {$0 == 2}) {
                    Divider()
                        .background(.gray)
                    
                    GetPortionsFilter()
                }
            }
        }
    }
    
    private func GetSpecialsFilter() -> some View {
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
    
    private func GetPortionsFilter() -> some View {
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
    
    private func FilterButton(filterIcon: CategoryTypeModel) -> some View {
        VStack{
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
                        
                        Image(filterIcon.icon)
                            .resizable()
                            .frame(width: 30, height: 30)
                    }
                    Text(filterIcon.name)
                        .foregroundColor(.white)
                }
            }
        }
    }
}

#Preview {
    FilterView()
}
