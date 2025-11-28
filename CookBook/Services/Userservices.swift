//
//  Userservices.swift
//  CookBook
//
//  Created by Ritesh jung lama on 28/11/2025.
//


import FirebaseFirestore
struct Userservices{
    
   static func getUser(id: String) async -> AppUser? {
        do {
            let user = try  await Firestore.firestore().collection("users").document(id).getDocument(as: AppUser.self)
            return user
        }
        catch{
            return nil
        }
    }
}
