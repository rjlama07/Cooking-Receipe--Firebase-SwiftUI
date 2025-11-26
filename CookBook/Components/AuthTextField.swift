//
//  AuthTextField.swift
//  CookBook
//
//  Created by Ritesh jung lama on 22/11/2025.
//


import SwiftUI




struct AuthTextFieldStyle: TextFieldStyle{
    func _body(configuration: TextField<Self._Label>) -> some View {
        VStack {
            configuration
                .textInputAutocapitalization(.never)
                .keyboardType(.emailAddress)
            Rectangle()
                .fill(.border)
                .frame(height: 1)
                .padding(.bottom,12)
            
        }
    }
    
}
