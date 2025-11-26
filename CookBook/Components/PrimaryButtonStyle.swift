//
//  PrimaryButtonStyle.swift
//  CookBook
//
//  Created by Ritesh jung lama on 26/11/2025.
//



import SwiftUI


struct PrimaryButtonStyle: ButtonStyle {
   
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .font(.system(size: 15, weight: .bold))
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity,maxHeight: 44)
            .background(.green)
            .clipShape(RoundedRectangle(cornerRadius: 12))
    }
    
    
}
