//
//  EmptySearchView.swift
//  MoviesApp
//
//  Created by Ezequiel Nicolas Velez on 20/09/2024.
//

import SwiftUI

struct EmptySearchView: View {
  var body: some View {
    ZStack {
      VStack {
        Image("noResult", bundle: .main)
        Text("We Are Sorry, We Can Not Find The Movie :(")
          .font(.title3)
          .fontWeight(.bold)
          .foregroundStyle(Color.theme.primaryColor)
          .multilineTextAlignment(.center)
          .padding(.top, 10)
        Text("Find your movie by Type title.")
          .foregroundStyle(Color.theme.secondaryColor)
          .multilineTextAlignment(.center)
          .padding(.top, 10)
      }
    }
  }
}

/*
 #Preview {
 EmptySearchView()
 }
 */
