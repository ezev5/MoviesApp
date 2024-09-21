//
//  DetailWireframe.swift
//  MoviesApp
//
//  Created by Ezequiel Nicolas Velez on 20/09/2024.
//

import Foundation
import SwiftUI

final class DetailWireframe {
  static func getView(movie: Movie) -> some View {
    
    let localDataManager: AddToWatchListLocalDataManagerProtocol = AddToWatchListLocalDataManager()
    
    let repository: AddToWatchListRepositoryProtocol = AddToWatchListRepository(
      localDataManager: localDataManager
    )
    
    let useCase: AddToWatchListUseCaseProtocol = AddToWatchListMovieUseCase(
      repository: repository
    )

    return DetailView(
      viewModel:
        DetailViewModel(
          movie: movie,
          useCase: useCase
        )
    )
  }
}
