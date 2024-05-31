//
//  BunchiesView.swift
//  ProjectMunchies
//
//  Created by Marcus Mckoy on 2/1/24.
//
import SwiftUI
import ContactsUI
import Contacts
import MapKit


struct BunchiesView: View {
    @Binding var sheetIndents: Set<PresentationDetent>
    @Binding var activeTab: NavBarTabsModel
    @State private var isShowingAddFriendsModal = false
    @State private var isShowingContactPicker = false
    @State private var selectedContacts: [CNContact] = []
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                    Text("Bunchies")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                
                    Spacer()
                
                   VStack(spacing: 10) {
                       Button(action: {
                           self.sheetIndents = [.height(60), .medium, .large]
                           self.activeTab = .filter
                       }) {
                           Text("Close")
                               .padding(.vertical, 10)
                               .padding(.horizontal, 20)
                               .background(Color.blue)
                               .foregroundColor(.white)
                               .cornerRadius(10)
                       }
                       .buttonStyle(PlainButtonStyle())
                       Button(action: {
                           isShowingContactPicker = true
                       }) {
                           Text("Add from Contacts")
                               .padding(.vertical, 10)
                               .padding(.horizontal, 20)
                               .background(Color.blue)
                               .foregroundColor(.white)
                               .cornerRadius(10)
                       }
                       .buttonStyle(PlainButtonStyle())
                       
                       Button(action: {
                           // Handle action for creating groups
                       }) {
                           Text("Create Groups")
                               .padding(.vertical, 10)
                               .padding(.horizontal, 20)
                               .background(Color.green)
                               .foregroundColor(.white)
                               .cornerRadius(10)
                       }
                       .buttonStyle(PlainButtonStyle())
                   }
                   
                   Spacer()
                   
                   Text("Here's your bunchies content.")
                       .foregroundColor(.gray)
                       .padding(.bottom, 20)
                   
                   TabView {
                       NavigationView {
                           ScrollView {
                               ForEach(selectedContacts, id: \.identifier) { contact in
                                   HStack {
                                       // Green or red light to indicate activity status
                                       Circle()
                                           .frame(width: 10, height: 10)
                                           .foregroundColor(.green) // or .red
                                       
                                       Text("\(contact.givenName) \(contact.familyName)")
                                       
                                       Spacer()
                                       
                                       Button(action: {
                                           // Remove the contact from the list of friends
                                           self.removeFriend(contact)
                                       }) {
                                           Image(systemName: "minus.circle")
                                               .foregroundColor(.red)
                                               .font(.title)
                                       }
                                   }
                                   Divider()
                               }
                               .padding(.horizontal)
                           }
                           .navigationBarHidden(true)
                       }
                       .tabItem {
                           Image(systemName: "person.2")
                           Text("Bunchies")
                       }
                       
                       // Chat Tab
                       Text("Chat")
                           .tabItem {
                               Image(systemName: "message")
                               Text("Chat")
                           }
                       
                       // Random Tab
                       Text("Random")
                           .tabItem {
                               Image(systemName: "shuffle")
                               Text("Random")
                           }
                   }
               }
               .padding()
               .onAppear{
                  // self.heightIndent = 200
               }
//               .sheet(isPresented: $isShowingContactPicker) {
//                   // Present modal sheet to add friends
//                   ContactPicker(selectedContacts: $selectedContacts)
//
//            }
        }
    }
    
    private func removeFriend(_ contact: CNContact) {
        // Remove the contact from the list of friends
        if let index = selectedContacts.firstIndex(where: { $0.identifier == contact.identifier }) {
            selectedContacts.remove(at: index)
        }
    }
    
    struct ContactPicker: UIViewControllerRepresentable {
        typealias UIViewControllerType = CNContactPickerViewController
        
        @Binding var selectedContacts: [CNContact]

        func makeUIViewController(context: Context) -> CNContactPickerViewController {
            let picker = CNContactPickerViewController()
            picker.delegate = context.coordinator
            return picker
        }
        
        func updateUIViewController(_ uiViewController: CNContactPickerViewController, context: Context) {
            // Update the view controller if needed
        }
        
        func makeCoordinator() -> Coordinator {
            Coordinator(self)
        }
        
        class Coordinator: NSObject, CNContactPickerDelegate {
            var parent: ContactPicker
            
            init(_ parent: ContactPicker) {
                self.parent = parent
            }
            
            func contactPicker(_ picker: CNContactPickerViewController, didSelect contacts: [CNContact]) {
                // Append only new contacts to the list of friends
                for contact in contacts {
                    if !parent.selectedContacts.contains(where: { $0.identifier == contact.identifier }) {
                        parent.selectedContacts.append(contact)
                    }
                }
            }
        }
    }
}
