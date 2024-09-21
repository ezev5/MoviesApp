//
//  GetWatchListMoviesLocalDataManager.swift
//  MoviesApp
//
//  Created by Ezequiel Nicolas Velez on 20/09/2024.
//

import Foundation
import CoreData
import Combine

protocol GetWatchListMoviesLocalDataManagerProtocol {
  func getWatchListMovies() -> AnyPublisher<[Movie], Error>
}

final class GetWatchListMoviesLocalDataManager: GetWatchListMoviesLocalDataManagerProtocol {
  private let mapper: CoreDataMovieMapperProtocol
  private let container: PersistenceContainer
  
  init(
    mapper: CoreDataMovieMapperProtocol = CoreDataMovieMapper(),
    container: PersistenceContainer = PersistenceContainer.shared
  ) {
    self.mapper = mapper
    self.container = container
  }
  
  func getWatchListMovies() -> AnyPublisher<[Movie], Error> {
    let fetchRequest: NSFetchRequest<WatchListEntity> = WatchListEntity.fetchRequest()
    fetchRequest.predicate = NSPredicate(format: "name == %@", "My WhatchList")
    do {
      let watchList = try container.context.fetch(fetchRequest).first
      guard let movies: [MovieEntity] = watchList?.movies?.allObjects as? [MovieEntity] else {
        return Just([])
          .setFailureType(to: Error.self)
          .eraseToAnyPublisher()
      }
      return Just(movies.map({mapper.transform(from: $0)}))
        .setFailureType(to: Error.self)
        .eraseToAnyPublisher()
    } catch let error {
      print("Error fetching watchlist movies: \(error)")
      return Fail(error: error).eraseToAnyPublisher()
    }
  }
  
}
