//
//  AuthManager.swift
//  CookBook
//
//  Created by Ritesh jung lama on 26/11/2025.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

enum AuthStatus{
    case unAuthenticated, authenticated, loading
}


@MainActor
class AuthManager: ObservableObject {
    
 @Published var authStatus: AuthStatus = .loading
    @Published var user: AppUser?
    
    func authenticateUser(user: AppUser){
        self.user = user
        authStatus = .authenticated
   }
  func logoutUser(){
      
        authStatus = .unAuthenticated
      do{
        try  Auth.auth().signOut()
      }
      catch{}
  }
    
    
    init() {
      let firebaseUser = Auth.auth().currentUser
        if let firebaseUser = firebaseUser {
            Task {
                do {
                    try await initFirebaseUser(id: firebaseUser.uid)
                    self.authStatus = .authenticated
                } catch {
                    print("❌ Failed to load user: \(error)")
                    self.authStatus = .unAuthenticated
                }
            }
        }
        else{
            authStatus = .unAuthenticated
        }
    }
    
    func initFirebaseUser(id: String) async throws{
     
        let user = try?  await Firestore.firestore().collection("users").document(id).getDocument(as: AppUser.self)
        self.user = user
        
        
    }
}
