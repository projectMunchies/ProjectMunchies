//
//  SignUpView.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 7/30/23.
//

import SwiftUI
import Firebase

struct SignUpView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        GeometryReader{ geoReader in
            ZStack{
                Color.white
                    .ignoresSafeArea()
                
                ZStack{
                    Image("SignInLogo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: geoReader.size.height * 0.5, height: geoReader.size.height * 0.5)
                        .position(x: geoReader.frame(in: .local).midX, y:geoReader.size.height * 0.24)
                    
                    VStack{
                        Text("Email:")
                            .font(.system(size: 15))
                            .foregroundColor(.black)
                            .padding(.trailing,geoReader.size.width * 0.8)
                            .opacity(0.6)
                        
                        TextField("Email", text: $email)
                            .frame(width: 360, height: 60)
                            .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                            .background(Color(red: 0.949, green: 0.949, blue: 0.97))
                            .foregroundColor(.black)
                            .cornerRadius(30)
                         
                        Text("Password:")
                            .font(.system(size: 15))
                            .foregroundColor(.black)
                            .padding(.trailing,geoReader.size.width * 0.75)
                            .opacity(0.6)
                        
                        TextField("Password", text: $password)
                            .frame(width: 360, height: 60)
                            .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                            .background(Color(red: 0.949, green: 0.949, blue: 0.97))
                            .foregroundColor(.black)
                            .cornerRadius(30)
                        
                        Button(action: {
                            signUp()
                        }) {
                            Text("Sign Up")
                                .frame(width: 380, height: 60)
                                .background(Color.gray)
                                .cornerRadius(40)
                                .foregroundColor(.white)
                        }
                        .padding()
                        
                        Text("Already have an account?")
                            .foregroundColor(.black)
                        
                        NavigationLink(destination: SignInView()){
                            Text("sign in here")
                                .foregroundColor(.blue)
                                .font(.system(size: 20))
                        }
                    }
                    .position(x: geoReader.frame(in: .local).midX , y:geoReader.size.height * 0.6)
                }
                .position(x: geoReader.frame(in: .local).midX , y: geoReader.frame(in: .local).midY )
            }
            .navigationBarBackButtonHidden(true)
        }
    }
    
    private func signUp(){
        Auth.auth().createUser(withEmail: email, password: password){ (result,error) in
            if error != nil {
                print(error?.localizedDescription ?? "")
            }else{
                print("successfully signed up")
            }
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}


