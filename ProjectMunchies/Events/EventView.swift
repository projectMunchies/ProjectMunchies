//
//  EventView.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 7/27/23.
//

import SwiftUI

struct EventView: View {
    @State private var showHamburgerMenu: Bool = false
    @State private var inviteSentAlert: Bool = false
    
    let event: EventModel
    let viewModel: CardViewModel
    
    var body: some View {
        GeometryReader { geoReader in
            ZStack{
                Color.white
                    .ignoresSafeArea()
                
                ZStack{
                    Text("Event Details")
                        .bold()
                        .foregroundColor(.black)
                        .font(.largeTitle)
                        .position(x:geoReader.size.width * 0.35, y:geoReader.size.height * 0.1)
                    
                    Text("\(event.title)")
                        .bold()
                        .foregroundColor(.black)
                        .font(.system(size: 25))
                        .position(x:geoReader.size.width * 0.5, y:geoReader.size.height * 0.15)
                    
//                    Text("with")
//                        .bold()
//                        .foregroundColor(.black)
//                        .font(.system(size: 25))
//                        .position(x:geoReader.size.width * 0.5, y:geoReader.size.height * 0.18)
                    
                    Image("Guy")
                        .resizable()
                        .frame(width: 170, height: 170)
                        .cornerRadius(300)
                        .position(x:geoReader.size.width * 0.6, y:geoReader.size.height * 0.35)
                    
                    Image("Girl")
                        .resizable()
                        .frame(width: 170, height: 170)
                        .cornerRadius(300)
                        .position(x:geoReader.size.width * 0.4, y:geoReader.size.height * 0.35)
                    
                    
                    Text("\(event.eventDate, style: .date)")
                        .bold()
                        .foregroundColor(.black)
                        .font(.system(size: 25))
                        .position(x:geoReader.size.width * 0.5, y:geoReader.size.height * 0.55)
                    
                    Text("\(event.eventDate, style: .time)")
                        .bold()
                        .foregroundColor(.black)
                        .font(.system(size: 15))
                        .position(x:geoReader.size.width * 0.5, y:geoReader.size.height * 0.58)

                    Text("\(event.location)")
                        .bold()
                        .foregroundColor(.black)
                        .font(.system(size: 25))
                        .position(x:geoReader.size.width * 0.5, y:geoReader.size.height * 0.65)
                    VStack{
                        Text("Description")
                            .bold()
                            .foregroundColor(.black)
                            .font(.system(size: 25))
                            //.position(x:geoReader.size.width * 0.5, y:geoReader.size.height * 0.7)

                        Text("\(event.description)")
                            .foregroundColor(.black)
                            .font(.system(size: 22))
                            //.position(x:geoReader.size.width * 0.5, y:geoReader.size.height * 0.7)
                    }
                    .position(x:geoReader.size.width * 0.5, y:geoReader.size.height * 0.73)
                  
                    
                    HStack{
//                        NavigationLink(destination: EventEditView(event: event, viewModel: viewModel)) {
//                            Text("Edit")
//                                .frame(width: 180, height: 60)
//                                .background(Color.gray)
//                                .cornerRadius(40)
//                                .foregroundColor(.white)
//                        }
                        
                        Button(action: {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                self.inviteSentAlert.toggle()
                            }
                           
                        }) {
                            Text("Send Invite")
                                .frame(width: 180, height: 60)
                                .background(Color.gray)
                                .cornerRadius(40)
                                .foregroundColor(.white)
                        }
                        .alert(isPresented: $inviteSentAlert) {
                                   Alert(title: Text("Invite Sent!"), message: Text("You'll receieve a notification when request has been accepted"), dismissButton: .default(Text("Got it!")))
                               }
                    }
                    .position(x:geoReader.size.width * 0.5, y:geoReader.size.height * 0.9)
                }
                .disabled(self.showHamburgerMenu ? true: false)
            }
            
            //Display HamburgerMenu
            if self.showHamburgerMenu {
                HamburgerMenu(showHamburgerMenu: self.$showHamburgerMenu, geoReader: geoReader)
                    .frame(width: geoReader.size.width/2)
                    .padding(.trailing, geoReader.size.width * 0.5)
            }
        }
       
    }
}

struct EventView_Previews: PreviewProvider {
    static var previews: some View {
        EventView(event: MockService.eventsSampleData[0], viewModel: CardViewModel())
    }
}
