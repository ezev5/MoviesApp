//
//  SaveMovieUseCase.swift
//  MoviesApp
//
//  Created by Ezequiel Nicolas Velez on 20/09/2024.
//

import Foundation
import Combine

protocol AddToWatchListUseCaseProtocol {
  func execute(movie: Movie) -> AnyPublisher<Bool, Error>
}

final class AddToWatchListMovieUseCase: AddToWatchListUseCaseProtocol {
  private let repository: AddToWatchListRepositoryProtocol
  
  init(repository: AddToWatchListRepositoryProtocol) {
    self.repository = repository
  }
  
  func execute(movie: Movie) -> AnyPublisher<Bool, Error> {
    return repository.addToWatchList(movie: movie).eraseToAnyPublisher()
  }
}
