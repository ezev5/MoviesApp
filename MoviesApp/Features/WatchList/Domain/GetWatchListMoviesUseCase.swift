//
//  GetWatchListMoviesUseCase.swift
//  MoviesApp
//
//  Created by Ezequiel Nicolas Velez on 20/09/2024.
//

import Foundation
import Combine
import CoreData

protocol GetWatchListMoviesUseCaseProtocol {
  func execute() -> AnyPublisher<[Movie], Error>
}

final class GetWatchListMoviesUseCase: GetWatchListMoviesUseCaseProtocol {
  private let repository: GetWatchListMoviesRepositoryProtocol
  
  init(repository: GetWatchListMoviesRepositoryProtocol) {
    self.repository = repository
  }
  
  func execute() -> AnyPublisher<[Movie], Error> {
    return repository.getWatchListMovies().eraseToAnyPublisher()
  }
}

