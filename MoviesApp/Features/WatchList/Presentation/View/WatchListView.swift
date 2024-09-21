//
//  WatchListView.swift
//  MoviesApp
//
//  Created by Ezequiel Nicolas Velez on 20/09/2024.
//

import SwiftUI

struct WatchListView<ViewModel: WatchListViewModelProtocol>: View {
  @StateObject var viewModel: ViewModel
  
  var body: some View {
    NavigationStack {
      ZStack {
        if viewModel.movies.isEmpty {
          EmptyWatchListView()
        } else {
          MovieListView(movies: viewModel.movies)
        }
      }
      .toolbar {
        ToolbarItem(placement: .principal) {
          Text("Watch List")
            .font(.title2)
            .foregroundColor(Color.theme.primaryColor)
        }
      }
      .navigationBarTitleDisplayMode(.inline)
      .toolbarBackground(Color.theme.backgroundColor, for: .navigationBar)
      .toolbarBackground(.visible, for: .navigationBar)
      .navigationDestination(for: Movie.self) { movie in
        DetailWireframe.getView(movie: movie)
          .toolbarRole(.editor)
      }
    }
    .onAppear {
      viewModel.loadMovies()
    }
  }
}

/*
#Preview {
  WatchListWireFrame.getView()
}
*/
