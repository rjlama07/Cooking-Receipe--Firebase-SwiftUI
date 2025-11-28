//
//  RegisterViewController.swift
//  CookBook
//
//  Created by Ritesh jung lama on 22/11/2025.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore


@Observable
class RegisterViewModel {
     var email: String = ""
     var password: String = ""
     var username: String = ""
     var showPassword = false
     var isLoading: Bool = false
     var errorMessage: String?
     var showErrorMessage: Bool = false
    
    
    func signIn()  async ->AppUser? {
        ///validating username
        guard validateUserName() else {
            errorMessage =  "Please enter a valid username"
            showErrorMessage = true
            return nil;
        }
        isLoading = true
        /// checking if the username is unique
        guard  let userDocument =  try? await  Firestore.firestore().collection("users").whereField("username", isEqualTo: username).getDocuments() else{
            errorMessage = "Something went wrong"
            showErrorMessage = true
            isLoading = false
            return nil
        }
        
        guard userDocument.documents.count == 0 else {
            errorMessage = "Username already taken"
            showErrorMessage = true
            isLoading = false
            return nil
        }
        
        
        
        //registering users if everthing goes right
        do{
          
            let result = try await Auth.auth().createUser(withEmail: email, password: password);
            let id = result.user.uid
            let user: AppUser = AppUser(username: username, email: email, id: id);
            try Firestore.firestore().collection("users").document(id).setData(from: user)
            isLoading = false
            return user;
        }
        catch {
            let authErrorCode = AuthErrorCode(rawValue: error._code)
          
            if let authErrorCode = authErrorCode {
                switch authErrorCode {
                case .emailAlreadyInUse:
                    errorMessage = "Email already in use"
                    
                case .weakPassword:
                    errorMessage = "Password must be at least 6 characters long"
                    
                case .wrongPassword:
                    errorMessage = "Invalid password"
                
                default:
                    break;
                    
                }
            }
            else{
                errorMessage = "An unknown error occurred"
            }
            isLoading = false
            showErrorMessage = true;
            print(error.localizedDescription)
            return nil;
      
        }
    }
    
    func validateUserName() -> Bool{
        return username.count >= 3 && username.count<25
    }
    
}
