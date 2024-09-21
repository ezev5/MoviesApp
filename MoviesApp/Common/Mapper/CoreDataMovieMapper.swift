//
//  CoreDataMovieMapper.swift
//  MoviesApp
//
//  Created by Ezequiel Nicolas Velez on 20/09/2024.
//

import Foundation
import CoreData

struct CoreDataMovieMapper: CoreDataMovieMapperProtocol {
  func transform(from model: Movie, context: NSManagedObjectContext) -> MovieEntity {
    return MovieEntity(
      context: context,
      id: model.id,
      overview: model.overview,
      releaseDate: model.releaseDate,
      title: model.title,
      backdropPath: model.backdropPath,
      posterPath: model.posterPath,
      voteAverage: model.voteAverage
    )
  }
  
  func transform(from model: MovieEntity) -> Movie {
    return Movie(
      id: Int(model.id),
      overview: model.overview ?? "",
      releaseDate: model.releaseDate ?? "",
      title: model.title ?? "",
      backdropPath: model.backdropPath ?? "",
      posterPath: model.posterPath ?? "",
      voteAverage: model.voteAverage,
      genreIds: []
    )
  }
}
