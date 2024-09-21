//
//  HomeUseCasesWrapperProtocol.swift
//  MoviesApp
//
//  Created by Ezequiel Nicolas Velez on 19/09/2024.
//

import Foundation
import Combine

protocol HomeUseCasesWrapperProtocol {
  var getPopularUseCase: HomeGetPopularUseCaseProtocol { get }
  var getNowPlayingUseCase: HomeGetNowPlayingUseCaseProtocol { get }
  var getUpcomingUseCase: HomeGetUpcomingUseCaseProtocol { get }
  var getTopRatedUseCase: HomeGetTopRatedUseCaseProtocol { get }
}

protocol HomeGetPopularUseCaseProtocol {
  func execute() -> AnyPublisher<[Movie], Error>
}

protocol HomeGetNowPlayingUseCaseProtocol {
  func execute() -> AnyPublisher<[Movie], Error>
}

protocol HomeGetUpcomingUseCaseProtocol {
  func execute() -> AnyPublisher<[Movie], Error>
}

protocol HomeGetTopRatedUseCaseProtocol {
  func execute() -> AnyPublisher<[Movie], Error>
}
