//
//  HomeViewModel.swift
//  CookBook
//
//  Created by Ritesh jung lama on 26/11/2025.
//

import Foundation
@MainActor
class HomeViewModel: ObservableObject {
   @Published var showLogoutAlert: Bool = false
    @Published var showAddReceipe: Bool = false
}
