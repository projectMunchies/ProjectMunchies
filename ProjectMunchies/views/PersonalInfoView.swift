import SwiftUI
import FirebaseAuth
import Firebase

struct PersonalInfoView: View {
    @State private var hobbies: String = ""
    @State private var occupation: String = ""
    @State private var age: String = ""
    @State private var location: String = ""
    @State private var favoriteCuisines: String = ""
    
    @Binding var showHomeView: Bool
    @Binding var username: String
    @Binding var greeting: String
    @Binding var description: String
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    Section(header: Text("Profile Information")) {
                        TextField("Username", text: $username)
                        TextField("Greeting", text: $greeting)
                        TextField("Description", text: $description)
                    }
                    
                    Section(header: Text("Hobbies")) {
                        TextField("Enter your hobbies, separated by commas", text: $hobbies)
                    }
                    
                    Section(header: Text("Occupation")) {
                        TextField("Enter your occupation", text: $occupation)
                    }
                    
                    Section(header: Text("Age")) {
                        TextField("Enter your age", text: $age)
                    }
                    
                    Section(header: Text("Location")) {
                        TextField("Enter your location", text: $location)
                    }
                    
                    Section(header: Text("Favorite Cuisines")) {
                        TextField("Enter your favorite cuisines, separated by commas", text: $favoriteCuisines)
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
                                .background(Color.blue)
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
            .navigationBarTitle("Edit Profile")
        }
    }
    
    private func savePersonalInfo() {
        guard let userId = Auth.auth().currentUser?.uid else {
            print("User not authenticated")
            return
        }
        
        let personalInfo: [String: Any] = [
            "username": username,
            "greeting": greeting,
            "description": description,
            "hobbies": hobbies.split(separator: ",").map { $0.trimmingCharacters(in: .whitespacesAndNewlines) },
            "occupation": occupation,
            "age": age,
            "location": location,
            "favoriteCuisines": favoriteCuisines
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
        PersonalInfoView(
            showHomeView: .constant(false), username: .constant(""),
            greeting: .constant(""),
            description: .constant("")
        )
    }
}
