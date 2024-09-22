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
    
    let remoteDataManager: GetMovieIdDataManagerProtocol = GetMovieIdDataManager()
    
    let getVideoIdRepository: GetVideoIdRepositoryProtocol = GetVideoIdRepository(
      remoteDataManager: remoteDataManager
    )
    
    let addToWatchLisRepository: AddToWatchListRepositoryProtocol = AddToWatchListRepository(
      localDataManager: localDataManager
    )
    
    let getVideoIdUseCase: GetVideoIdUseCaseProtocol = GetVideoIdUseCase(
      repository: getVideoIdRepository
    )
    
    let addToWatchListUseCase: AddToWatchListUseCaseProtocol = AddToWatchListMovieUseCase(
      repository: addToWatchLisRepository
    )
    
    let useCasesWrapper: DetailUseCasesWrapperProtocol = DetailUseCasesWrapper(
      addToWatchListUseCase: addToWatchListUseCase,
      getVideoIdUseCase: getVideoIdUseCase
    )

    return DetailView(
      viewModel:
        DetailViewModel(
          movie: movie,
          useCasesWrapper: useCasesWrapper
        )
    )
  }
}
