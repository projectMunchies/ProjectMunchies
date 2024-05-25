import SwiftUI
import ContactsUI
import Contacts
import FirebaseFirestore

struct Contact: Identifiable {
    let id: String
    let name: String
    let lastMessage: String
    // Add other properties as needed
}

struct Message: Identifiable {
    let id: String
    let content: String
    let isCurrentUser: Bool
    // Add other properties as needed (e.g., timestamp)
}

struct ContactsView: View {
    @State private var contacts: [Contact] = []
    @State private var showContactPicker = false
    @State private var selectedContact: CNContact?
    @State private var showInvitationPreview = false
    @State private var invitationMessage = ""
    
    var body: some View {
        NavigationView {
            List {
                ForEach(contacts) { contact in
                    NavigationLink(destination: MessageThreadView(contact: binding(for: contact))) {
                        VStack(alignment: .leading) {
                            Text(contact.name)
                                .font(.headline)
                            Text(contact.lastMessage)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                }
                .onDelete(perform: deleteContact)
            }
            .navigationTitle("Contacts")
            .navigationBarItems(trailing:
                Button(action: {
                    showContactPicker = true
                }) {
                    Image(systemName: "plus")
                }
            )
            .sheet(isPresented: $showContactPicker) {
                // Replace with the system contact picker
                ContactPicker(onContactPicked: { contact in
                    if let contact = contact {
                        checkUserRegistration(for: contact) { isRegistered in
                            if isRegistered {
                                // User is already registered, add them to the contacts list
                                let newContact = Contact(id: contact.identifier, name: contact.givenName + " " + contact.familyName, lastMessage: "")
                                DispatchQueue.main.async {
                                    contacts.append(newContact)
                                }
                            } else {
                                // User is not registered, show the invitation preview
                                selectedContact = contact
                                showInvitationPreview = true
                            }
                        }
                    }
                })
            }
            .sheet(isPresented: $showInvitationPreview) {
                            InvitationPreviewView(invitationMessage: $invitationMessage, onSend: {
                                if let contact = selectedContact {
                                    sendInvitation(to: contact, message: invitationMessage)
                                }
                                showInvitationPreview = false
                                selectedContact = nil
                                invitationMessage = ""
                            }, onCancel: {
                                showInvitationPreview = false
                                selectedContact = nil
                                invitationMessage = ""
                            })
                        }
                    }
                    .onAppear {
                        fetchContacts()
                    }
                }
                
    
    private func fetchContacts() {
        // Fetch contacts from your data source (e.g., Firestore)
        // and assign them to the `contacts` state variable
        // Example:
        contacts = [
            Contact(id: "1", name: "John Doe", lastMessage: "Hey, how are you?"),
            Contact(id: "2", name: "Jane Smith", lastMessage: "Let's catch up soon!")
        ]
    }
    
    private func deleteContact(at offsets: IndexSet) {
        contacts.remove(atOffsets: offsets)
        // Delete the contact from your data source (e.g., Firestore)
    }
    
    private func binding(for contact: Contact) -> Binding<Contact> {
        guard let index = contacts.firstIndex(where: { $0.id == contact.id }) else {
            fatalError("Contact not found")
        }
        return $contacts[index]
    }
    
    private func checkUserRegistration(for contact: CNContact, completion: @escaping (Bool) -> Void) {
        let email = contact.emailAddresses.first?.value as String?
        
        if let email = email {
            let db = Firestore.firestore()
            db.collection("profiles").whereField("email", isEqualTo: email).getDocuments { (querySnapshot, error) in
                if let error = error {
                    print("Error checking user registration: \(error)")
                    completion(false)
                } else {
                    if let snapshot = querySnapshot, !snapshot.isEmpty {
                        completion(true)
                    } else {
                        completion(false)
                    }
                }
            }
        } else {
            completion(false)
        }
    }
    
    private func sendInvitation(to contact: CNContact, message: String) {
        let phoneNumber = contact.phoneNumbers.first?.value.stringValue
        
        if let phoneNumber = phoneNumber {
            let invitationMessage = "\(contact.givenName) \(contact.familyName) has invited you to join CrunchBunch. \(message)"
            sendInvitationText(to: phoneNumber, message: invitationMessage)
        }
        
        let email = contact.emailAddresses.first?.value as String?
        
        if let email = email {
            let emailMessage = "\(contact.givenName) \(contact.familyName) has invited you to join CrunchBunch. \(message)"
            sendInvitationEmail(to: email, message: emailMessage)
        }
    }
    
    private func sendInvitationText(to phoneNumber: String, message: String) {
        let accountSID = ProcessInfo.processInfo.environment["TWILIO_ACCOUNT_SID"] ?? ""
        let authToken = ProcessInfo.processInfo.environment["TWILIO_AUTH_TOKEN"] ?? ""
        let messagingServiceSID = ProcessInfo.processInfo.environment["TWILIO_MESSAGING_SERVICE_SID"] ?? ""
        
        let urlString = "https://api.twilio.com/2010-04-01/Accounts/\(accountSID)/Messages.json"
        let phoneNumber = phoneNumber.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? ""
        let message = message.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? ""
        
        let body = "Body=\(message)&MessagingServiceSid=\(messagingServiceSID)&To=\(phoneNumber)"
        let authString = "\(accountSID):\(authToken)"
        let authData = authString.data(using: .utf8)?.base64EncodedString() ?? ""
        
        let headers = [
            "Content-Type": "application/x-www-form-urlencoded",
            "Authorization": "Basic \(authData)"
        ]
        
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = headers
        request.httpBody = body.data(using: .utf8)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error sending message: \(error)")
                return
            }
            
            guard let data = data else {
                print("No data received")
                return
            }
            
            if let responseString = String(data: data, encoding: .utf8) {
                print("Response: \(responseString)")
            }
        }.resume()
    }
    
    private func sendInvitationEmail(to email: String, message: String) {
        // Implement the logic to send an invitation email using an email service or API
        // You can use libraries like SwiftMailer or integrate with services like SendGrid or Mailchimp
        print("Sending invitation email to: \(email) with message: \(message)")
    }
}

struct ContactPicker: UIViewControllerRepresentable {
    var onContactPicked: (CNContact?) -> Void
    
    func makeUIViewController(context: Context) -> CNContactPickerViewController {
        let picker = CNContactPickerViewController()
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: CNContactPickerViewController, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, CNContactPickerDelegate {
        var parent: ContactPicker
        
        init(_ parent: ContactPicker) {
            self.parent = parent
        }
        
        func contactPicker(_ picker: CNContactPickerViewController, didSelect contact: CNContact) {
            parent.onContactPicked(contact)
        }
        
        func contactPickerDidCancel(_ picker: CNContactPickerViewController) {
            parent.onContactPicked(nil)
        }
    }
}

struct MessageThreadView: View {
    @Binding var contact: Contact
    @State private var messages: [Message] = []
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 10) {
                    ForEach(messages) { message in
                        MessageBubble(message: message)
                    }
                }
            }
            
            // Add a message input field and send button here
        }
        .navigationTitle(contact.name)
        .onAppear {
            fetchMessages()
        }
    }
    
    private func fetchMessages() {
        // Fetch messages for the specific contact from your data source (e.g., Firestore)
        // and assign them to the `messages` state variable
        // Example:
        messages = [
            Message(id: "1", content: "Hey, how are you?", isCurrentUser: false),
            Message(id: "2", content: "I'm doing well, thanks!", isCurrentUser: true),
            Message(id: "3", content: "That's great to hear!", isCurrentUser: false)
        ]
    }
}

struct MessageBubble: View {
    let message: Message
    
    var body: some View {
        HStack {
            if message.isCurrentUser {
                Spacer()
                Text(message.content)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            } else {
                Text(message.content)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                Spacer()
            }
        }
    }
}
