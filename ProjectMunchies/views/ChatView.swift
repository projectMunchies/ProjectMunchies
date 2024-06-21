import SwiftUI
import Contacts

struct ChatView: View {
    @Environment(\.presentationMode) var presentationMode
    let contact: CNContact
    @State private var messageText = ""
    @State private var messages: [String] = []
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                
                Text(contact.givenName)
                    .font(.title2.bold())
                
                Spacer()
                
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "xmark")
                        .font(.title)
                        .foregroundColor(.primary)
                }
            }
            .padding()
            
            ScrollView {
                ForEach(messages, id: \.self) { message in
                    MessageBubble(message: message, isCurrentUser: true)
                }
            }
            
            HStack {
                Button(action: {
                    showImagePicker = true
                }) {
                    Image(systemName: "photo")
                }
                
                TextField("Type a message", text: $messageText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button(action: {
                    sendMessage()
                }) {
                    Image(systemName: "paperplane.fill")
                }
            }
            .padding()
        }
        .background(Color(.systemBackground))
        .sheet(isPresented: $showImagePicker) {
            ImagePickerWrapper(selectedImage: $selectedImage)
        }
        .onChange(of: selectedImage) { newImage in
            if let image = newImage {
                // Handle the selected image
                // You can send it as a message or perform any other desired action
                print("Selected image: \(image)")
            }
        }
    }
    
    private func sendMessage() {
        if !messageText.isEmpty {
            messages.append(messageText)
            messageText = ""
        }
    }
}

struct MessageBubble: View {
    let message: String
    let isCurrentUser: Bool
    
    var body: some View {
        HStack {
            if isCurrentUser {
                Spacer()
            }
            
            Text(message)
                .padding()
                .background(isCurrentUser ? Color.blue : Color(.systemGray5))
                .foregroundColor(isCurrentUser ? .white : .black)
                .cornerRadius(16)
            
            if !isCurrentUser {
                Spacer()
            }
        }
        .padding(.horizontal)
    }
}
