//
//  RegisterView.swift
//  CookBook
//
//  Created by Ritesh jung lama on 22/11/2025.
//

import SwiftUI

struct RegisterView: View {
    @State var registerViewModel: RegisterViewModel = RegisterViewModel();
    @Environment(\.dismiss) var dismiss;

    var body: some View {
        VStack(alignment: .leading){
            Text("Username")
                .font(.system(size: 15))
            TextField("Username", text: $registerViewModel.username)
                .textFieldStyle(AuthTextFieldStyle())
            Text("Email")
                .font(.system(size: 15))
            TextField("Email", text: $registerViewModel.email)
                .textFieldStyle(AuthTextFieldStyle())
            Text("Password")
                .font(.system(size: 15))
            PasswordTextField(password: $registerViewModel.password, showPassword: $registerViewModel.showPassword)
            Button {
                
            } label: {
                Text("Create Account")
                    .font(.system(size: 15, weight: .bold))
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity,maxHeight: 44)
                    .background(.green)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                
            }
            
            HStack{
                Spacer()
                Text("Already have an account?")
                Button("Login"){
                    dismiss()
                }
                Spacer()
            }.padding(.top,16)
        }
        .padding(.horizontal,16)
    }
}

#Preview {
    RegisterView()
}
