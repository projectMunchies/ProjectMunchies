//
//  CreateReviewOverlay.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 6/4/24.
//

import SwiftUI

struct CreateReviewOverlay: View {
    @Binding var isCreateReviewOverlay: Bool
    @Binding var showSheet: Bool
    
    var body: some View {
        VStack{
            Button(action: {
                isCreateReviewOverlay.toggle()
                
                if !isCreateReviewOverlay {
                    showSheet = true
                }
            }) {
                Image(systemName: "x.circle")
                    .resizable()
                    .foregroundColor(.white)
                    .frame(width: 30, height: 30)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.trailing)
            }
            
            Text("Was your food cold?")
                .font(.system(size: 40))
                .foregroundColor(.white)
            
            Text("Help out the community! Give your review on these recent visits: ")
                .font(.system(size: 20))
                .foregroundColor(.white)
                .padding(.leading)
                .padding(.trailing)
            
            ScrollView {
                VStack{
                    ForEach(0..<7) { _ in
                        Button(action: {
                            
                        }) {
                            HStack {
                                Image("greenLemon")
                                    .resizable()
//                                    .frame(width: geoReader.size.width * 0.19, height: geoReader.size.height * 0.19)
                                    .scaledToFill()
                                    .clipShape(Circle())
                                
                                VStack {
                                    Text("Miguelotios")
                                        .font(.system(size: 32))
                                        .foregroundColor(.white)
                                    
                                    Text("3744 Acr rd Tampa Fl")
                                        .font(.system(size: 15))
                                        .foregroundColor(.white)
                                }
                                
                            }
//                            .frame(width: geoReader.size.width * 0.9, height: geoReader.size.height * 0.2)
                            .overlay {
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(.white, lineWidth: 6)
//                                    .frame(width: geoReader.size.width * 0.89, height: geoReader.size.height * 0.15)
                            }
                        }
                    }
                }
            }
            
            Spacer()
        }
    }
}

#Preview {
    CreateReviewOverlay(isCreateReviewOverlay: .constant(true), showSheet: .constant(false))
}
