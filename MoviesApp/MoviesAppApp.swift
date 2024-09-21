//
//  MoviesAppApp.swift
//  MoviesApp
//
//  Created by Ezequiel Nicolas Velez on 18/09/2024.
//

import SwiftUI

@main
struct MoviesAppApp: App {
    var body: some Scene {
        WindowGroup {
          MainTabView(viewModel: MainTabViewModel())
        }
    }
}
