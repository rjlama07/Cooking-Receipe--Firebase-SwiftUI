//
//  CookBookApp.swift
//  CookBook
//
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        
        return true
    }
}



@main
struct CookBookApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var authManager: AuthManager = AuthManager()
    var body: some Scene {
        WindowGroup {
            switch authManager.authStatus {
                case .unAuthenticated:
                LoginView().environmentObject(authManager)
                case .authenticated:
                HomeView().environmentObject(authManager)
            case .loading:
                VStack{
                    ProgressView()
                }
            }
        }
    }
}
