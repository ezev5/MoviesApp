//
//  HomeUseCasesWrapper.swift
//  MoviesApp
//
//  Created by Ezequiel Nicolas Velez on 19/09/2024.
//

import Foundation

final class HomeUseCasesWrapper: HomeUseCasesWrapperProtocol {
  let getPopularUseCase: HomeGetPopularUseCaseProtocol
  let getNowPlayingUseCase: HomeGetNowPlayingUseCaseProtocol
  let getUpcomingUseCase: HomeGetUpcomingUseCaseProtocol
  let getTopRatedUseCase: HomeGetTopRatedUseCaseProtocol
  
  init(
    getPopularUseCase: HomeGetPopularUseCaseProtocol,
    getNowPlayingUseCase: HomeGetNowPlayingUseCaseProtocol,
    getUpcomingUseCase: HomeGetUpcomingUseCaseProtocol,
    getTopRatedUseCase: HomeGetTopRatedUseCaseProtocol
  ) {
    self.getPopularUseCase = getPopularUseCase
    self.getNowPlayingUseCase = getNowPlayingUseCase
    self.getUpcomingUseCase = getUpcomingUseCase
    self.getTopRatedUseCase = getTopRatedUseCase
  }

}
