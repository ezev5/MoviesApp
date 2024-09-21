//
//  HomeGetPopularUseCase.swift
//  MoviesApp
//
//  Created by Ezequiel Nicolas Velez on 19/09/2024.
//

import Foundation
import Combine

final class HomeGetPopularUseCase: HomeGetPopularUseCaseProtocol {
  private let repository: HomeMovieRepositoryProtocol

  init(
    repository: HomeMovieRepositoryProtocol
  ) {
    self.repository = repository
  }
  
  func execute() -> AnyPublisher<[Movie], Error> {
    return repository.getPopularRequest()
      .eraseToAnyPublisher()
  }
}
