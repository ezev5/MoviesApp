//
//  SearchMoviesRepository.swift
//  MoviesApp
//
//  Created by Ezequiel Nicolas Velez on 20/09/2024.
//

import Foundation
import Combine

protocol SearchMoviesRepositoryProtocol {
  func searchMovies(name: String) -> AnyPublisher<[Movie], Error>
}

final class SearchMoviesRepository: SearchMoviesRepositoryProtocol {
  private let remoteDataManager: SearchMoviesRemoteDataManagerProtocol
  
  init(
    remoteDataManager: SearchMoviesRemoteDataManagerProtocol
  ) {
    self.remoteDataManager = remoteDataManager
  }
  
  func searchMovies(name: String) -> AnyPublisher<[Movie], Error> {
    remoteDataManager.getMoviesByName(name: name).eraseToAnyPublisher()
  }
}
