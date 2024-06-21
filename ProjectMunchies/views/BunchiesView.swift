import SwiftUI
import FirebaseAuth
import ContactsUI
import Contacts

struct BunchiesView: View {
    @Binding var sheetIndents: Set<PresentationDetent>
    @Binding var activeTab: NavBarTabsModel
    @State private var selectedTab: BunchiesTabModel?
    @Environment(\.colorScheme) private var scheme
    @State private var tabProgress: CGFloat = 0.5
    @State private var bunchiesContacts: [CNContact] = []
    @State private var chatsContacts: [CNContact] = []
    @State private var showContactPicker = false
    @State private var contactPickerItem: UUID?
    @State private var showChatView = false
    @State private var selectedChatContact: CNContact?
    @State private var recommendedProfiles: [ProfileModel] = []
    @Environment(\.presentationMode) var presentationMode
    @StateObject private var profilesViewModel = ProfilesViewModel()
    @State private var requestedProfiles: [ProfileModel] = []
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack(spacing: 15) {
                    HStack {
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }, label: {
                            Image(systemName: "line.3.horizontal.decrease")
                        })
                        
                        Spacer()
                        
                        Button(action: {
                            showContactPicker = true
                        }, label: {
                            Image(systemName: "plus")
                        })
                    }
                    .font(.title2)
                    .overlay {
                        Text("Messages")
                            .font(.title3.bold())
                    }
                    .foregroundStyle(.primary)
                    .padding(15)
                    
                    CustomTabBar()
                    
                    ScrollView(.horizontal) {
                        LazyHStack(spacing: 0) {
                            SampleView(.gray, tabModel: .activity, contacts: [], recommendedProfiles: profilesViewModel.recommendedProfiles)
                                .id(BunchiesTabModel.activity)
                                .containerRelativeFrame(.horizontal)
                            
                            SampleView(.gray, tabModel: .bunchies, contacts: bunchiesContacts, recommendedProfiles: [])
                                .id(BunchiesTabModel.bunchies)
                                .containerRelativeFrame(.horizontal)
                            SampleView(.gray, tabModel: .chats, contacts: chatsContacts, recommendedProfiles: [])
                                .id(BunchiesTabModel.chats)
                                .containerRelativeFrame(.horizontal)
                        }
                        .scrollTargetLayout()
                        .offsetX { value in
                            /// Converting Offset into Progress
                            let progress = -value / (UIScreen.main.bounds.width * CGFloat(BunchiesTabModel.allCases.count - 1))
                            
                            /// Capping Progress BTW 0-1
                            tabProgress = max(min(progress, 1), 0)
                        }
                    }
                    .scrollPosition(id: $selectedTab)
                    .scrollIndicators(.hidden)
                    .scrollTargetBehavior(.paging)
                    .scrollClipDisabled()
                }
                .coordinateSpace(name: "BunchiesView")
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                .background(.gray.opacity(0.1))
                .sheet(isPresented: $showContactPicker) {
                    ContactPicker(selectedContacts: $bunchiesContacts)
                }
                .sheet(item: $selectedChatContact) { contact in
                    ChatView(contact: contact)
                }
            }
            .navigationBarHidden(true)
        }
        .onAppear {
            Task {
                do {
                    try await profilesViewModel.fetchRecommendedProfiles()
                    profilesViewModel.fetchReceivedRequests()
                } catch {
                    print("Error fetching recommended profiles: \(error.localizedDescription)")
                }
            }
        }
    }
    
    @ViewBuilder
    func CustomTabBar() -> some View {
        HStack(spacing: 0) {
            ForEach(BunchiesTabModel.allCases, id: \.rawValue) { BunchiesTabModel in
                HStack(spacing: 9) {
                    Image(systemName: BunchiesTabModel.systemImage)
                    
                    Text(BunchiesTabModel.rawValue)
                        .font(.callout)
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 10)
                .contentShape(.capsule)
                .onTapGesture {
                    withAnimation(.snappy) {
                        selectedTab = BunchiesTabModel
                    }
                }
            }
        }
        .background {
            GeometryReader {
                let size = $0.size
                let capulseWidth = size.width / CGFloat(BunchiesTabModel.allCases.count)
                Capsule()
                    .fill(scheme == .dark ? .black : .white)
                    .frame(width: capulseWidth)
                    .offset(x: tabProgress * (size.width - capulseWidth))
            }
        }
        .background(.gray.opacity(0.1), in: .capsule)
        .padding(.horizontal, 15)
    }
    
    @ViewBuilder
    func SampleView(_ color: Color, tabModel: BunchiesTabModel, contacts: [CNContact], recommendedProfiles: [ProfileModel]) -> some View {
        VStack(spacing: 30) {
            if tabModel == .activity {
                // Suggested section
                Section(header: HStack {
                    Text("Suggested")
                        .font(.headline)
                        .foregroundColor(.primary)
                    
                    Spacer()
                }
                    .padding(.leading, 20)
                    .padding(.top, 20)
                ) {
                    ScrollView(.vertical) {
                        LazyVStack(spacing: 10) {
                            ForEach(profilesViewModel.recommendedProfiles, id: \.id) { profile in
                                // Display recommended user
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(color.gradient)
                                    .frame(height: 125)
                                    .overlay {
                                        HStack {
                                            VStack(alignment: .leading) {
                                                Image(uiImage: profile.profileImage)
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fill)
                                                    .frame(width: 50, height: 50)
                                                    .clipShape(Circle())
                                                
                                                VStack(alignment: .leading, spacing: 3) {
                                                    Text(profile.fullName)
                                                        .font(.headline)
                                                        .foregroundColor(.white)
                                                    Text(profile.occupation)
                                                        .font(.subheadline)
                                                        .foregroundColor(.white)
                                                }
                                            }
                                            
                                            Spacer()
                                            
                                            Button(action: {
                                                // Send request to the user
                                                profilesViewModel.sendRequest(to: profile.id)
                                            }) {
                                                Image(systemName: "plus")
                                                    .foregroundColor(.white)
                                            }
                                        }
                                        .padding(20)
                                    }
                            }
                        }
                        .padding(.horizontal, 20)
                    }
                }
                
                // Request section
                Section(header: HStack {
                    Text("Request")
                        .font(.headline)
                        .foregroundColor(.primary)
                    
                    Spacer()
                }
                    .padding(.leading, 20)
                    .padding(.top, 20)
                ) {
                    ScrollView(.vertical) {
                        LazyVStack(spacing: 10) {
                            ForEach(profilesViewModel.receivedRequests, id: \.id) { profile in
                                // Display received request
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(color.gradient)
                                    .frame(height: 125)
                                    .overlay {
                                        HStack {
                                            VStack(alignment: .leading) {
                                                Image(uiImage: profile.profileImage)
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fill)
                                                    .frame(width: 50, height: 50)
                                                    .clipShape(Circle())
                                                
                                                VStack(alignment: .leading, spacing: 3) {
                                                    Text(profile.fullName)
                                                        .font(.headline)
                                                        .foregroundColor(.white)
                                                    Text(profile.occupation)
                                                        .font(.subheadline)
                                                        .foregroundColor(.white)
                                                }
                                            }
                                            
                                            Spacer()
                                            
                                            HStack(spacing: 10) {
                                                Button(action: {
                                                    // Accept request
                                                    profilesViewModel.acceptRequest(profile)
                                                }) {
                                                    Image(systemName: "checkmark")
                                                        .foregroundColor(.green)
                                                }
                                                
                                                Button(action: {
                                                    // Deny request
                                                    profilesViewModel.denyRequest(profile)
                                                }) {
                                                    Image(systemName: "xmark")
                                                        .foregroundColor(.red)
                                                }
                                            }
                                        }
                                        .padding(20)
                                    }
                            }
                        }
                        .padding(.horizontal, 20)
                    }
                }
            } else   if tabModel == .bunchies {
                // Bunchies section
                ScrollView(.vertical) {
                    LazyVStack(spacing: 10) {
                        ForEach(contacts, id: \.identifier) { contact in
                            // Display bunchie contact
                            RoundedRectangle(cornerRadius: 15)
                                .fill(color.gradient)
                                .frame(height: 125)
                                .overlay {
                                    HStack {
                                        VStack(alignment: .leading) {
                                            Circle()
                                                .fill(.white.opacity(0.25))
                                                .frame(width: 50, height: 50)
                                            
                                            VStack(alignment: .leading, spacing: 3) {
                                                Text(contact.givenName + " " + contact.familyName)
                                                    .font(.headline)
                                                    .foregroundColor(.white)
                                                Text(contact.jobTitle ?? "")
                                                    .font(.subheadline)
                                                    .foregroundColor(.white)
                                            }
                                        }
                                        
                                        Spacer()
                                        
                                        HStack(spacing: 15) {
                                            Button(action: {
                                                // Delete contact action
                                                if let index = bunchiesContacts.firstIndex(where: { $0.identifier == contact.identifier }) {
                                                    bunchiesContacts.remove(at: index)
                                                }
                                            }) {
                                                Image(systemName: "xmark.circle.fill")
                                                    .foregroundColor(.red)
                                                    .font(.system(size: 22))
                                            }
                                            
                                            Button(action: {
                                                // Start chat action
                                                if !chatsContacts.contains(where: { $0.identifier == contact.identifier }) {
                                                    chatsContacts.insert(contact, at: 0) // Insert at the beginning of the array
                                                }
                                                selectedChatContact = contact
                                                showChatView = true
                                            }) {
                                                Image(systemName: "message.circle.fill")
                                                    .foregroundColor(.blue)
                                                    .font(.system(size: 22))
                                            }
                                        }
                                    }
                                    .padding(20)
                                }
                        }
                    }
                    .padding(.horizontal, 20)
                }
                
            } else if tabModel == .chats {
                // Chats section
                ScrollView(.vertical) {
                    LazyVStack(spacing: 10) {
                        ForEach(chatsContacts, id: \.identifier) { contact in
                            // Display chat contact
                            RoundedRectangle(cornerRadius: 15)
                                .fill(color.gradient)
                                .frame(height: 125)
                                .overlay {
                                    HStack {
                                        VStack(alignment: .leading) {
                                            Circle()
                                                .fill(.white.opacity(0.25))
                                                .frame(width: 50, height: 50)
                                            
                                            VStack(alignment: .leading, spacing: 3) {
                                                Text(contact.givenName + " " + contact.familyName)
                                                    .font(.headline)
                                                    .foregroundColor(.white)
                                                Text(contact.jobTitle ?? "")
                                                    .font(.subheadline)
                                                    .foregroundColor(.white)
                                            }
                                        }
                                        
                                        Spacer()
                                        
                                        Image(systemName: "message.circle.fill")
                                            .foregroundColor(.blue)
                                            .font(.system(size: 22))
                                    }
                                    .padding(20)
                                }
                                .onTapGesture {
                                    selectedChatContact = contact
                                    showChatView = true
                                }
                        }
                    }
                    .padding(.horizontal, 20)
                }
            }
        }
        .mask {
            Rectangle()
                .padding(.bottom, -200)
        }
    }
}

struct BunchiesView_Previews: PreviewProvider {
    static var previews: some View {
        BunchiesView(sheetIndents: .constant([.height(60), .medium, .large]), activeTab: .constant(.profile))
    }
}
