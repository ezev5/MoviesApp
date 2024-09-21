//
//  WatchListViewModel.swift
//  MoviesApp
//
//  Created by Ezequiel Nicolas Velez on 20/09/2024.
//

import Foundation
import Combine

protocol WatchListViewModelProtocol: ObservableObject {
  var movies: [Movie] { get }
  func loadMovies()
}

final class WatchListViewModel: WatchListViewModelProtocol {
  @Published var movies: [Movie] = []
  private var useCase: GetWatchListMoviesUseCaseProtocol
  private var cancellables: Set<AnyCancellable> = []
  
  init(useCase: GetWatchListMoviesUseCaseProtocol) {
    self.useCase = useCase
  }
  
  func loadMovies() {
    useCase.execute().sink(
      receiveCompletion: { completion in
        switch completion {
        case .failure(let error):
          //TODO: handle errors
          print(error)
        case .finished:
          print("get watch list finish")
        }
      },
      receiveValue: { [weak self] result in
        self?.movies = result
      }
    ).store(in: &cancellables)

  }
}
