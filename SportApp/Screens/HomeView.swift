//
//  HomeView.swift
//  SportApp
//
//  Created by Agostino Careddu on 25/10/22.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel
    
    private var textColor: Color {
        viewModel.isUserProfessional ? .yellow : .black
    }
    
    var body: some View {
        VStack {
            
            toggleSwitch
            
            Spacer()
            
            exercisesList
            
            VStack {
                Text(viewModel.workOutListTitle)
                    .font(.headline)
                    .padding()
                
                List {
                    ForEach(viewModel.wodList, id: \.self) { item in
                        WodListRow(
                            exerciseType: item
                        )
                    }
                    .onDelete(perform: delete)
                }
            }
            .background(viewModel.backgroundColor)
            .opacity(0.8)
            .scrollContentBackground(.hidden)
            
            Button {
                viewModel.isSettingsPresented = true
            } label: {
                Image(systemName: "gearshape.2")
                    .imageScale(.large)
                    .foregroundColor(Color.black)
            }
        }
        .ignoresSafeArea()
        .padding()
        .overlay {
            
        }
        .sheet(isPresented: $viewModel.isDetailSheetPresented) {
            SheetView(
                showModal: $viewModel.isDetailSheetPresented,
                title: viewModel.title,
                exerciseProgram: viewModel.isUserProfessional ? "Professional Movements" : "Basic Movements"
            ) { exercise in
                viewModel.addWodToList(item: exercise)
            }
        }
        .actionSheet(isPresented: $viewModel.isSettingsPresented) {
            ActionSheet(title: Text("Select a background"),
                        buttons: [
                            .default(Text("Red")) {
                                viewModel.backgroundColor = .red
                            },
                            .default(Text("Green")) {
                                viewModel.backgroundColor = .green
                            },
                            .default(Text("Blue")) {
                                viewModel.backgroundColor = .blue
                            },
                        ])
        }
    }
    
    func delete(at offsets: IndexSet) {
        viewModel.delete(at: offsets)
    }
    
    private var exercisesList: some View {
        List{
            ForEach(viewModel.exercises, id: \.self) { exercise in
                ExerciseRow(
                    exercise: exercise,
                    iconColor: textColor,
                    onTapAction: {
                        viewModel.isDetailSheetPresented.toggle()
                        viewModel.title = exercise.rawValue
                    }
                )
            }
        }
        .background(viewModel.backgroundColor)
        .opacity(0.8)
        .scrollContentBackground(.hidden)
    }
    
    private var toggleSwitch: some View {
        Button {
            viewModel.isUserProfessional.toggle()
        } label: {
            Toggle(viewModel.isUserProfessional ? "Pro" : "Amateur", isOn: $viewModel.isUserProfessional)
                .font(.headline)
                .foregroundColor(textColor)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(
            viewModel: HomeViewModel(exercises: [])
        )
    }
}

