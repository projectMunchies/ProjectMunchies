import SwiftUI
import Contacts
import Firebase

struct ProfileView: View {
    @Binding var sheetIndents: Set<PresentationDetent>
    @Binding var activeTab: NavBarTabsModel
    @StateObject private var viewModel = ProfilesViewModel()
    @State private var selectedImage: UIImage? = nil
    @State private var isShowingImagePicker = false
    @State private var showBunchiesView = false
    @State private var showChatView = false
    @State private var selectedChatContact: CNContact?
    @State private var showPersonalInfoView = false
    
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    ZStack {
                        if let image = selectedImage {
                            Image(uiImage: image)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 120, height: 120)
                                .clipShape(Circle())
                                .padding(28)
                                .padding(.top, 10)
                                .offset(x: -20, y: 10)
                        } else {
                            Circle()
                                .fill(Color.blue)
                                .frame(width: 120, height: 120)
                                .padding(28)
                                .padding(.top, 10)
                                .offset(x: -20, y: 10)
                            
                            Image(systemName: "person.fill")
                                .font(.system(size: 60))
                                .foregroundColor(.white)
                                .offset(x: -20, y: 15)
                        }
                    }
                    .onTapGesture {
                        isShowingImagePicker = true
                    }
                    .sheet(isPresented: $isShowingImagePicker) {
                        ImagePickerWrapper(selectedImage: $selectedImage)
                    }
                    
                    Image(systemName: "checkmark.seal.fill")
                        .font(.system(size: 33))
                        .foregroundColor(.blue)
                        .offset(x: -20)
                    
                    Spacer()
                    
                    Button(action: {
                        showPersonalInfoView = true
                    }) {
                        HStack {
                            Image(systemName: "pencil")
                            
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(Color.blue.opacity(0.1))
                        .foregroundColor(.blue)
                        .cornerRadius(20)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.blue, lineWidth: 1)
                        )
                    }
                }
                .padding(.horizontal)
                
                // User Info
                if viewModel.isLoading {
                    ProgressView()
                } else if let error = viewModel.errorMessage {
                    Text(error)
                        .foregroundColor(.red)
                } else {
                    VStack(alignment: .leading, spacing: 5) {
                        Text(viewModel.username)
                            .font(.system(size: 18))
                            .fontWeight(.bold)
                            .frame(height: 24)
                            .overlay(
                                Text("Username")
                                    .font(.system(size: 18))
                                    .fontWeight(.bold)
                                    .foregroundColor(.gray)
                                    .opacity(viewModel.username.isEmpty ? 1 : 0)
                            )
                        
                        Text(viewModel.greeting)
                            .font(.system(size: 15))
                            .fontWeight(.bold)
                            .frame(height: 20)
                            .overlay(
                                Text("Hi, I'm new here")
                                    .font(.system(size: 15))
                                    .fontWeight(.bold)
                                    .foregroundColor(.gray)
                                    .opacity(viewModel.greeting.isEmpty ? 1 : 0)
                            )
                        
                        Text(viewModel.description)
                            .font(.system(size: 15))
                            .fontWeight(.light)
                            .frame(height: 20)
                            .overlay(
                                Text("Tell us about yourself")
                                    .font(.system(size: 15))
                                    .fontWeight(.light)
                                    .foregroundColor(.gray)
                                    .opacity(viewModel.description.isEmpty ? 1 : 0)
                            )
                    }
                    .offset(x: -120, y: -10)
                }
                HStack(spacing: 40) {
                    VStack {
                        Text("300")
                            .font(.title)
                            .fontWeight(.bold)
                        Text("Following")
                            .font(.system(size: 15))
                            .fontWeight(.light)
                            .foregroundColor(.gray)
                    }
                    
                    VStack {
                        Text("350")
                            .font(.title)
                            .fontWeight(.bold)
                        Text("Followers")
                            .font(.system(size: 15))
                            .fontWeight(.light)
                            .foregroundColor(.gray)
                    }
                    
                    VStack {
                        Text("350")
                            .font(.title)
                            .fontWeight(.bold)
                        Text("Close Friends")
                            .font(.system(size: 15))
                            .fontWeight(.light)
                            .foregroundColor(.gray)
                    }
                }
                .padding(.top, 2)
            }
            .padding()
            
            // Scrollable Reviews and Bunchies Section
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    VStack {
                        Rectangle()
                            .fill(Color.purple)
                            .frame(width: 170, height: 250)
                            .cornerRadius(22)
                            .shadow(color: .black.opacity(0.2), radius: 11)
                        
                        Text("My Reviews")
                            .font(.headline)
                            .foregroundColor(.black)
                            .padding(.top, 10)
                    }
                    
                    VStack {
                        Rectangle()
                            .fill(Color.purple)
                            .frame(width: 170, height: 250)
                            .cornerRadius(22)
                            .shadow(color: .black.opacity(0.2), radius: 11)
                            .onTapGesture {
                                showBunchiesView = true
                            }
                        
                        Text("Bunchies")
                            .font(.headline)
                            .foregroundColor(.black)
                            .padding(.top, 10)
                    }
                    
                    VStack {
                        Rectangle()
                            .fill(Color.red)
                            .frame(width: 170, height: 250)
                            .cornerRadius(22)
                            .shadow(color: .black.opacity(0.2), radius: 11)
                            .onTapGesture {
                                // Add action for settings view
                            }
                        
                        Text("Settings")
                            .font(.headline)
                            .foregroundColor(.black)
                            .padding(.top, 10)
                    }
                }
                .padding(.horizontal)
            }
            .frame(height: 320) // Adjust this height as needed
            
            Spacer()
        }
        
        .sheet(isPresented: $showBunchiesView) {
            BunchiesView(sheetIndents: $sheetIndents, activeTab: $activeTab)
        }
        .sheet(isPresented: $showPersonalInfoView) {
            PersonalInfoView(
                showHomeView: .constant(false),
                username: $viewModel.username,
                greeting: $viewModel.greeting,
                description: $viewModel.description
            )
        }
        .task {
            await viewModel.loadUserData()
        }
    }
}

#Preview {
    ProfileView(
        sheetIndents: .constant([.height(60), .medium, .large]),
        activeTab: .constant(.profile)
    )
}
