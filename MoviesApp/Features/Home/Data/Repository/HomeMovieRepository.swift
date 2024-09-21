//
//  HomeMovieRepository.swift
//  MoviesApp
//
//  Created by Ezequiel Nicolas Velez on 19/09/2024.
//

import Foundation
import Combine

protocol HomeMovieRepositoryProtocol {
  func getPopularRequest() -> AnyPublisher<[Movie], Error>
  func getNowPlayingRequest() -> AnyPublisher<[Movie], Error>
  func getUpcomingRequest() -> AnyPublisher<[Movie], Error>
  func getTopRatedRequest() -> AnyPublisher<[Movie], Error>
}

final class HomeMovieRepository: HomeMovieRepositoryProtocol {
  private let remoteDataManager: HomeMovieRemoteDataManagerProtocol
  private let localDataManager: HomeMovieLocalDataManagerProtocol
  
  init(
    remoteDataManager: HomeMovieRemoteDataManagerProtocol,
    localDataManager: HomeMovieLocalDataManagerProtocol
  ) {
    self.remoteDataManager = remoteDataManager
    self.localDataManager = localDataManager
  }
  
  func getPopularRequest() -> AnyPublisher<[Movie], Error> {
    return remoteDataManager.fetchMovies(endpoint: .popular)
      .catch({self.handleRemoteFetchFailure($0, category: .popular)})
      .map({self.storeRetrievedMovies(movies: $0, category: .popular)})
      .eraseToAnyPublisher()
  }
  
  func getNowPlayingRequest() -> AnyPublisher<[Movie], Error> {
    return remoteDataManager.fetchMovies(endpoint: .nowPlaying)
      .catch({self.handleRemoteFetchFailure($0, category: .nowPlaying)})
      .map({self.storeRetrievedMovies(movies: $0, category: .nowPlaying)})
      .eraseToAnyPublisher()
  }
  
  func getUpcomingRequest() -> AnyPublisher<[Movie], Error> {
    return remoteDataManager.fetchMovies(endpoint: .upComing)
      .catch({self.handleRemoteFetchFailure($0, category: .upcoming)})
      .map({self.storeRetrievedMovies(movies: $0, category: .upcoming)})
      .eraseToAnyPublisher()
  }
  
  func getTopRatedRequest() -> AnyPublisher<[Movie], Error> {
    return remoteDataManager.fetchMovies(endpoint: .topRated)
      .catch({self.handleRemoteFetchFailure($0, category: .topRated)})
      .map({self.storeRetrievedMovies(movies: $0, category: .topRated)})
      .eraseToAnyPublisher()
  }
  
  private func handleRemoteFetchFailure(_ error: Error, category: Category) -> AnyPublisher<[Movie], Error> {
    Just(localDataManager.getMovie(category: category))
      .setFailureType(to: Error.self)
      .eraseToAnyPublisher()
  }
  
  private func storeRetrievedMovies(movies: [Movie], category: Category) -> [Movie] {
    localDataManager.saveMovies(movies: movies, category: category)
    return movies
  }
}
