//
//  AddReceipeView.swift
//  CookBook
//
//  Created by Ritesh jung lama on 26/11/2025.
//

import SwiftUI

struct AddReceipeView: View {
    @State var viewModel: AddReceipeViewModel = AddReceipeViewModel();
    var body: some View {
        VStack(alignment: .leading){
            Text("What's New").font(.system(size: 28,weight: .bold)).padding(.vertical, 20)
            ZStack{
                RoundedRectangle(cornerRadius: 18).fill(Color.primaryFormEntry).frame(height: 200)
                Image(systemName: "photo.fill")
            }
            Text("Receipe Name")
                .font(.system(size: 15, weight: .semibold))
                .padding(.top,16)
            TextField("Enter receipe name",text: $viewModel.receipeName)
                .textFieldStyle(CapsuleTextFieldStyle())
            Text("Preparation Time")
                .font(.system(size: 15, weight: .semibold))
                .padding(.top,16)
            Picker("Select Time", selection: $viewModel.preparationTime) {
                ForEach(0...120, id: \.self) {
                    if($0 % 5 == 0)
                    {
                        Text("\($0) mins").tag($0)
                    }
                }
            }
            Text("Cooking Instruction Time")
                .font(.system(size: 15, weight: .semibold))
                .padding(.top,16)
            TextEditor(text: $viewModel.cookingInstruction)
                .padding(.horizontal,4)
                .frame(height: 150)
                .background(Color.primaryFormEntry).scrollContentBackground(.hidden).clipShape(RoundedRectangle(cornerRadius: 10))
            Button {
                print("dsads")
            } label: {
                Text("Add Receipe")
            }.buttonStyle(PrimaryButtonStyle())
                .padding(.top,24)

            
            Spacer()
            
        }.padding(.horizontal,16)
    }
}

#Preview {
    AddReceipeView()
}
