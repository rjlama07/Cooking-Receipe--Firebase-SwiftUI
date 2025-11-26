//
//  LoginView.swift
//  CookBook
//
//  Created by Ritesh jung lama on 22/11/2025.
//

import SwiftUI

struct LoginView: View {
  
    @StateObject var loginViewModel:LoginViewModel = LoginViewModel()
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
                    .font(.system(size: 15, weight: .bold))
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity,maxHeight: 44)
                    .background(.green)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                
            }
            
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

