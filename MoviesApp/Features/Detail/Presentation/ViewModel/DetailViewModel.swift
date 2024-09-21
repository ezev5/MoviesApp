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
  func saveButtonTaped()
}

final class DetailViewModel: DetailViewModelProtocol {
  @Published var movie: Movie
  private let useCase: AddToWatchListUseCaseProtocol
  private var cancellables: Set<AnyCancellable> = []
  
  init(
    movie: Movie,
    useCase: AddToWatchListUseCaseProtocol
  ) {
    self.movie = movie
    self.useCase = useCase
  }
  
  func saveButtonTaped() {
    useCase.execute(movie: movie).sink(
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
}
