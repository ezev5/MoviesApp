//
//  DetailUseCasesWrapper.swift
//  MoviesApp
//
//  Created by Ezequiel Nicolas Velez on 21/09/2024.
//

import Foundation

protocol DetailUseCasesWrapperProtocol {
  var addToWatchListUseCase: AddToWatchListUseCaseProtocol { get }
  var getVideoIdUseCase: GetVideoIdUseCaseProtocol { get }
}


final class DetailUseCasesWrapper: DetailUseCasesWrapperProtocol {
  let addToWatchListUseCase: AddToWatchListUseCaseProtocol
  let getVideoIdUseCase: GetVideoIdUseCaseProtocol
  
  init(
    addToWatchListUseCase: AddToWatchListUseCaseProtocol,
    getVideoIdUseCase: GetVideoIdUseCaseProtocol
  ) {
    self.addToWatchListUseCase = addToWatchListUseCase
    self.getVideoIdUseCase = getVideoIdUseCase
  }
}
