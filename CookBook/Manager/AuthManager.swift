//
//  AuthManager.swift
//  CookBook
//
//  Created by Ritesh jung lama on 26/11/2025.
//

import Foundation

enum AuthStatus{
    case unAuthenticated, authenticated
}


@MainActor
class AuthManager: ObservableObject {
    
 @Published var authStatus: AuthStatus = .unAuthenticated
    
  func authenticateUser(){
        authStatus = .authenticated
   }
  func logoutUser(){
        authStatus = .unAuthenticated
  }
}
