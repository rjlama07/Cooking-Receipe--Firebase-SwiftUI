//
//  AddReceipeViewModel.swift
//  CookBook
//
//  Created by Ritesh jung lama on 26/11/2025.
//



import Foundation

@Observable
class AddReceipeViewModel {
    var receipeName: String = ""
    var preparationTime: Int = 0
    var cookingInstruction : String = ""
    var showImagePickerDialog: Bool = false
}
