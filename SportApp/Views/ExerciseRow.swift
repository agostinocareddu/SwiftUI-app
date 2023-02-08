//
//  ExerciseRow.swift
//  SportApp
//
//  Created by Agostino Careddu on 25/10/22.
//

import SwiftUI

struct ExerciseRow: View {
    let exercise: Exercise
    let iconColor: Color
    var onTapAction: () -> Void

    var body: some View {
        Button {
            onTapAction()
        } label: {
            HStack(spacing: 10) {
                exercise.image
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 16, height: 16)
                    .foregroundColor(iconColor)

                Text(exercise.rawValue.capitalized)
                    .font(.headline)
            }
        }
    }
}

struct ExerciseRow_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseRow(exercise: .benchPress, iconColor: .blue, onTapAction: {})
    }
}
