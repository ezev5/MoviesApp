//
//  HomeView.swift
//  MoviesApp
//
//  Created by Ezequiel Nicolas Velez on 18/09/2024.
//

import SwiftUI

struct HomeView<ViewModel: HomeViewModelProtocol>: View {
  @StateObject var viewModel: ViewModel
  
  var columns: [GridItem] = [
    GridItem(.adaptive(minimum: 100), spacing: 10),
    GridItem(.adaptive(minimum: 100), spacing: 10),
    GridItem(.adaptive(minimum: 100), spacing: 10)
  ]
  
  var body: some View {
    NavigationStack {
      ScrollView(.vertical) {
        VStack {
          SearchBarView(searchInput: $viewModel.searchInput)
            .padding(.top)
            .padding(.horizontal)
            .onTapGesture {
              viewModel.searchTapped()
            }
          PopularMoviesView(movies: $viewModel.popularsMovies)
          pickerView
          gridView
            .onChange(of: viewModel.selectedTab) {
              viewModel.tabChange()
            }
        }
      }
      .background {
        Color.theme.backgroundColor.ignoresSafeArea()
      }
      .navigationDestination(for: Movie.self) { movie in
        DetailWireframe.getView(movie: movie)
          .toolbarRole(.editor)
      }
      .toolbar {
        ToolbarItem(placement: .principal) {
          Text("What do you want to watch?")
            .font(.title2)
            .foregroundColor(Color.theme.primaryColor)
        }
      }
      .toolbarBackground(Color.theme.backgroundColor, for: .navigationBar)
      .toolbarBackground(.visible, for: .navigationBar)
      .navigationBarTitleDisplayMode(.inline)
    }
    .onAppear {
      UISegmentedControl.appearance().overrideUserInterfaceStyle = .dark
      UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(Color.theme.accent)
      viewModel.loadData()
    }
  }
  
  private var pickerView: some View {
    Picker("", selection: $viewModel.selectedTab) {
      Text("Now Playing")
        .tint(Color.theme.primaryColor)
        .tag(MovieTabs.nowPlaying)
      Text("Upcoming")
        .tint(Color.theme.primaryColor)
        .tag(MovieTabs.upcomingMovies)
      Text("Top Rated")
        .tint(Color.theme.primaryColor)
        .tag(MovieTabs.topRatedMovies)
    }
    .pickerStyle(SegmentedPickerStyle())
    .padding(16)
  }
  
  private var gridView: some View {
    LazyVGrid(columns: columns, content: {
      ForEach( viewModel.displayedMovies.prefix(6) ) { movie in
        NavigationLink(value: movie) {
          MoviePosterView(posterPath: movie.posterPath)
        }
      }
    })
    .padding(.horizontal, 24)
  }
}

/*
#Preview {
  NavigationStack {
    HomeWireframe.getView(activeTabIndex: .constant(.home))
  }
}
*/
