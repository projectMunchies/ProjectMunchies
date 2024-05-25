//
//  InvitationPreviewView.swift
//  ProjectMunchies
//
//  Created by Marcus Mckoy on 5/24/24.
//

import SwiftUI

struct InvitationPreviewView: View {
    @Binding var invitationMessage: String
    var onSend: () -> Void
    var onCancel: () -> Void
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Enter your invitation message:")
                    .font(.headline)
                    .padding()
                
                TextEditor(text: $invitationMessage)
                    .frame(height: 100)
                    .padding()
                
                HStack {
                    Button("Cancel") {
                        onCancel()
                    }
                    .foregroundColor(.red)
                    
                    Spacer()
                    
                    Button("Send") {
                        onSend()
                    }
                    .foregroundColor(.blue)
                }
                .padding()
            }
            .navigationBarTitle("Invitation Preview")
        }
    }
}
