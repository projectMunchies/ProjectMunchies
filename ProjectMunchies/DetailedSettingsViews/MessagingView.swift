//
//  MessagingView.swift
//  ProjectMunchies
//
//  Created by Marcus Mckoy on 3/14/24.
//

import SwiftUI
import Contacts
import ContactsUI
import MessageUI

class GroupManager: ObservableObject {
    @Published var groups: [Group] = []

    func createGroup(name: String, emoji: String, members: [CNContact]) {
        let newGroup = Group(name: name, emoji: emoji, members: members)
        groups.append(newGroup)
    }
}

struct MessagingView: View {
    @State private var isShowingContactPicker = false
    @State private var selectedContacts: [CNContact] = []
    @State private var isSettingsPresented = false
    @State private var selectedView: Int = 0
    @State private var searchText: String = ""
    @State private var messages: [MessageThread] = []
    
    @State private var contacts: [CNContact] = []
    @State private var activeContacts: [String] = []
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Text("Bunchies Chat")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                Spacer()
                profileIcon()
            }
            .padding(.horizontal)
            .padding(.top, 16)
            
            HStack {
                TextField("Search", text: $searchText)
                    .padding(.horizontal)
                    .padding(.vertical, 8)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
                
                Button(action: {
                    addNewMessage()
                }) {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.blue)
                }
                .padding(.leading, 8)
                .padding(.trailing, 16)
                .contextMenu {
                    Button(action: {
                        // Add message action
                        addNewMessage()
                    }) {
                        Label("Add Message", systemImage: "message")
                    }
                    Button(action: {
                        // Add contact action
                        isShowingContactPicker = true
                        selectedView = 1 // Navigate to Contacts tab
                    }) {
                        Label("Add Contact", systemImage: "person.crop.circle.badge.plus")
                    }
                }
            }
            .padding(.horizontal)
            
            // Place the TabView selection control here
            Picker(selection: $selectedView, label: Text("Select a Tab")) {
                Text("Messages").tag(0)
                Text("Contacts").tag(1)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.horizontal)
            .padding(.bottom, 8) // Add some padding below the picker
            
            // Messages Tab
            if selectedView == 0 {
                NavigationView {
                    VStack(spacing: 20) {
                        List {
                            ForEach(messages) { message in
                                MessageRowView(message: message)
                            }
                            .onDelete(perform: deleteMessage)
                        }
                    }
                }
                .padding(.horizontal)
            }
            
            
            // Contacts Tab
            if selectedView == 1 {
                           NavigationView {
                               VStack(spacing: 20) {
                                   List {
                                       ForEach(contacts.filter { searchText.isEmpty ? true : $0.givenName.localizedCaseInsensitiveContains(searchText) || $0.familyName.localizedCaseInsensitiveContains(searchText) }, id: \.self) { contact in
                                           ContactRowView(contact: contact, messages: $messages, activeContacts: $activeContacts)
                                       }
                                       .onDelete(perform: deleteContact)
                                   }
                               }
                               .sheet(isPresented: $isShowingContactPicker) {
                                   ContactPicker(selectedContacts: $selectedContacts)
                                       .onDisappear {
                                           contacts.append(contentsOf: selectedContacts)
                                           selectedContacts.removeAll()
                                       }
                               }
                           }
                           .padding(.horizontal)
                       }
                   }
               }
    
    @ViewBuilder
    func profileIcon() -> some View {
        Menu {
            Button(action: {
                selectedView = 0
            }) {
                Label("My Bunchies", systemImage: "person.2.square.stack")
            }
            
            Button(action: {
                selectedView = 1
            }) {
                Label("My Reviews", systemImage: "star.fill")
            }
            
            Button(action: {
                selectedView = 2
            }) {
                Label("Settings", systemImage: "gearshape.fill")
            }
        } label: {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundColor(.black)
        }
        .padding(.horizontal, 16)
        .padding(.top, 16)
        .onChange(of: selectedView) { newValue in
            isSettingsPresented = true // Set this to true for all views
        }
        .sheet(isPresented: $isSettingsPresented) {
            NavigationView {
                switch selectedView {
                case 0:
                    MyBunchiesView()
                case 1:
                    MyReviewsView()
                case 2:
                    SettingsView()
                default:
                    EmptyView()
                }
            }
        }
    }
    
    func addNewMessage() {
        isShowingContactPicker = true
    }
    
    
    func deleteMessage(at offsets: IndexSet) {
        messages.remove(atOffsets: offsets)
    }
    
    func deleteContact(at offsets: IndexSet) {
        contacts.remove(atOffsets: offsets)
    }
}

func formattedCurrentTime() -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "HH:mm:ss" // Customize the format as needed
    return formatter.string(from: Date())
}

struct NewMessageView: View {
    @Binding var contacts: [CNContact]
    @Binding var messages: [MessageThread]
    @Environment(\.presentationMode) var presentationMode
    
    @State private var selectedContacts: [CNContact] = []
    @State private var threadName: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(contacts, id: \.self) { contact in
                        Button(action: {
                            if selectedContacts.contains(contact) {
                                selectedContacts.removeAll(where: { $0 == contact })
                            } else {
                                selectedContacts.append(contact)
                            }
                        }) {
                            HStack {
                                Text("\(contact.givenName) \(contact.familyName)")
                                Spacer()
                                if selectedContacts.contains(contact) {
                                    Image(systemName: "checkmark")
                                }
                            }
                        }
                    }
                }
                
                TextField("Thread Name", text: $threadName)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button(action: {
                    let newThread = MessageThread(title: threadName.isEmpty ? "New Thread" : threadName, participants: selectedContacts)
                    messages.append(newThread)
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Create Thread")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .disabled(selectedContacts.isEmpty)
            }
            .navigationTitle("New Message")
            .navigationBarItems(trailing: Button("Cancel") {
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
}


struct MessageRowView: View {
    let message: MessageThread

    var body: some View {
        NavigationLink(destination: MessageDetailView(message: message)) {
            VStack(alignment: .leading) {
                Text(message.title)
                    .font(.headline)
                Divider()
            }
            .padding()
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct MessageDetailView: View {
    @State var message: MessageThread
    
    @State private var inputMessage: String = ""
    @State private var isShowingImagePicker: Bool = false
    @State private var selectedImage: UIImage = UIImage()
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVStack {
                    ForEach(message.messages, id: \.self.text) { message in
                        MessageBubble(text: message.text, isCurrentUser: message.isCurrentUser)
                    }
                }
            }
            
            HStack {
                // Picture icon button
                Button(action: {
                    // Action to open image picker
                }) {
                    Image(systemName: "photo")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.blue)
                        .padding()
                }

                // Text field for message input
                TextField("Type a message...", text: $inputMessage)
                    .padding(.horizontal)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                // Send button
                Button(action: {
                    // Action to send the message
                    sendMessage()
                }) {
                    Image(systemName: "paperplane.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.blue)
                        .padding()
                }
            }
                       .padding()
                   }
                   .padding(.bottom, 20)
                   .navigationBarTitleDisplayMode(.inline)
                   .navigationBarTitle(message.title)
               }
               
               func sendMessage() {
                   guard !inputMessage.isEmpty else { return }
                   let newMessage = (text: inputMessage, isCurrentUser: true)
                   message.messages.append(newMessage)
                   inputMessage = ""
               }
           }

struct MessageBubble: View {
    let text: String
    let isCurrentUser: Bool

    var body: some View {
        HStack {
            if isCurrentUser {
                Spacer()
                Text(text)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
            } else {
                Text(text)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                Spacer()
            }
        }
        .padding(.horizontal)
    }
}

struct ContactRowView: View {
    let contact: CNContact
    @Binding var messages: [MessageThread]
    @Binding var activeContacts: [String]
    
    var body: some View {
        HStack {
            NavigationLink(destination: ContactProfileView(contact: contact)) {
                Text("\(contact.givenName) \(contact.familyName)")
            }
            
            Spacer()
            
            Button(action: {
                startNewMessageThread(with: contact)
            }) {
                Image(systemName: "message")
                    .foregroundColor(.blue)
            }
        }
        .padding()
    }
    
    func startNewMessageThread(with contact: CNContact) {
        let newThread = MessageThread(title: "\(contact.givenName) \(contact.familyName)", participants: [contact])
        messages.append(newThread)
        activeContacts.append(newThread.title)
        // Navigate to the new message thread
        // You can use a navigation link or programmatic navigation here
    }
}

struct MessageThread: Identifiable {
    let id = UUID()
    let title: String
    let participants: [CNContact]
    var messages: [(text: String, isCurrentUser: Bool)] = []
}
    struct MessagingView_Previews: PreviewProvider {
        static var previews: some View {
            MessagingView()
        }
    }

