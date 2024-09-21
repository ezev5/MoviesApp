//
//  PopularMoviesView.swift
//  MoviesApp
//
//  Created by Ezequiel Nicolas Velez on 18/09/2024.
//

import SwiftUI

struct PopularMoviesView: View {
  @Binding var movies: [Movie]
  
  var body: some View {
    ScrollView(.horizontal, showsIndicators: false){
      HStack(spacing: 20) {
        ForEachWithIndex(movies) { index, movie in
          NavigationLink(value: movie) {
            ZStack(alignment: .bottom) {
              MoviePosterView(posterPath: movie.posterPath)
                .frame(width: 144, height: 210)
              HStack {
                Text("\(index+1)")
                  .font(.system(size: 96, weight: .bold, design: .rounded))
                  .foregroundStyle(Color.theme.accent)
                Spacer()
              }
              .padding(.leading, -20)
              .padding(.bottom, -40)
            }
          }
        }
      }
      .padding(.horizontal, 30)
      .frame(height: 260)
      .scrollTargetLayout()
    }
    .scrollTargetBehavior(.viewAligned)
  }
}
