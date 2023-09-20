//
//  BunchView.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 9/13/23.
//

import SwiftUI

struct BunchProfileView: View {
    @State private var threads: [String] = []
    @State private var allReviews: [String] = []
    
    let singleBunch: BunchModel
    
    //Animated View properties
    @State var currentIndex: Int = 0
    
    var body: some View {
        GeometryReader{ geoReader in
            ZStack{
                Color.white
                    .ignoresSafeArea()
                
                BGView()
                
                VStack{
                    Text("\(singleBunch.locationName) Bunch")
                        .bold()
                        .foregroundColor(.black)
                        .font(.largeTitle)
                    
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack{
                            ForEach(mockProfiles){ item in
                                Image(item.artwork)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 70, height: 100)
                                    .clipped()
                                    .cornerRadius(70)
                                  
                            }
                           
                        }
                        .padding()
                    }
                    
                    ScrollView(showsIndicators: false){
                        VStack{
                            ForEach(self.threads.reversed(), id: \.self){ item in
                                VStack{
//                                    Text("")
//                                        .frame(width: 400, height: 200)
//                                        .background(.black)
                                       // .cornerRadius(30)
                                    HStack{
                                        Circle()
                                            .foregroundColor(.white)
                                            .frame(width: 40, height: 40)
                                        Text("Join Doe")
                                            .foregroundColor(.black)
                                    }
                                    .padding(.trailing,250)
                                    
                                    Text(item)
                                        .foregroundColor(.black)
                                        .padding(.leading,70)
                                        .padding()
                                      
                                    
                                    Divider()
                                }
                            }
                        }
                    }
                }
                .onAppear{
                    self.allReviews = readCSV(inputFile: "Restaurant_Reviews2.tsv")
                    self.threads = Array(self.allReviews[0...6])
                }
            }
          
        }
    }
    
    private func readCSV(inputFile: String) -> [String] {
         if let filepath = Bundle.main.path(forResource: inputFile, ofType: nil) {
             do {
                 let fileContent = try String(contentsOfFile: filepath)
                 let lines = fileContent.components(separatedBy: "\n")
                 let withoutFirst = lines.dropFirst()
                 let results: [String] = Array(withoutFirst)
//                 lines.dropFirst().forEach { line in
//                     let data = line.components(separatedBy: ",")
//                     if data.count == 2 {
//                         results[data[0]] = data[1]
//                     }
//                 }
                 return results
             } catch {
                 print("error: \(error)") // to do deal with errors
             }
         } else {
             print("\(inputFile) could not be found")
         }
         return []
     }
    
    // Blurred BG
    @ViewBuilder
    func BGView()->some View{
        GeometryReader{proxy in
            let size = proxy.size
            
            TabView(selection: $currentIndex) {
                ForEach(mockProfiles.indices, id: \.self){index in
                    Image(mockProfiles[index].artwork)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: size.width, height: size.height)
                        .clipped()
                        .tag(index)
                    
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .animation(.easeInOut, value: currentIndex)
            
            let color: Color = .white
            //Custom Gradient
            LinearGradient(colors: [
                .white,
                .clear,
                color

            ], startPoint: .top, endPoint: .bottom)
            
            // Blurred Overlay
            Rectangle()
                .fill(.ultraThinMaterial)
        }
        .ignoresSafeArea()
    }
}

struct BunchProfileView_Previews: PreviewProvider {
    static var previews: some View {
        BunchProfileView(singleBunch: BunchModel(id: "", locationName: "", profileIds: [], reviewIds: []))
    }
}
