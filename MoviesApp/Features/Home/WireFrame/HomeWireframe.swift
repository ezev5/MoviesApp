//
//  HomeWireframe.swift
//  MoviesApp
//
//  Created by Ezequiel Nicolas Velez on 19/09/2024.
//

import Foundation
import SwiftUI

final class HomeWireframe {
  static func getView(activeTabIndex: Binding<TabBarItem>) -> some View {
    
    let remoteDataManager: HomeMovieRemoteDataManagerProtocol = HomeMovieRemoteDataManager()
    let localDataManager: HomeMovieLocalDataManagerProtocol = HomeMovieLocalDataManager()
    
    let repository: HomeMovieRepositoryProtocol = HomeMovieRepository(
      remoteDataManager: remoteDataManager, 
      localDataManager: localDataManager
    )
    
    let popularUseCase: HomeGetPopularUseCaseProtocol = HomeGetPopularUseCase(
      repository: repository
    )
    
    let nowPlayingUseCase: HomeGetNowPlayingUseCaseProtocol = HomeGetNowPlayingUseCase(
      repository: repository
    )
    
    let upcomingUseCase: HomeGetUpcomingUseCaseProtocol = HomeGetUpcomingUseCase(
      repository: repository
    )
    
    let topRatedUseCase: HomeGetTopRatedUseCaseProtocol = HomeGetTopRatedUseCase(
      repository: repository
    )
    
    let useCaseWrapper: HomeUseCasesWrapperProtocol = HomeUseCasesWrapper(
      getPopularUseCase: popularUseCase,
      getNowPlayingUseCase: nowPlayingUseCase,
      getUpcomingUseCase: upcomingUseCase,
      getTopRatedUseCase: topRatedUseCase
    )

    return HomeView(
      viewModel: HomeViewModel(
        useCasesWrapper: useCaseWrapper,
        activeTabIndex: activeTabIndex
      )
    )
  }
}
