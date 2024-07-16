import SwiftUI
import Contacts


struct UserDetailView: View {
    @Binding var sheetIndents: Set<PresentationDetent>
    @Binding var activeTab: NavBarTabsModel
    @Binding var isPresented: Bool
    @State private var allProfiles: [ProfileModel] = mockProfiles
    @State private var selectedProfile: ProfileModel?
    @State private var showDetail: Bool = false
    @State private var heroProgress: CGFloat = 0
    @State private var showHeroView: Bool = true
    @State private var selectedTab: UserDetailModel = .bunchies
    @State private var tabProgress: CGFloat = 0
    @State private var showChatView = false
    @State private var selectedChatProfile: ProfileModel?
    @State private var activeChats: [ProfileModel] = []
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationStack {
            VStack {
                CustomTabBar()
                
                TabView(selection: $selectedTab) {
                    BunchiesView()
                        .tag(UserDetailModel.bunchies)
                    
                    BunchiesChatView()
                        .tag(UserDetailModel.chat)
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .animation(.default, value: selectedTab)
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        isPresented = false
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.title2)
                            .foregroundColor(.blue)
                    }
                }
                
                ToolbarItem(placement: .principal) {
                    Text("Connect Hub")
                        .font(.headline)
                        .foregroundColor(.primary)
                }
            }
        }
        .overlay {
            DetailView(
                selectedProfile: $selectedProfile,
                heroProgress: $heroProgress,
                showDetail: $showDetail,
                showHeroView: $showHeroView
            )
        }
        .sheet(isPresented: $showChatView) {
            if let profile = selectedChatProfile {
                ChatView(contact: convertToCNContact(profile: profile))
            }
        }
        .overlayPreferenceValue(AnchorKey.self, { value in
            GeometryReader { geometry in
                if let selectedProfile,
                   let source = value[selectedProfile.id],
                   let destination = value["DESTINATION"] {
                    let sourceRect = geometry[source]
                    let destinationRect = geometry[destination]
                    
                    let diffSize = CGSize(
                        width: (destinationRect.width * 0.5) - sourceRect.width,
                        height: (destinationRect.width * 0.5) - sourceRect.height
                    )
                    
                    let diffOrigin = CGPoint(
                        x: (destinationRect.minX + destinationRect.width * 0.25) - sourceRect.minX,
                        y: destinationRect.minY - sourceRect.minY
                    )
                    
                    Image(uiImage: selectedProfile.profileImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(
                            width: sourceRect.width + (diffSize.width * heroProgress),
                            height: sourceRect.height + (diffSize.height * heroProgress)
                        )
                        .clipShape(Circle())
                        .offset(
                            x: sourceRect.minX + (diffOrigin.x * heroProgress),
                            y: sourceRect.minY + (diffOrigin.y * heroProgress)
                        )
                        .opacity(showHeroView ? 1 : 0)
                        .animation(.snappy(duration: 0.35, extraBounce: 0), value: showHeroView)
                }
            }
        })
    }

    @ViewBuilder
    func CustomTabBar() -> some View {
        HStack(spacing: 0) {
            ForEach(UserDetailModel.allCases, id: \.rawValue) { tab in
                HStack(spacing: 9) {
                    Image(systemName: tab.systemImage)
                    
                    Text(tab.rawValue)
                        .font(.callout)
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 10)
                .contentShape(.capsule)
                .onTapGesture {
                    selectedTab = tab
                }
            }
        }
        .background {
            GeometryReader {
                let size = $0.size
                let capsuleWidth = size.width / CGFloat(UserDetailModel.allCases.count)
                Capsule()
                    .fill(.black)
                    .frame(width: capsuleWidth)
                    .offset(x: CGFloat(UserDetailModel.allCases.firstIndex(of: selectedTab) ?? 0) * (size.width - capsuleWidth))
            }
        }
        .background(Color(.systemGroupedBackground), in: .capsule)
        .padding(.horizontal, 15)
    }
    
    @ViewBuilder
    func BunchiesView() -> some View {
        ScrollView(.vertical, showsIndicators: true) {
            LazyVStack(spacing: 15) {
                ForEach(allProfiles) { profile in
                    ProfileRow(profile: profile, onMessageTap: {
                        startChat(with: profile)
                    }, onProfileTap: {
                        selectedProfile = profile
                        showDetail = true
                        withAnimation(.snappy(duration: 0.35, extraBounce: 0), completionCriteria: .logicallyComplete) {
                            heroProgress = 1.0
                        } completion: {
                            Task {
                                try? await Task.sleep(for: .seconds(0.1))
                                showHeroView = false
                            }
                        }
                    })
                }
            }
            .padding(.horizontal, 15)
            .padding(.vertical, 10)
        }
    }

    struct ProfileRow: View {
        let profile: ProfileModel
        let onMessageTap: () -> Void
        let onProfileTap: () -> Void
        
        var body: some View {
            HStack(alignment: .top, spacing: 12) {
                Image(uiImage: profile.profileImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .anchorPreference(key: AnchorKey.self, value: .bounds) { anchor in
                        return [profile.id: anchor]
                    }
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(profile.fullName)
                        .fontWeight(.semibold)
                    
                    HStack(spacing: 2) {
                        ForEach(0..<5) { _ in
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                                .font(.system(size: 12))
                        }
                    }
                    
                    Text(profile.description)
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .lineLimit(2)
                }
                
                Spacer()
                
                Button(action: onMessageTap) {
                    Image(systemName: "message")
                        .foregroundColor(.blue)
                        .font(.system(size: 20))
                }
            }
            .padding(10)
            .background(Color(.systemBackground))
            .cornerRadius(15)
            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
            .onTapGesture(perform: onProfileTap)
        }
    }

    @ViewBuilder
    func BunchiesChatView() -> some View {
        ScrollView(.vertical, showsIndicators: true) {
            LazyVStack(spacing: 15) {
                ForEach(activeChats) { profile in
                    ProfileRow(profile: profile, onMessageTap: {
                        selectedChatProfile = profile
                        showChatView = true
                    }, onProfileTap: {
                        selectedProfile = profile
                        showDetail = true
                        withAnimation(.snappy(duration: 0.35, extraBounce: 0), completionCriteria: .logicallyComplete) {
                            heroProgress = 1.0
                        } completion: {
                            Task {
                                try? await Task.sleep(for: .seconds(0.1))
                                showHeroView = false
                            }
                        }
                    })
                }
            }
            .padding(.horizontal, 15)
            .padding(.vertical, 10)
        }
    }
    
    func convertToCNContact(profile: ProfileModel) -> CNContact {
        let contact = CNMutableContact()
        contact.givenName = profile.fullName
        return contact
    }
    
    func startChat(with profile: ProfileModel) {
        if !activeChats.contains(where: { $0.id == profile.id }) {
            activeChats.append(profile)
        }
        selectedTab = .chat
    }
    
    struct DetailView: View {
        @Binding var selectedProfile: ProfileModel?
        @Binding var heroProgress: CGFloat
        @Binding var showDetail: Bool
        @Binding var showHeroView: Bool
        
        @Environment(\.colorScheme) private var scheme
        @GestureState private var isDragging: Bool = false
        @State private var offset: CGFloat = .zero
        
        var body: some View {
            if let selectedProfile, showDetail {
                GeometryReader { geometry in
                    ZStack {
                        Color.white
                            .opacity(0.8)
                            .blur(radius: 10)
                            .edgesIgnoringSafeArea(.all)
                        
                        ScrollView {
                            VStack(spacing: 20) {
                                Rectangle()
                                    .fill(.clear)
                                    .frame(height: geometry.size.width * 0.5)
                                    .overlay {
                                        if !showHeroView {
                                            Image(uiImage: selectedProfile.profileImage)
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: geometry.size.width * 0.5, height: geometry.size.width * 0.5)
                                                .clipShape(Circle())
                                                .transition(.identity)
                                                .animation(.snappy(duration: 0.35, extraBounce: 0), value: showHeroView)
                                        }
                                    }
                                    .anchorPreference(key: AnchorKey.self, value: .bounds, transform: { anchor in
                                        return ["DESTINATION": anchor]
                                    })
                            
                                VStack(alignment: .center, spacing: 15) {
                                    Text(selectedProfile.fullName)
                                        .font(.title)
                                        .fontWeight(.bold)
                                    
                                    HStack(spacing: 4) {
                                        ForEach(0..<5) { _ in
                                            Image(systemName: "star.fill")
                                                .foregroundColor(.yellow)
                                                .font(.system(size: 20))
                                        }
                                    }
                                    
                                    Text("Additional Information")
                                        .font(.headline)
                                        .padding(.top, 10)
                                    
                                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
                                        .font(.body)
                                        .foregroundColor(.secondary)
                                    
                                    ForEach(0..<10) { index in
                                        Text("Extra content \(index)")
                                            .padding()
                                    }
                                }
                                .padding(20)
                                .background(Color(.systemBackground))
                                .cornerRadius(20)
                                .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 5)
                                .padding(.horizontal)
                            }
                        }
                        .frame(width: geometry.size.width)
                    }
                    .overlay(alignment: .topLeading) {
                        Button(action: {
                            showHeroView = true
                            withAnimation(.snappy(duration: 0.35, extraBounce: 0),
                                          completionCriteria: .logicallyComplete) {
                                heroProgress = 0.0
                            } completion: {
                                showDetail = false
                                self.selectedProfile = nil
                            }
                        }, label: {
                            Image(systemName: "xmark.circle.fill")
                                .font(.title2)
                                .foregroundStyle(.gray, .white)
                        })
                        .padding()
                        .opacity(showHeroView ? 0 : 1)
                        .animation(.snappy(duration: 0.2, extraBounce: 0), value: showHeroView)
                    }
                    .offset(x: UIScreen.main.bounds.width - (UIScreen.main.bounds.width * heroProgress))
                    .gesture(
                        DragGesture()
                            .updating($isDragging, body: { _, out, _ in
                                out = true
                            })
                            .onChanged(onChanged)
                            .onEnded(onEnded)
                    )
                }
            }
        }
        
        private func onChanged(_ value: DragGesture.Value) {
            guard isDragging else { return }
            var translation = value.translation.width
            translation = max(0, translation)
            let dragProgress = 1.0 - (translation / UIScreen.main.bounds.width)
            heroProgress = min(max(0, dragProgress), 1)
            offset = translation
            if !showHeroView {
                showHeroView = true
            }
        }
        
        private func onEnded(_ value: DragGesture.Value) {
            let velocity = value.predictedEndTranslation.width
            if (offset + velocity) > (UIScreen.main.bounds.width * 0.5) {
                withAnimation(.snappy(duration: 0.35, extraBounce: 0)) {
                    heroProgress = 0
                } completion: {
                    showDetail = false
                    showHeroView = true
                    selectedProfile = nil
                }
            } else {
                withAnimation(.snappy(duration: 0.35, extraBounce: 0)) {
                    heroProgress = 1
                    offset = 0
                } completion: {
                    showHeroView = false
                }
            }
        }
    }
}

struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailView(
            sheetIndents: .constant([.height(60), .medium, .large]),
            activeTab: .constant(.profile),
            isPresented: .constant(true)
        )
    }
}
