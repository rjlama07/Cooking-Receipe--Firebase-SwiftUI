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
        ZStack{
            VStack(alignment: .leading, content: {
                Text("Email")
                    .font(.system(size: 15))
                TextField("Email", text: $loginViewModel.email)
                    .textFieldStyle(AuthTextFieldStyle())
                Text("Password")
                    .font(.system(size: 15))
                PasswordTextField(password: $loginViewModel.password, showPassword: $loginViewModel.showPassword)
                Button {
                    Task {
                        if let user =  await loginViewModel.logIn(){
                            authManager.authenticateUser(user: user);
                        }
                    }
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
            .alert("Error", isPresented: $loginViewModel.showErrorMessage) {
                
            } message: {
                Text(loginViewModel.errorMessage)
            }
            if(loginViewModel.isLoading)
            {
                LoadingComponentView()
            }
        }



    }
}

#Preview {
    LoginView().environmentObject(AuthManager())
}

