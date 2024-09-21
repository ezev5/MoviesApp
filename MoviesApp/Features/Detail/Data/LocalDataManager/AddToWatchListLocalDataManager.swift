//
//  AddToWatchListLocalDataManager.swift
//  MoviesApp
//
//  Created by Ezequiel Nicolas Velez on 20/09/2024.
//

import Foundation
import Combine
import CoreData

protocol AddToWatchListLocalDataManagerProtocol {
  func addToWatchList(movie: Movie) -> AnyPublisher<Bool, Error>
}

final class AddToWatchListLocalDataManager: AddToWatchListLocalDataManagerProtocol {
  private let mapper: CoreDataMovieMapperProtocol
  private let container: PersistenceContainer
  
  init(
    mapper: CoreDataMovieMapperProtocol = CoreDataMovieMapper(),
    container: PersistenceContainer = PersistenceContainer.shared
  ) {
    self.mapper = mapper
    self.container = container
  }
  
  func addToWatchList(movie: Movie) -> AnyPublisher<Bool, Error> {
    let watchListFetchRequest: NSFetchRequest<WatchListEntity> = WatchListEntity.fetchRequest()
    watchListFetchRequest.predicate = NSPredicate(format: "name == %@", "My WhatchList")
    
    do {
      let fetchedWatchLists = try container.context.fetch(watchListFetchRequest)
      
      var watchList: WatchListEntity
      if let existingWatchList = fetchedWatchLists.first {
        watchList = existingWatchList
      } else {
        watchList = WatchListEntity(context: container.context, name: "My WhatchList")
      }
      
      let movieFetchRequest: NSFetchRequest<MovieEntity> = MovieEntity.fetchRequest()
      movieFetchRequest.predicate = NSPredicate(format: "id == %d", movie.id)
      
      let fetchedMovies = try container.context.fetch(movieFetchRequest)
      
      let movieEntity: MovieEntity
      if let existingMovie = fetchedMovies.first {
        movieEntity = existingMovie
      } else {
        movieEntity = mapper.transform(from: movie, context: container.context)
      }
      
      watchList.addToMovies(movieEntity)
      
      try container.context.save()
      print("Movies saved in watch list")
      return Just(true).setFailureType(to: Error.self).eraseToAnyPublisher()
    } catch let error {
      print("Fail to save movies: \(error)")
      return Fail(error: error).eraseToAnyPublisher()
    }
  }
}
