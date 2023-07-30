//
//  SignInView.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 7/30/23.
//

import SwiftUI
import Firebase


struct SignInView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        ZStack{
            Color.white
                .ignoresSafeArea()
            
            VStack{
                Text("CrunchBunch")
                    .bold()
                    .font(.system(size: 40))
                    .foregroundColor(.black)
                
                            Text("Never Eat alone again")
                                .font(.system(size: 15))
                                .foregroundColor(.black)
            
                
                TextField("Email", text: $email)
                    .frame(width: 360, height: 60)
                    .background(Color(red: 0.949, green: 0.949, blue: 0.97))
                    .cornerRadius(30)
                    .foregroundColor(.black)
                 
                TextField("Password", text: $password)
                    .frame(width: 360, height: 60)
                    .background(Color(red: 0.949, green: 0.949, blue: 0.97))
                    .cornerRadius(30)
                    .foregroundColor(.black)
                
                Button(action: {
                    login()
                }) {
                    Text("Sign In")
                        .frame(width: 400, height: 60)
                        .background(Color.gray)
                        .cornerRadius(40)
                        .foregroundColor(.white)
                }
                .padding()
                
                Text("Don't have an account?")
                    .foregroundColor(.black)
                
                NavigationLink(destination: SignUpView()){
                    Text("sign up here")
                        .foregroundColor(.blue)
                        .font(.system(size: 20))
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
   private func login(){
        Auth.auth().signIn(withEmail: email, password: password){ (result,error) in
            if error != nil {
                print(error?.localizedDescription ?? "")
            }else{
                print("success")
            }
            
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
