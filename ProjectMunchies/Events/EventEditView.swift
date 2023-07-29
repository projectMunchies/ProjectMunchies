//
//  EventEditView.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 7/29/23.
//

import SwiftUI

struct EventEditView: View {
    var body: some View {
        VStack{
            Form{
               
                Section{
                    Text("gdsg")
                } header: {
                    Text("Title")
                        .foregroundColor(.black)
                        .font(.system(size: 20))
                }
                
                Section{
                    Text("gdsg")
                } header: {
                    Text("Description")
                        .foregroundColor(.black)
                        .font(.system(size: 20))
                }
                
                Section{
                    Text("gdsg")
                } header: {
                    Text("Date")
                        .foregroundColor(.black)
                        .font(.system(size: 20))
                }
                
                Section{
                    Text("gdsg")
                } header: {
                    Text("Time")
                        .foregroundColor(.black)
                        .font(.system(size: 20))
                }
                
                Section{
                    Text("gdsg")
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
        EventEditView()
    }
}
