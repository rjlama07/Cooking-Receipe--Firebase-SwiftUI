//
//  PasswordTextField.swift
//  CookBook
//
//  Created by Ritesh jung lama on 22/11/2025.
//


import SwiftUI

struct PasswordTextField: View {
    @Binding var password: String
    @Binding var showPassword: Bool
    var body: some View {
       if(showPassword)
        {
           TextField("Password", text: $password)
               .textFieldStyle(AuthTextFieldStyle())
               .overlay(alignment: .trailing) {
                   Button {
                       showPassword.toggle()
                   } label: {
                       Image(systemName: "eye")
                   }
                   .padding(.bottom, 8)
                   
               }
               .foregroundStyle(.black)
       }
        else{
            VStack{
                SecureField("Password", text: $password)
                Rectangle()
                    .fill(.border)
                    .frame(height: 1)
                    .padding(.bottom,12)
            }
            .overlay(alignment: .trailing) {
                Button {
                    showPassword.toggle()
                    
                } label: {
                    Image(systemName: "eye.slash")
                }
                .padding(.bottom, 8)
                
                
            }
            .foregroundStyle(.black)
        }
        
        
    }
}


#Preview{
    PasswordTextField(password: .constant(""),showPassword: .constant(true))
        .padding()
}
