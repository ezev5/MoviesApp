//
//  MovieView.swift
//  MoviesApp
//
//  Created by Ezequiel Nicolas Velez on 18/09/2024.
//

import SwiftUI

struct MoviePosterView: View {
  var posterPath: String
  
  var body: some View {
    AsyncImage(
      url: URL(
        string: Constants.DataSource.imageBaseURL + posterPath
      )
    ) { image in
      image.resizable()
    } placeholder: {
      Image(systemName: "photo")
    }
    .scaledToFill()
    .frame(height: 210)
    .clipShape(RoundedRectangle(cornerRadius: 25))
    .shadow(color: .black.opacity(0.2), radius: 2)
    .frame(width: 144)
    .padding(4)
  }
}

#Preview {
  MoviePosterView(posterPath: "/8cdWjvZQUExUUTzyp4t6EDMubfO.jpg")
}
