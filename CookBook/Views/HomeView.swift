//
//  HomeView.swift
//  CookBook
//

import SwiftUI

struct HomeView: View {
    @State var showLogoutAlert: Bool = false
    @EnvironmentObject var authManager: AuthManager
    var body: some View {
        NavigationStack {
            VStack{
                
            }.toolbar {
                ToolbarItem {
                    Button {
                        showLogoutAlert.toggle()
                    } label: {
                        Image(systemName: "gear")
                    }.foregroundStyle(.red)

                }
            }
            .alert("Are you sure", isPresented: $showLogoutAlert) {
                Button("Logout", role: .destructive) {
                    authManager.logoutUser()
                }
                Button("Cancel", role: .cancel) {
               
                }
            }
        }
    }
    
}

#Preview {
    HomeView().environmentObject(AuthManager())
}


