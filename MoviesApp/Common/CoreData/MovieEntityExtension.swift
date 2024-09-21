//
//  MovieEntityExtension.swift
//  MoviesApp
//
//  Created by Ezequiel Nicolas Velez on 20/09/2024.
//
//

import Foundation
import CoreData

extension MovieEntity {
  convenience init(
    context: NSManagedObjectContext,
    id: Int,
    overview: String,
    releaseDate: String,
    title: String,
    backdropPath: String,
    posterPath: String,
    voteAverage: Double
  ) {
    self.init(context: context)
    self.id = Int64(id)
    self.overview = overview
    self.releaseDate = releaseDate
    self.title = title
    self.backdropPath = backdropPath
    self.posterPath = posterPath
    self.voteAverage = voteAverage
  }
}
