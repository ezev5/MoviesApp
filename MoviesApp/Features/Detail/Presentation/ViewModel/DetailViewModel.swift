//
//  DetailViewModel.swift
//  MoviesApp
//
//  Created by Ezequiel Nicolas Velez on 20/09/2024.
//

import Foundation
import Combine

protocol DetailViewModelProtocol: ObservableObject {
  var movie: Movie { get }
  var videoId: String { get }
  func saveButtonTaped()
  func getVideoId()
}

final class DetailViewModel: DetailViewModelProtocol {
  @Published var movie: Movie
  @Published var videoId: String = ""
  private let useCasesWrapper: DetailUseCasesWrapperProtocol
  private var cancellables: Set<AnyCancellable> = []
  
  init(
    movie: Movie,
    useCasesWrapper: DetailUseCasesWrapperProtocol
  ) {
    self.movie = movie
    self.useCasesWrapper = useCasesWrapper
  }
  
  func saveButtonTaped() {
    useCasesWrapper.addToWatchListUseCase.execute(movie: movie).sink(
      receiveCompletion: { completion in
        switch completion {
        case .failure(let error):
          //TODO: handle errors
          print(error)
        case .finished:
          print("Saved")
        }
      },
      receiveValue: { _ in }
    ).store(in: &cancellables)

  }
  
  func getVideoId() {
    useCasesWrapper.getVideoIdUseCase.execute(movieId: movie.id).sink(
      receiveCompletion: { completion in
        switch completion {
        case .failure(let error):
          //TODO: handle errors
          print(error)
        case .finished:
          print("Video Id is ready")
        }
      },
      receiveValue: { [weak self] result in
        self?.videoId = result
      }
    ).store(in: &cancellables)
  }
}
