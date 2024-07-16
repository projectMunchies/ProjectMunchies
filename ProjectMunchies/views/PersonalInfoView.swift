import SwiftUI
import FirebaseAuth
import Firebase

struct PersonalInfoView: View {
    @StateObject private var model = PersonalInfoModel()
    @Binding var showHomeView: Bool
    @Binding var username: String
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    Section(header: Text("Profile Information")) {
                        TextField("Username", text: $username)
                    }
                    
                    Section(header: Text("Hobbies")) {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 15) {
                                ForEach(model.hobbies) { hobby in
                                    selectionItem(for: hobby, action: { model.selectHobby(hobby) })
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                    
                    Section(header: Text("Occupation")) {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 15) {
                                ForEach(model.occupations) { occupation in
                                    selectionItem(for: occupation, action: { model.selectOccupation(occupation) })
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                    
                    Section(header: Text("Favorite Cuisines")) {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 15) {
                                ForEach(model.cuisines) { cuisine in
                                    selectionItem(for: cuisine, action: { model.selectCuisine(cuisine) })
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                    
                    Section(header: Text("Age")) {
                                            TextField("Enter your age", text: $model.age)
                                                .keyboardType(.numberPad)
                                        }
                                        
                                        Section(header: Text("Location")) {
                                            Menu {
                                                Picker("Select your location", selection: $model.selectedLocation) {
                                                    Text("Select a location").tag(nil as Location?)
                                                    ForEach(model.locations) { location in
                                                        Text(location.name).tag(location as Location?)
                                                    }
                                                }
                                            } label: {
                                                HStack {
                                                    Text(model.selectedLocation?.name ?? "Select a location")
                                                    Spacer()
                                                    Image(systemName: "chevron.down")
                                                }
                                                .foregroundColor(.primary)
                                                .padding()
                                                .background(Color.gray.opacity(0.1))
                                                .cornerRadius(8)
                                            }
                                        }
                                        
                    
                    HStack {
                        Button(action: {
                            savePersonalInfo()
                            presentationMode.wrappedValue.dismiss()
                            showHomeView = true
                        }) {
                            Text("Save")
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.purple)
                                .cornerRadius(10)
                        }
                        
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                            showHomeView = true
                        }) {
                            Text("Close")
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.gray)
                                .cornerRadius(10)
                        }
                    }
                }
                .padding()
            }
            .navigationBarTitle("About Me")
        }
        .onAppear {
            model.username = username
        }
    }
    
    private func selectionItem<T: Identifiable>(for item: T, action: @escaping () -> Void) -> some View where T: Hashable {
        VStack {
            Image(systemName: (item as? Hobby)?.imageName ?? (item as? Occupation)?.imageName ?? (item as? Cuisine)?.imageName ?? "")
                .font(.system(size: 30))
                .frame(width: 60, height: 60)
                .background(((item as? Hobby)?.isSelected ?? (item as? Occupation)?.isSelected ?? (item as? Cuisine)?.isSelected ?? false) ? Color.purple.opacity(0.3) : Color.gray.opacity(0.2))
                .clipShape(Circle())
                .onTapGesture(perform: action)
            stackedText(for: (item as? Hobby)?.name ?? (item as? Occupation)?.name ?? (item as? Cuisine)?.name ?? "")
        }
    }
    
    private func stackedText(for name: String) -> some View {
        let words = name.split(separator: " ")
        return Group {
            if words.count > 1 {
                VStack(spacing: 2) {
                    Text(String(words[0]))
                        .font(.caption)
                        .lineLimit(1)
                    Text(words[1...].joined(separator: " "))
                        .font(.caption)
                        .lineLimit(1)
                }
            } else {
                Text(name)
                    .font(.caption)
            }
        }
    }
    
    private func savePersonalInfo() {
        guard let userId = Auth.auth().currentUser?.uid else {
            print("User not authenticated")
            return
        }
        
        let selectedHobbyNames = model.getSelectedHobbies().map { $0.name }
        let selectedCuisineNames = model.getSelectedCuisines().map { $0.name }
        let personalInfo: [String: Any] = [
            "username": username,
            "hobbies": selectedHobbyNames,
            "occupation": model.getSelectedOccupation()?.name ?? "",
            "age": model.age,
            "location": model.location,
            "favoriteCuisines": selectedCuisineNames
        ]
        
        let db = Firestore.firestore()
        db.collection("users").document(userId).updateData(personalInfo) { error in
            if let error = error {
                print("Error updating personal info: \(error.localizedDescription)")
            } else {
                print("Personal info updated successfully")
            }
        }
    }
}

struct PersonalInfoView_Previews: PreviewProvider {
    static var previews: some View {
        PersonalInfoView(showHomeView: .constant(false), username: .constant(""))
    }
}
