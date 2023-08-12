//
//  EventEditView.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 7/29/23.
//

import SwiftUI

struct EventEditView: View {
    @State private var eventTitle: String = ""
    @State private var eventDescription: String = ""
    @State private var eventDate: String = ""
    @State private var eventLocation: String = ""
    
    let event: EventModel
    let viewModel: CardViewModel
    
    var body: some View {
        VStack{
            Form{
               
                Section{
                   
                    
                    TextField(event.title, text: $eventTitle)
//                        .frame(width: 360, height: 60)
//                        .background(Color(red: 0.949, green: 0.949, blue: 0.97))
//                        .cornerRadius(30)
//                        .foregroundColor(.black)
                } header: {
                    Text("Title")
                        .foregroundColor(.black)
                        .font(.system(size: 20))
                }
                
                Section{
                    TextField(event.description, text: $eventDescription)
                } header: {
                    Text("Description")
                        .foregroundColor(.black)
                        .font(.system(size: 20))
                }
                
//                Section{
//                    TextField(String(event.eventDate), text: $eventDate)
//                } header: {
//                    Text("Date")
//                        .foregroundColor(.black)
//                        .font(.system(size: 20))
//                }
//
//                Section{
//                    Text("\(event.eventDate, style: .time)")
//                } header: {
//                    Text("Time")
//                        .foregroundColor(.black)
//                        .font(.system(size: 20))
//                }
                
                Section{
                    TextField(event.location, text: $eventLocation)
                } header: {
                    Text("Location")
                        .foregroundColor(.black)
                        .font(.system(size: 20))
                }
            }
            
            Button(action: {
    
            }) {
                Text("Save")
                    .frame(width: 180, height: 60)
                    .background(Color.green)
                    .cornerRadius(40)
                    .foregroundColor(.white)
            }
        }
    }
}

struct EventEditView_Previews: PreviewProvider {
    static var previews: some View {
        EventEditView(event: MockService.eventsSampleData[0],viewModel: CardViewModel())
    }
}
