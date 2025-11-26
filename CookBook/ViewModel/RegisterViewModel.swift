//
//  RegisterViewController.swift
//  CookBook
//
//  Created by Ritesh jung lama on 22/11/2025.
//

import Foundation

@MainActor
class RegisterViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var username: String = ""
    @Published var showPassword = false
    
    
}
