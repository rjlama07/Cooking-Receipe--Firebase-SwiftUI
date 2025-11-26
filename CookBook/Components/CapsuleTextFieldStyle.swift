//
//  CapsuleTextFIeldStyle.swift
//  CookBook
//
//  Created by Ritesh jung lama on 26/11/2025.
//




import SwiftUI


struct CapsuleTextFieldStyle: TextFieldStyle{
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding()
            .background(Capsule().fill(Color.primaryFormEntry))
        
    }
}
