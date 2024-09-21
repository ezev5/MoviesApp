//
//  SearchWireframe.swift
//  MoviesApp
//
//  Created by Ezequiel Nicolas Velez on 20/09/2024.
//

import Foundation
import SwiftUI

final class SearchViewWireframe {
  static func getView() -> some View {
    
    let remoteDataManager: SearchMoviesRemoteDataManagerProtocol = SearchMoviesRemoteDataManager()
    
    let repository: SearchMoviesRepositoryProtocol = SearchMoviesRepository(
      remoteDataManager: remoteDataManager
    )
    
    let useCase: SearchMoviesUseCaseProtocol = SearchMoviesUseCase(
      repository: repository
    )

    return SearchView(viewModel: SearchViewModel(useCase: useCase))
  }
}
