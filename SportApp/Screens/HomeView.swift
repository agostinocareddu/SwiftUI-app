//
//  HomeView.swift
//  SportApp
//
//  Created by Agostino Careddu on 25/10/22.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            
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
                .opacity(viewModel.wodList.isEmpty ? 0 : 1)
                
                Spacer()
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
        .sheet(isPresented: $viewModel.isDetailSheetPresented) {
            SheetView(
                showModal: $viewModel.isDetailSheetPresented,
                title: viewModel.title,
                exerciseProgram: "Choose the weight to put on"
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
            Text(viewModel.exercisesListTitle)
                .font(.headline)
                .padding()
            
            ForEach(viewModel.exercises, id: \.self) { exercise in
                ExerciseRow(
                    exercise: exercise,
                    iconColor: .yellow,
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
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(
            viewModel: HomeViewModel(exercises: [])
        )
    }
}

