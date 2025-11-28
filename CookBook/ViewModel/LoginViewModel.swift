//
//  LoginViewModel.swift
//  CookBook
//
//  Created by Ritesh jung lama on 22/11/2025.
//

import Foundation
import FirebaseAuth

@Observable
class LoginViewModel {
    var showRegistrationView: Bool = false
    var email:String = "";
    var password:String = "";
    var showPassword = false;
    var showErrorMessage: Bool = false;
    var errorMessage: String = "";
    var isLoading = false;
    
    
    func toggleRegistrationView() {
        showRegistrationView.toggle()
    }
    
    
    func logIn() async -> AppUser?{
        isLoading = true;
        do{
            let user = try await Auth.auth().signIn(withEmail: email, password: password);
            let appUser = await Userservices.getUser(id: user.user.uid)
            isLoading = false;
            return appUser
            
        }
        catch {
            
            errorMessage = "Something went wrong"
            if let result =   AuthErrorCode(rawValue: error._code){
                switch result {
                case .invalidCredential:
                    errorMessage = "Invalid email or password"
                default:
                    break
                    
                }
            }
            showErrorMessage = true
            isLoading = false;
            return nil;
        }
      
        
    }
}
