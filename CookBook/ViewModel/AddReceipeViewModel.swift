//
//  AddReceipeViewModel.swift
//  CookBook
//
//  Created by Ritesh jung lama on 26/11/2025.
//



import Foundation


@MainActor
@Observable
class AddReceipeViewModel {
    var receipeName: String = ""
    var preparationTime: Int = 0
    var cookingInstruction : String = ""
}
