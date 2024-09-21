//
//  SearchUseCase.swift
//  MoviesApp
//
//  Created by Ezequiel Nicolas Velez on 20/09/2024.
//

import Foundation
import Combine

protocol SearchMoviesUseCaseProtocol {
  func execute(name: String) -> AnyPublisher<[Movie], Error>
}

final class SearchMoviesUseCase: SearchMoviesUseCaseProtocol {
  private let repository: SearchMoviesRepositoryProtocol

  init(
    repository: SearchMoviesRepositoryProtocol
  ) {
    self.repository = repository
  }
  
  func execute(name: String) -> AnyPublisher<[Movie], Error> {
    repository.searchMovies(name: name).eraseToAnyPublisher()
  }
}
