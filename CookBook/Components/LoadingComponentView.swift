//
//  LoadingComponentView.swift
//  CookBook
//
//  Created by Ritesh jung lama on 28/11/2025.
//

import SwiftUI

struct LoadingComponentView: View {
    var body: some View {
        ZStack{
            Color.black.opacity(0.4)
            ProgressView().tint(.white)
        }.ignoresSafeArea()
    }
}

#Preview {
    LoadingComponentView()
}
