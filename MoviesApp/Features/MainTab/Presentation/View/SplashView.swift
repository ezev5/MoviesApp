//
//  SplashView.swift
//  MoviesApp
//
//  Created by Ezequiel Nicolas Velez on 18/09/2024.
//

import SwiftUI

struct SplashView: View {
  var body: some View {
    ZStack {
      Color.theme.backgroundColor.ignoresSafeArea()
      Image("popcorn", bundle: .main)
    }
  }
}

#Preview {
  SplashView()
}
