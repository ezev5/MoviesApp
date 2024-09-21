//
//  MovieListView.swift
//  MoviesApp
//
//  Created by Ezequiel Nicolas Velez on 20/09/2024.
//

import SwiftUI

struct MovieListView: View {
  var movies: [Movie]
  
  var body: some View {
    List(movies, id: \.id) { movie in
      NavigationLink(value: movie) {
        MovieListRowView(movie: movie)
      }
      .frame(maxWidth: .infinity, alignment: .leading)
      .listRowBackground(Color.theme.backgroundColor)
      .listRowSeparator(.hidden)
    }
    .listStyle(.plain)
    .background(Color.theme.backgroundColor)
    .scrollContentBackground(.hidden)
  }
}
