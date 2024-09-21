//
//  AddToWatchListRepository.swift
//  MoviesApp
//
//  Created by Ezequiel Nicolas Velez on 20/09/2024.
//

import Foundation
import Combine

protocol AddToWatchListRepositoryProtocol {
  func addToWatchList(movie: Movie) -> AnyPublisher<Bool, Error>
}

final class AddToWatchListRepository: AddToWatchListRepositoryProtocol {
  private let localDataManager: AddToWatchListLocalDataManagerProtocol
  
  init(localDataManager: AddToWatchListLocalDataManagerProtocol) {
    self.localDataManager = localDataManager
  }
  
  func addToWatchList(movie: Movie) -> AnyPublisher<Bool, Error> {
    return localDataManager.addToWatchList(movie: movie).eraseToAnyPublisher()
  }
}
