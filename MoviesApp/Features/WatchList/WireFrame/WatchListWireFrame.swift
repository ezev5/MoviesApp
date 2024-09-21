//
//  WatchListWireFrame.swift
//  MoviesApp
//
//  Created by Ezequiel Nicolas Velez on 20/09/2024.
//

import Foundation
import SwiftUI

final class WatchListWireFrame {
  static func getView() -> some View {
    
    let localDataManager: GetWatchListMoviesLocalDataManagerProtocol = GetWatchListMoviesLocalDataManager()
    
    let repository: GetWatchListMoviesRepositoryProtocol = GetWatchListMoviesRepository(
      localDataManager: localDataManager
    )
    
    let useCase: GetWatchListMoviesUseCaseProtocol = GetWatchListMoviesUseCase(
      repository: repository
    )

    return WatchListView(viewModel: WatchListViewModel(useCase: useCase))
  }
}
