//
//  ColorExtension.swift
//  MoviesApp
//
//  Created by Ezequiel Nicolas Velez on 18/09/2024.
//

import SwiftUI

extension Color {
  static let theme: ColorTheme = ColorTheme()
}


struct ColorTheme {
  let accent: Color = Color("AccentColor")
  let backgroundColor: Color = Color("BackgroundColor")
  let backgroundSecondaryColor: Color = Color("BackgroundSecondaryColor")
  let primaryColor: Color = Color("PrimaryColor")
  let secondaryColor: Color = Color("SecondaryColor")
  let ratingColor: Color = Color("RatingColor")
}
