//
//  HomeViewModel.swift
//  SportApp
//
//  Created by Agostino Careddu on 04/11/22.
//

import Foundation
import SwiftUI

@MainActor
class HomeViewModel: ObservableObject {
    
    let exercises: [Exercise]
    
    init(
        exercises: [Exercise]
    ) {
        self.exercises = [.benchPress, .squat, .weightedPushUp]
    }
    
    @Published var isUserProfessional: Bool = false
    @Published var isDetailSheetPresented: Bool = false
    @Published var isSettingsPresented: Bool = false
    @Published var backgroundColor: Color = .blue
    
    @Published var title: String = ""
    var sheetTitle: String = ""
    var workOutListTitle: String = "My workout of the day:"
    
    var wodList: [String] = []
    
    func addWodToList(item: String) {
        wodList.append(item)
    }
    
    func delete(at offsets: IndexSet) {
        wodList.remove(atOffsets: offsets)
    }
}
