//
//  LoginViewModel.swift
//  CookBook
//
//  Created by Ritesh jung lama on 22/11/2025.
//

import Foundation


@Observable
class LoginViewModel {
    var showRegistrationView: Bool = false
    var email:String = "";
    var password:String = "";
    var showPassword = false;
    
    
    func toggleRegistrationView() {
        showRegistrationView.toggle()
    }
    
}
