//
//  HomeView.swift
//  MoviesApp
//
//  Created by Ezequiel Nicolas Velez on 18/09/2024.
//

import SwiftUI

struct HomeView: View {
  @State var searchInput: String = ""
  @State var selectedItem: Int = 0
  
  var nowPlayingMovies: [Movie]
  var upcomingMovies: [Movie]
  var TopRatedMovies: [Movie]
  
  @State var displayedMovies: [Movie] = []
  
  var columns: [GridItem] = [
    GridItem(.adaptive(minimum: 100), spacing: 10),
    GridItem(.adaptive(minimum: 100), spacing: 10),
    GridItem(.adaptive(minimum: 100), spacing: 10)
  ]
  
  
  var body: some View {
    NavigationStack {
      ScrollView(.vertical) {
        VStack {
          //searchBar.padding(24)
          PopularMoviesView()
          pickerView
          gridView
            .onChange(of: selectedItem) {
              switch selectedItem {
              case 0:
                displayedMovies = nowPlayingMovies
              case 1:
                displayedMovies = upcomingMovies
              case 2:
                displayedMovies = TopRatedMovies
              default:
                displayedMovies = nowPlayingMovies
              }
            }
        }
      }.background {
        Color.theme.backgroundColor.ignoresSafeArea()
      }
    }.searchable(
      text: $searchInput,
      placement: .automatic,
      prompt: "Search"
    )
    .onAppear {
      //UINavigationBar.appearance().tintColor = UIColor( Color.red)
      //UISearchBar.appearance().tintColor = UIColor( Color.theme.accent)
      UISearchBar.appearance().overrideUserInterfaceStyle = .dark
      UISegmentedControl.appearance().overrideUserInterfaceStyle = .dark
      UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(Color.theme.accent)
    }
  }
  
  private var searchBar: some View {
    /*TextField(text: $searchInput) {
     Text("Search")
     .foregroundStyle(.white)
     }.background {
     Color.black
     .frame(height: 30)
     .clipShape(RoundedRectangle(cornerRadius: 10))
     }*/
    
    TextField(text: $searchInput, prompt: Text("asd")) {
      Label("StringProtocol", systemImage: "home")
    }
  }
  
  private var pickerView: some View {
    Picker("asd", selection: $selectedItem) {
      Text("Now Playing")
        .tint(Color.theme.primaryColor)
        .tag(0)
      Text("Upcoming")
        .tint(Color.theme.primaryColor)
        .tag(1)
      Text("Top Rated")
        .tint(Color.theme.primaryColor)
        .tag(2)
    }
    .pickerStyle(SegmentedPickerStyle())
    .padding(16)
  }
  
  private var gridView: some View {
    LazyVGrid(columns: columns, content: {
      ForEach( displayedMovies.prefix(6) ) { movie in
        MoviePosterView(posterPath: movie.posterPath)
      }
    })
    .padding(.horizontal, 24)
    /*
     Grid {
     GridRow {
     ForEach( getfirstSMovies() ) { movie in
     MoviePosterView(posterPath: movie.posterPath)
     }
     }
     GridRow {
     ForEach( getLastsMovies() ) { movie in
     MoviePosterView(posterPath: movie.posterPath)
     }
     }
     }
     .padding(24)*/
  }
  /*
   func getfirstSMovies() -> [Movie] {
   guard displayedMovies.count >= 3 else {
   return displayedMovies
   }
   return displayedMovies.prefix(3)
   }
   
   func getLastsMovies() -> [Movie] {
   guard displayedMovies.count >= 6 else {
   return displayedMovies.
   }
   return displayedMovies[0..>3]
   }*/
}

struct CustomSearchBar: View {
    @Binding var searchText: String
    
    @State var active = false
    
    var body: some View {
        HStack {
            HStack {
                Image(systemName: "magnifyingglass").foregroundColor(.gray)
                TextField("Search", text: $searchText, onEditingChanged: { editing in
                    withAnimation {
                        active = editing
                    }
                })
            }
            .padding(7)
            .background(Color(white: 0.9))
            .cornerRadius(10)
            .padding(.horizontal, active ? 0 : 50)
            
            Button("Cancel") {
                withAnimation {
                    active = false
                }
            }
            .opacity(active ? 1 : 0)
            .frame(width: active ? nil : 0)
        }
    }
}

#Preview {
  HomeView(
    nowPlayingMovies: [
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
    ],
    upcomingMovies: [
      Movie(
        id: 533535,
        overview: "A listless Wade Wilson toils away in civilian life with his days as the morally flexible mercenary, Deadpool, behind him. But when his homeworld faces an existential threat, Wade must reluctantly suit-up again with an even more reluctant Wolverine.",
        releaseDate: "2024-07-24",
        title: "Deadpool & Wolverine",
        backdropPath: "/9l1eZiJHmhr5jIlthMdJN5WYoff.jpg",
        posterPath: "/8cdWjvZQUExUUTzyp4t6EDMubfO.jpg",
        genreIds: [38,35,878]
      ),
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
      )
    ],
    TopRatedMovies: [
      Movie(
        id: 533535,
        overview: "A listless Wade Wilson toils away in civilian life with his days as the morally flexible mercenary, Deadpool, behind him. But when his homeworld faces an existential threat, Wade must reluctantly suit-up again with an even more reluctant Wolverine.",
        releaseDate: "2024-07-24",
        title: "Deadpool & Wolverine",
        backdropPath: "/9l1eZiJHmhr5jIlthMdJN5WYoff.jpg",
        posterPath: "/9l1eZiJHmhr5jIlthMdJN5WYoff.jpg",
        genreIds: [38,35,878]
      ),
      Movie(
        id: 365177,
        overview: "Returning to her home planet, an infamous bounty hunter forms an unexpected alliance with a team of unlikely heroes. Together, they battle monsters and dangerous bandits to protect a young girl who holds the key to unimaginable power.",
        releaseDate: "2024-08-07",
        title: "Borderlands",
        backdropPath: "/9l1eZiJHmhr5jIlthMdJN5WYoff.jpg",
        posterPath: "/9l1eZiJHmhr5jIlthMdJN5WYoff.jpg",
        genreIds: [28,878,35,12,53]
      ),
      Movie(
        id: 1022789,
        overview: "Teenager Riley's mind headquarters is undergoing a sudden demolition to make room for something entirely unexpected: new Emotions! Joy, Sadness, Anger, Fear and Disgust, who’ve long been running a successful operation by all accounts, aren’t sure how to feel when Anxiety shows up. And it looks like she’s not alone.",
        releaseDate: "2024-06-11",
        title: "Inside Out 2",
        backdropPath: "/9l1eZiJHmhr5jIlthMdJN5WYoff.jpg",
        posterPath: "/9l1eZiJHmhr5jIlthMdJN5WYoff.jpg",
        genreIds: [16,10751,12,35,14]
      ),
      Movie(
        id: 53354,
        overview: "A listless Wade Wilson toils away in civilian life with his days as the morally flexible mercenary, Deadpool, behind him. But when his homeworld faces an existential threat, Wade must reluctantly suit-up again with an even more reluctant Wolverine.",
        releaseDate: "2024-07-24",
        title: "Deadpool & Wolverine",
        backdropPath: "/9l1eZiJHmhr5jIlthMdJN5WYoff.jpg",
        posterPath: "/9l1eZiJHmhr5jIlthMdJN5WYoff.jpg",
        genreIds: [38,35,878]
      ),
      Movie(
        id: 3651257,
        overview: "Returning to her home planet, an infamous bounty hunter forms an unexpected alliance with a team of unlikely heroes. Together, they battle monsters and dangerous bandits to protect a young girl who holds the key to unimaginable power.",
        releaseDate: "2024-08-07",
        title: "Borderlands",
        backdropPath: "/9l1eZiJHmhr5jIlthMdJN5WYoff.jpg",
        posterPath: "/9l1eZiJHmhr5jIlthMdJN5WYoff.jpg",
        genreIds: [28,878,35,12,53]
      ),
      Movie(
        id: 102459,
        overview: "Teenager Riley's mind headquarters is undergoing a sudden demolition to make room for something entirely unexpected: new Emotions! Joy, Sadness, Anger, Fear and Disgust, who’ve long been running a successful operation by all accounts, aren’t sure how to feel when Anxiety shows up. And it looks like she’s not alone.",
        releaseDate: "2024-06-11",
        title: "Inside Out 2",
        backdropPath: "/9l1eZiJHmhr5jIlthMdJN5WYoff.jpg",
        posterPath: "/9l1eZiJHmhr5jIlthMdJN5WYoff.jpg",
        genreIds: [16,10751,12,35,14]
      )
    ]
  )
}
