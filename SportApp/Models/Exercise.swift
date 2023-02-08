//
//  Exercise.swift
//  SportApp
//
//  Created by Agostino Careddu on 04/11/22.
//

import Foundation
import SwiftUI

enum Exercise: String {
    case benchPress
    case squat
    case weightedPushUp
    
    var image: Image {
        switch self {
        case .benchPress:
            return Image("BenchPress")
        case .squat:
            return Image("Squats")
        case .weightedPushUp:
            return Image("Pushups")
        }
    }
}
