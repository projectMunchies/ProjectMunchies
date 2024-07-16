import SwiftUI
import Contacts
import Firebase

struct ProfileView: View {
    @Binding var sheetIndents: Set<PresentationDetent>
    @Binding var activeTab: NavBarTabsModel
    @StateObject private var viewModel = ProfilesViewModel()
    @State private var selectedImage: UIImage? = nil
    @State private var isShowingImagePicker = false
    @State private var showUserDetailView = false
    @State private var showChatView = false
    @State private var selectedChatContact: CNContact?
    @State private var showPersonalInfoView = false
    @State private var showSettingsView = false
    @State private var moodLampAngle: Double = 0
    @State private var earthRotation: Double = 0
    
    var body: some View {
        ZStack {
            VStack {
                // Header with gray square
                VStack {
                    HStack {
                        Button(action: {
                            showSettingsView = true
                        }) {
                            Image(systemName: "gear")
                                .font(.system(size: 30))
                                .foregroundColor(.purple)
                        }
                        .padding(.top, 10)
                        
                        Spacer()
                        
                        ZStack {
                            if let image = selectedImage {
                                Image(uiImage: image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 120, height: 120)
                                    .clipShape(Circle())
                                    .padding(.top, 20)
                            } else {
                                Circle()
                                    .fill(Color.purple)
                                    .frame(width: 120, height: 120)
                                    .padding(.top, 20)
                                
                                Image(systemName: "person.fill")
                                    .font(.system(size: 60))
                                    .foregroundColor(.white)
                            }
                        }
                        .onTapGesture {
                            isShowingImagePicker = true
                        }
                        .sheet(isPresented: $isShowingImagePicker) {
                            ImagePickerWrapper(selectedImage: $selectedImage)
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            showPersonalInfoView = true
                        }) {
                            Image(systemName: "pencil")
                                .font(.system(size: 30))
                                .foregroundColor(.purple)
                        }
                        .padding(.top, 10)
                    }
                    .padding()
                    
                    Text(viewModel.username)
                        .font(.system(size: 18))
                        .fontWeight(.bold)
                    
                    HStack(spacing: 4) {
                        ForEach(0..<5) { _ in
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                        }
                    }
                    .padding(.bottom, 10)
                }
                
                if viewModel.isLoading {
                    ProgressView()
                } else if let error = viewModel.errorMessage {
                    Text(error)
                        .foregroundColor(.red)
                }
                
                HStack(spacing: 20) {
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
                .padding(.top, 1)
                
                Spacer(minLength: 4)
                Spacer().frame(height: 30)
                
                // Scrollable Reviews and Bunchies Section
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                        // My Reviews Rectangle
                        VStack {
                            ZStack {
                                // Background Image
                                Image("reviewsBackground")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 150, height: 140)
                                    .clipped()
                                    .overlay(
                                        LinearGradient(
                                            gradient: Gradient(colors: [.purple, .black.opacity(1.3)]),
                                            startPoint: .top,
                                            endPoint: .bottom
                                        )
                                    )
                                
                                // Background Icon
                                Image(systemName: "list.bullet.rectangle.fill")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 200, height: 200)
                                    .foregroundColor(.white)
                                    .opacity(0.3)
                                    .clipped()
                                
                                VStack {
                                    Spacer()
                                    
                                    HStack {
                                        Text("Reviews")
                                            .font(.headline)
                                            .foregroundColor(.white)
                                            .padding(8)
                                            .background(Color.black.opacity(0.6))
                                            .cornerRadius(10)
                                        Spacer()
                                    }
                                    .padding(.bottom, 40)
                                    .padding(.leading, 40)
                                }
                            }
                            .frame(width: 150, height: 140)
                            .cornerRadius(22)
                            .shadow(color: .black.opacity(0.2), radius: 11)
                            .onTapGesture {
                                // Add action for my reviews view
                            }
                        }

                        // Bunchies Rectangle
                        VStack {
                            ZStack {
                                // Background Image
                                Image("bunchiesBackground")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 140, height: 140)
                                    .clipped()
                                    .overlay(
                                        LinearGradient(
                                            gradient: Gradient(colors: [.purple, .black.opacity(1.3)]),
                                            startPoint: .top,
                                            endPoint: .bottom
                                        )
                                    )
                                
                                // Background Icon
                                Image(systemName: "person.3.fill")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 200, height: 200)
                                    .foregroundColor(.white)
                                    .opacity(0.3)
                                    .clipped()
                                
                                VStack {
                                    Spacer()
                                    
                                    HStack {
                                        Text("Bunchies")
                                            .font(.headline)
                                            .foregroundColor(.white)
                                            .padding(8)
                                            .background(Color.black.opacity(0.6))
                                            .cornerRadius(10)
                                        Spacer()
                                    }
                                    .padding(.bottom, 40)
                                    .padding(.leading, 40)
                                }
                            }
                            .frame(width: 140, height: 140)
                            .cornerRadius(22)
                            .shadow(color: .black.opacity(0.2), radius: 11)
                            .onTapGesture {
                                withAnimation {
                                    showUserDetailView = true
                                }
                            }
                        }

                        // Activity Rectangle
                        VStack {
                            ZStack {
                                // Background Image
                                Image("activityBackground")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 310, height: 140)
                                    .clipped()
                                    .overlay(
                                        LinearGradient(
                                            gradient: Gradient(colors: [.purple, .black.opacity(4.3)]),
                                            startPoint: .top,
                                            endPoint: .bottom
                                        )
                                    )
                                
                                // Background Icon
                                Image(systemName: "bell.badge.circle.fill")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 200, height: 200)
                                    .foregroundColor(.white)
                                    .opacity(0.3)
                                    .clipped()
                                
                                VStack {
                                    Spacer()
                                    
                                    HStack {
                                        Text("Activity")
                                            .font(.headline)
                                            .foregroundColor(.white)
                                            .padding(8)
                                            .background(Color.black.opacity(0.6))
                                            .cornerRadius(10)
                                        Spacer()
                                    }
                                    .padding(.bottom, 40)
                                    .padding(.leading, 40)
                                }
                            }
                            .frame(width: 310, height: 140)
                            .cornerRadius(22)
                            .shadow(color: .black.opacity(0.2), radius: 11)
                            .offset(x: 90)
                            .onTapGesture {
                                // Add action for activity view
                            }
                        }
                        .gridCellColumns(2)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    .padding(.horizontal)
                    .padding(.top, 20)
                }
                Spacer()
            }
            .opacity(showUserDetailView ? 0 : 1)
            
            if showUserDetailView {
                           UserDetailView(
                               sheetIndents: $sheetIndents,
                               activeTab: $activeTab,
                               isPresented: $showUserDetailView
                           )
                           .transition(.move(edge: .trailing))
                       }
                   }
                   .animation(.easeInOut, value: showUserDetailView)
                   .background(
                       Image("earth")
                           .resizable()
                           .aspectRatio(contentMode: .fit)
                           .frame(width: 1650, height: 1850)
                           .rotationEffect(.degrees(earthRotation), anchor: .center)
                           .onAppear {
                               withAnimation(Animation.linear(duration: 90.0).repeatForever(autoreverses: false)) {
                                   earthRotation = 360
                               }
                           }
                           .offset(x: UIScreen.main.bounds.width * 0.0, y: UIScreen.main.bounds.height * 0.49)
                           .ignoresSafeArea()
                           .zIndex(-1)
                   
        )
        .sheet(isPresented: $showPersonalInfoView) {
            PersonalInfoView(
                showHomeView: .constant(false),
                username: $viewModel.username
            )
        }
        .onAppear {
            viewModel.loadUserData()
        }
        .animation(.easeInOut, value: showUserDetailView)
    }
}
struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(
            sheetIndents: .constant([.height(60), .medium, .large]),
            activeTab: .constant(.profile)
        )
    }
}
