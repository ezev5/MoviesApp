//
//  ContentView.swift
//  MoviesApp
//
//  Created by Ezequiel Nicolas Velez on 18/09/2024.
//

import SwiftUI

struct MainTabView<ViewModel: MainTabViewModelProtocol>: View {
  @ObservedObject var viewModel: ViewModel
  @State var activeTabindex: Int = 0
  
  var body: some View {
    ZStack {
      if viewModel.isLoading {
        SplashView()
      } else {
        TabView(selection: $activeTabindex) {
          HomeView(nowPlayingMovies: getData(), upcomingMovies: [], TopRatedMovies: [])
            .tabItem {
              Label("Home", systemImage: "house")
            }
            .tag(0)
          Text("Second View")
            .padding()
            .tabItem {
              Label("Search", systemImage: "magnifyingglass")
            }
            .tag(1)
          Text("another View")
            .padding()
            .tabItem {
              Label("Watch list", systemImage: "bookmark")
            }
            .tag(2)
        }
      }
    }
    .onAppear {
      UITabBar.appearance().backgroundColor = UIColor( Color.theme.backgroundColor)
      UITabBar.appearance().barTintColor = UIColor( Color.theme.secondaryColor)
      //TODO move to VM and animate disappear
      DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
        withAnimation(.spring) {
          self.viewModel.isLoading = false
        }
      }
    }
  }
  
  func getData() -> [Movie] {
    [
      Movie(
        id: 365177,
        overview: "Returning to her home planet, an infamous bounty hunter forms an unexpected alliance with a team of unlikely heroes. Together, they battle monsters and dangerous bandits to protect a young girl who holds the key to unimaginable power.",
        releaseDate: "2024-08-07",
        title: "Borderlands",
        backdropPath: "/mKOBdgaEFguADkJhfFslY7TYxIh.jpg",
        posterPath: "/865DntZzOdX6rLMd405R0nFkLmL.jpg",
        genreIds: [28,878,35,12,53]
      ),
      Movie(
        id: 1022789,
        overview: "Teenager Riley's mind headquarters is undergoing a sudden demolition to make room for something entirely unexpected: new Emotions! Joy, Sadness, Anger, Fear and Disgust, who’ve long been running a successful operation by all accounts, aren’t sure how to feel when Anxiety shows up. And it looks like she’s not alone.",
        releaseDate: "2024-06-11",
        title: "Inside Out 2",
        backdropPath: "/stKGOm8UyhuLPR9sZLjs5AkmncA.jpg",
        posterPath: "/vpnVM9B6NMmQpWeZvzLvDESb2QY.jpg",
        genreIds: [16,10751,12,35,14]
      ),
      Movie(
        id: 53354,
        overview: "A listless Wade Wilson toils away in civilian life with his days as the morally flexible mercenary, Deadpool, behind him. But when his homeworld faces an existential threat, Wade must reluctantly suit-up again with an even more reluctant Wolverine.",
        releaseDate: "2024-07-24",
        title: "Deadpool & Wolverine",
        backdropPath: "/9l1eZiJHmhr5jIlthMdJN5WYoff.jpg",
        posterPath: "/8cdWjvZQUExUUTzyp4t6EDMubfO.jpg",
        genreIds: [38,35,878]
      ),
      Movie(
        id: 3651257,
        overview: "Returning to her home planet, an infamous bounty hunter forms an unexpected alliance with a team of unlikely heroes. Together, they battle monsters and dangerous bandits to protect a young girl who holds the key to unimaginable power.",
        releaseDate: "2024-08-07",
        title: "Borderlands",
        backdropPath: "/mKOBdgaEFguADkJhfFslY7TYxIh.jpg",
        posterPath: "/865DntZzOdX6rLMd405R0nFkLmL.jpg",
        genreIds: [28,878,35,12,53]
      ),
      Movie(
        id: 102459,
        overview: "Teenager Riley's mind headquarters is undergoing a sudden demolition to make room for something entirely unexpected: new Emotions! Joy, Sadness, Anger, Fear and Disgust, who’ve long been running a successful operation by all accounts, aren’t sure how to feel when Anxiety shows up. And it looks like she’s not alone.",
        releaseDate: "2024-06-11",
        title: "Inside Out 2",
        backdropPath: "/stKGOm8UyhuLPR9sZLjs5AkmncA.jpg",
        posterPath: "/vpnVM9B6NMmQpWeZvzLvDESb2QY.jpg",
        genreIds: [16,10751,12,35,14]
      )
    ]
  }
}

#Preview {
  MainTabView(viewModel: HomeViewModel())
}
