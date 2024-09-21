//
//  GetWatchListMoviesRepository.swift
//  MoviesApp
//
//  Created by Ezequiel Nicolas Velez on 20/09/2024.
//

import Foundation
import Combine

protocol GetWatchListMoviesRepositoryProtocol {
  func getWatchListMovies() -> AnyPublisher<[Movie], Error>
}

final class GetWatchListMoviesRepository: GetWatchListMoviesRepositoryProtocol {
  private let localDataManager: GetWatchListMoviesLocalDataManagerProtocol
  
  init(localDataManager: GetWatchListMoviesLocalDataManagerProtocol) {
    self.localDataManager = localDataManager
  }
  
  func getWatchListMovies() -> AnyPublisher<[Movie], Error> {
    return localDataManager.getWatchListMovies().eraseToAnyPublisher()
  }
}
