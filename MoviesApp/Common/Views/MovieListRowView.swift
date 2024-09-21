//
//  WatchListRowView.swift
//  MoviesApp
//
//  Created by Ezequiel Nicolas Velez on 20/09/2024.
//

import SwiftUI

struct movieListRowView: View {
  var movie: Movie
  
    var body: some View {
      HStack {
        MoviePosterView(posterPath: movie.posterPath)
          //.frame(width: 100, height: 150)
          //.fixedSize(horizontal: false, vertical: true)
          .frame(maxWidth: 120, maxHeight: 150)
        VStack(alignment: .leading, spacing: 10) {
          Text(movie.title)
            .font(.title3)
            .fontWeight(.bold)
            .foregroundStyle(Color.theme.primaryColor)
          Label(String(format: "%.1f", movie.voteAverage), systemImage: "star")
            .foregroundStyle(Color.theme.ratingColor)
          Label("Action", systemImage: "ticket")
            .foregroundStyle(Color.theme.secondaryColor)
          Label(movie.releaseDate, systemImage: "calendar")
            .foregroundStyle(Color.theme.secondaryColor)
          //TODO: replace this harcoded
          Label("148 Minutes", systemImage: "clock")
            .foregroundStyle(Color.theme.secondaryColor)
        }
      }
      .frame(maxWidth: .infinity, alignment: .topLeading)
      .background(Color.theme.backgroundColor)
    }
}

#Preview {
  movieListRowView(movie: Movie(
    id: 365177,
    overview: "Returning to her home planet, an infamous bounty hunter forms an unexpected alliance with a team of unlikely heroes. Together, they battle monsters and dangerous bandits to protect a young girl who holds the key to unimaginable power.",
    releaseDate: "2024-08-07",
    title: "Deadpool & Wolverine",
    backdropPath: "/mKOBdgaEFguADkJhfFslY7TYxIh.jpg",
    posterPath: "/865DntZzOdX6rLMd405R0nFkLmL.jpg",
    voteAverage: 10,
    genreIds: [28,878,35,12,53]
  ))
  .background(Color.theme.backgroundColor)
}
