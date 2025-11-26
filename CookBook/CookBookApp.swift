//
//  CookBookApp.swift
//  CookBook
//
//

import SwiftUI

@main
struct CookBookApp: App {
    @StateObject var authManager: AuthManager = AuthManager()
    var body: some Scene {
        WindowGroup {
            switch authManager.authStatus {
                case .unAuthenticated:
                LoginView().environmentObject(authManager)
                case .authenticated:
                HomeView().environmentObject(authManager)
            }
        }
    }
}
