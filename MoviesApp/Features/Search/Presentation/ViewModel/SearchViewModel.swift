//
//  SearchViewModel.swift
//  MoviesApp
//
//  Created by Ezequiel Nicolas Velez on 20/09/2024.
//

import Foundation
import Combine

protocol SearchViewModelProtocol: ObservableObject {
  var movies: [Movie] { get }
  var searchInput: String { get set }
}

final class SearchViewModel: SearchViewModelProtocol {
  @Published var movies: [Movie] = []
  @Published var searchInput: String = ""
  private var useCase: SearchMoviesUseCaseProtocol
  private var cancellables: Set<AnyCancellable> = []
  
  init(useCase: SearchMoviesUseCaseProtocol) {
    self.useCase = useCase
    addSubscribers()
  }
  
  func addSubscribers() {
    $searchInput
      .debounce(for: .milliseconds(300), scheduler: RunLoop.main)
      .removeDuplicates()
      .sink { [weak self] text in
        guard !text.isEmpty else {
          self?.movies = []
          return
        }
        self?.searchMovies(by: text)
      }.store(in: &self.cancellables)
  }
  
  private func searchMovies(by name: String) {
    useCase.execute(name: name).sink(
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
    ).store(in: &self.cancellables)
  }
}
