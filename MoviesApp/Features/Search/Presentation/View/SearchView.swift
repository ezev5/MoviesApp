//
//  SearchView.swift
//  MoviesApp
//
//  Created by Ezequiel Nicolas Velez on 20/09/2024.
//

import SwiftUI

struct SearchView<ViewModel: SearchViewModelProtocol>: View {
  @StateObject var viewModel: ViewModel
  
    var body: some View {
      NavigationStack {
        ZStack {
          Color.theme.backgroundColor.ignoresSafeArea()
          VStack {
            SearchBarView(searchInput: $viewModel.searchInput)
              .focusOnAppear()
              .padding()
            if viewModel.movies.isEmpty {
              EmptySearchView()
                .padding(.top, 50)
            } else {
              MovieListView(movies: viewModel.movies)
            }
            Spacer(minLength: 0)
          }
        }
        .toolbar {
          ToolbarItem(placement: .principal) {
            Text("Search")
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
    }
}

/*
#Preview {
  SearchViewWireframe.getView()
}
*/
