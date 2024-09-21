//
//  HomeGetUpcomingUseCase.swift
//  MoviesApp
//
//  Created by Ezequiel Nicolas Velez on 19/09/2024.
//

import Foundation
import Combine

final class HomeGetUpcomingUseCase: HomeGetUpcomingUseCaseProtocol {
  private let repository: HomeMovieRepositoryProtocol

  init(
    repository: HomeMovieRepositoryProtocol
  ) {
    self.repository = repository
  }
  
  func execute() -> AnyPublisher<[Movie], Error> {
    return repository.getUpcomingRequest()
      .eraseToAnyPublisher()
  }
}
