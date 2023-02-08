//
//  WodListRow.swift
//  SportApp
//
//  Created by Agostino Careddu on 03/02/23.
//

import SwiftUI

struct WodListRow: View {
    var exerciseType: String
    
    var body: some View {
        HStack(spacing: 5) {
            Text("\(exerciseType)")
        }
    }
}

struct WodListRow_Previews: PreviewProvider {
    static var previews: some View {
        WodListRow(
            exerciseType: "WodExercise"
        )
    }
}
