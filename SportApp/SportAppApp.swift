//
//  SportAppApp.swift
//  SportApp
//
//  Created by Agostino Careddu on 25/10/22.
//

import SwiftUI

@main
struct SportAppApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView(
                viewModel: HomeViewModel(exercises: [Exercise]())
            )
        }
    }
}
