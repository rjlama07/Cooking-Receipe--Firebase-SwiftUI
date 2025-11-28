//
//  HomeView.swift
//  CookBook
//

import SwiftUI

struct HomeView: View {
   @State private var viewModel = HomeViewModel()
    @EnvironmentObject var authManager: AuthManager
    var body: some View {
        NavigationStack {
            VStack{
                Text( "Welcome " + (authManager.user?.username ?? "Unknown"))
                Spacer()
                Button {
                    viewModel.showAddReceipe.toggle()
                } label: {
                    Text("Add Receipe")
                }
                .buttonStyle(PrimaryButtonStyle())

                
            }
            .padding(.horizontal,16)
            .toolbar {
                ToolbarItem {
                    Button {
                        viewModel.showLogoutAlert.toggle()
                    } label: {
                        Image(systemName: "gear")
                    }.foregroundStyle(.red)

                }
            }
            .alert("Are you sure", isPresented: $viewModel.showLogoutAlert) {
                Button("Logout", role: .destructive) {
                    authManager.logoutUser()
                }
                Button("Cancel", role: .cancel) {
               
                }
            }
            .sheet(isPresented: $viewModel.showAddReceipe) {
                AddReceipeView()
            }
        }
    }
    
}

#Preview {
    HomeView().environmentObject(AuthManager())
}


