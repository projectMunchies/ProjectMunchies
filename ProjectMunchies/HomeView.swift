//
//  HomeView.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 7/27/23.
//

import SwiftUI

struct HomeView: View {
    
    @State private var showPrefPopover: Bool = false
    @State private var input1: String = ""
    @State private var isLoading: Bool = false
    @State private var selection = "Pick fav food"
    let foodTypes = ["Chinese","American","Mexican"]
    let gender = ["Guy","Girl"]
    let foodOrDrinks = ["Food","HappyHour"]
    let locations = ["Tampa","American"]
    
    var body: some View {
        GeometryReader{ geoReader in
            ZStack{
                Color.white
                    .ignoresSafeArea()
                
                ZStack{
                    if isLoading {
                        ProgressView()
                    } else {
                        CardsView()
                            .position(x:geoReader.size.width * 0.5, y:geoReader.size.height * 0.52)
                    }
                    
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
            
            Button(action: {
                showPrefPopover.toggle()
            }) {
                Image(systemName: "line.3.horizontal.circle")
                    .resizable()
                    .frame(width: 35, height: 35)
                    .font(.system(size: 35))
                    .foregroundColor(.black)
            }
            .popover(isPresented: $showPrefPopover) {
                VStack{
                    //                    HStack{
                    //                        Text("Input1: ")
                    //                            .font(.system(size: 20))
                    //
                    //                        TextField("", text: $input1)
                    //                            .frame(width: 260, height: 50)
                    //                            .background(.black)
                    //                            .cornerRadius(20)
                    //                    }
                    //
                    //                    HStack{
                    //                        Text("Fav Food: ")
                    //                            .font(.system(size: 20))
                    //                        Menu {
                    //                            Picker(selection: $selection) {
                    //                                ForEach(foods, id: \.self) {
                    //                                    Text($0)
                    //                                }
                    //                            } label: {}
                    //                        } label: {
                    //
                    //                            Text("\(selection)")
                    //                        }
                    //                        .foregroundColor(.black)
                    //
                    //
                    //
                    //
                    //
                    //
                    //                    }
                    
                    
                    Form {
                        Section {
                            Picker("Strength", selection: $selection) {
                                ForEach(foodOrDrinks, id: \.self) {
                                    Text($0)
                                }
                            }
                            .pickerStyle(.segmented)
                        }
                        
                        Section {
                            Picker("Food Type", selection: $selection) {
                                ForEach(foodTypes, id: \.self) {
                                    Text($0)
                                }
                            }
                            .pickerStyle(.automatic)
                        }
                        
                        Section {
                            Picker("Gender", selection: $selection) {
                                ForEach(gender, id: \.self) {
                                    Text($0)
                                }
                            }
                            .pickerStyle(.automatic)
                        }
                        
                        Section {
                            Picker("Location", selection: $selection) {
                                ForEach(locations, id: \.self) {
                                    Text($0)
                                }
                            }
                            .pickerStyle(.automatic)
                        }
                        
                        Section{
                            Picker("Age Range From", selection: $selection) {
                                ForEach(Array(stride(from: 18, to: 100, by: 1)), id: \.self) { index in
                                    Text("\(index)")
                                }
                            }
                            .pickerStyle(.automatic)
                            
                            Picker("Age Range To", selection: $selection) {
                                ForEach(Array(stride(from: 18, to: 100, by: 1)), id: \.self) { index in
                                    Text("\(index)")
                                }
                            }
                            .pickerStyle(.automatic)
                        }
                    }
                    
                    Button(action: {
                        showPrefPopover.toggle()
                        fakeLoading()
                    }) {
                        Text("Find Foodmate")
                            .frame(width: 180, height: 60)
                            .background(Color.green)
                            .cornerRadius(40)
                            .foregroundColor(.white)
                    }
                }
            }
        }
        .position(x:geoReader.size.width * 0.35, y:geoReader.size.height * 0.1)
    }
    
    private func fakeLoading(){
        isLoading.toggle()
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            isLoading.toggle()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
