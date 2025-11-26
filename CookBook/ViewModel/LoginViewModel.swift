//
//  LoginViewModel.swift
//  CookBook
//
//  Created by Ritesh jung lama on 22/11/2025.
//

import Foundation

@MainActor
class LoginViewModel: ObservableObject {
    @Published var showRegistrationView: Bool = false
    @Published var email:String = "";
    @Published var password:String = "";
    @Published var showPassword = false;
    
    
    func toggleRegistrationView() {
        showRegistrationView.toggle()
    }
    
}
