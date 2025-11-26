//
//  LoginView.swift
//  CookBook
//
//  Created by Ritesh jung lama on 22/11/2025.
//

import SwiftUI

struct LoginView: View {
  
    @State var loginViewModel:LoginViewModel = LoginViewModel()
    @EnvironmentObject var authManager: AuthManager
    var body: some View {
        VStack(alignment: .leading, content: {
            Text("Email")
                .font(.system(size: 15))
            TextField("Email", text: $loginViewModel.email)
                .textFieldStyle(AuthTextFieldStyle())
            Text("Password")
                .font(.system(size: 15))
            PasswordTextField(password: $loginViewModel.password, showPassword: $loginViewModel.showPassword)
            Button {
                authManager.authenticateUser()
            } label: {
                Text("Login")
            }.buttonStyle(PrimaryButtonStyle())
            
            HStack{
                Spacer()
                Text("Don't have an account?")
                Button("Register"){
                    loginViewModel.toggleRegistrationView()
                }
                Spacer()
            }.padding(.top,16)

        })
        .padding(.horizontal,16)
        .fullScreenCover(isPresented: $loginViewModel.showRegistrationView) {
            RegisterView()
        }
    }
}

#Preview {
    LoginView().environmentObject(AuthManager())
}

