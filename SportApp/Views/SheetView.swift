//
//  SheetView.swift
//  SportApp
//
//  Created by Agostino Careddu on 11/11/22.
//

import SwiftUI

struct SheetView: View {
    @Binding var showModal: Bool
    var title: String
    let onSetAction: (String) -> Void
    let exerciseProgram: String = "Choose the weight to put on"
    @State private var weight: Float = 0.0
    
    var body: some View {
        NavigationView {
            VStack {
                Divider()
                
                Text(exerciseProgram)
                    .font(.title)
                    .padding(.top, 45)
                    .navigationTitle(title.capitalized)
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            closeButton
                        }
                    }
                
                Slider(value: $weight, in: 1...100)
                    .padding()
                
                Text("KG: \(Int(weight))")
                    .font(.title)
                    .padding(.bottom, 75)
                
                Button {
                    onSetAction("\(title.capitalized) with:     \(Int(weight)) Kg")
                    showModal.toggle()
                } label: {
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: 100, height: 70)
                    
                        .overlay {
                            Text("Add")
                                .font(Font.title.bold())
                                .foregroundColor(.white)
                        }
                }

                
                Spacer()
            }
           
        }
    }
    
    private var closeButton: some View {
        Button {
            showModal.toggle()
        } label: {
            Text("Close")
                .foregroundColor(.accentColor)
        }
    }
}

struct SheetView_Previews: PreviewProvider {
    static var previews: some View {
        SheetView(
            showModal: .constant(true),
            title: "benchPress"
        ) {_ in }
    }
}
