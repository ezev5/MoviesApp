//
//  MovieView.swift
//  MoviesApp
//
//  Created by Ezequiel Nicolas Velez on 18/09/2024.
//

import SwiftUI

struct MoviePosterView: View {
  var posterPath: String?
  
  var body: some View {
    if let posterPath = posterPath {
      AsyncImage(
        url: URL(
          string: Constants.DataSource.imageBaseURL + posterPath
        )
      ) { image in
        image.resizable()
      } placeholder: {
        ProgressView()
          .tint(Color.theme.accent)
      }
      .scaledToFill()
      .clipShape(RoundedRectangle(cornerRadius: 25))
      .shadow(color: .black.opacity(0.2), radius: 2)
      .padding(4)
    } else {
      Image(systemName: "photo")
        .foregroundStyle(Color.theme.secondaryColor)
    }
  }
}

/*
#Preview {
  MoviePosterView(posterPath: "/8cdWjvZQUExUUTzyp4t6EDMubfO.jpg")
}
*/
