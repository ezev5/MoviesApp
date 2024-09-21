//
//  DetailView.swift
//  MoviesApp
//
//  Created by Ezequiel Nicolas Velez on 18/09/2024.
//

import SwiftUI
import AVKit

struct DetailView<ViewModel: DetailViewModelProtocol>: View {
  @StateObject var viewModel: ViewModel
  
  var body: some View {
    VStack {
      ZStack(alignment: .top) {
        //TODO: add video
        backgroundImage
          .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: 250)
        VStack {
          HStack {
            MoviePosterView(posterPath: viewModel.movie.posterPath)
              .frame(width: 100, height: 150)
            VStack {
              HStack {
                Spacer()
                Label(String(format: "%.1f", viewModel.movie.voteAverage), systemImage: "star")
                  .foregroundStyle(Color.theme.ratingColor)
                  .padding(5)
                  .background(Color.theme.secondaryColor)
                  .clipShape(RoundedRectangle(cornerRadius: 10))
              }
              Text(viewModel.movie.title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(Color.theme.primaryColor)
                .padding(.top, 10)
            }
          }
          .padding(.horizontal, 20)
          HStack {
            Label(viewModel.movie.releaseDate, systemImage: "calendar")
              .foregroundStyle(Color.theme.secondaryColor)
            Divider()
              .background(Color.theme.secondaryColor)
              .frame(height: 30)
            //TODO: this information don't came from service
            Label("148 Minutes", systemImage: "clock")
              .foregroundStyle(Color.theme.secondaryColor)
            Divider()
              .background(Color.theme.secondaryColor)
              .frame(height: 30)
            //TODO: get the name of the genre from another service
            Label("Action", systemImage: "ticket")
              .foregroundStyle(Color.theme.secondaryColor)
          }
          Text(viewModel.movie.overview)
            .foregroundStyle(Color.theme.primaryColor)
            .padding(24)
          Spacer()
        }
        .padding(.top, 180)
      }
      .background(Color.theme.backgroundColor)
    }
    .navigationBarTitleDisplayMode(.inline)
    .toolbar {
      ToolbarItem(placement: .principal) {
        Text("Detail")
          .font(.title2)
          .foregroundColor(Color.theme.primaryColor)
      }
    }
    .toolbar {
      Button(action: {
        viewModel.saveButtonTaped()
      }, label: {
        Image(systemName: "bookmark.fill")
          .tint(Color.theme.primaryColor)
      })
    }
  }
  
  private var backgroundImage: some View {
    VStack {
      if let backdropPath = viewModel.movie.backdropPath {
        AsyncImage(
          url: URL(
            string: Constants.DataSource.imageBaseURL + backdropPath
          )
        ) { image in
          image.resizable()
        } placeholder: {
          ProgressView()
            .tint(Color.theme.accent)
        }
        .scaledToFill()
      } else {
        Image(systemName: "photo")
          .foregroundStyle(Color.theme.secondaryColor)
      }
    }
  }
}

/*
#Preview {
  NavigationStack{
    DetailWireframe.getView(movie: Movie(
      id: 533535,
      overview: "A listless Wade Wilson toils away in civilian life with his days as the morally flexible mercenary, Deadpool, behind him. But when his homeworld faces an existential threat, Wade must reluctantly suit-up again with an even more reluctant Wolverine.",
      releaseDate: "2024-07-24",
      title: "Deadpool & Wolverine",
      backdropPath: "/9l1eZiJHmhr5jIlthMdJN5WYoff.jpg",
      posterPath: "/8cdWjvZQUExUUTzyp4t6EDMubfO.jpg",
      voteAverage: 9.593,
      genreIds: [38,35,878]
    ))
  }
}
*/
