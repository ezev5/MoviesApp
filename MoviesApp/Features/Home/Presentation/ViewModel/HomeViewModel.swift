//
//  HomeViewModel.swift
//  MoviesApp
//
//  Created by Ezequiel Nicolas Velez on 19/09/2024.
//

import Foundation
import Combine
import SwiftUI

enum MovieTabs: Int, Equatable {
  case nowPlaying = 0
  case upcomingMovies = 1
  case topRatedMovies = 2
}

protocol HomeViewModelProtocol: ObservableObject {
  var activeTabIndex: Binding<TabBarItem> { get set }
  var searchInput: String { get set }
  var selectedTab: MovieTabs { get set }
  var displayedMovies: [Movie] { get set }
  var popularsMovies: [Movie] { get set }
  func tabChange()
  func loadData()
  func searchTapped()
}

class HomeViewModel: HomeViewModelProtocol {
  var activeTabIndex: Binding<TabBarItem>
  @Published var searchInput: String = ""
  @Published var selectedTab: MovieTabs = .nowPlaying
  @Published var displayedMovies: [Movie] = []
  @Published var popularsMovies: [Movie] = []
  private var nowPlayingMovies: [Movie] = []
  private var upcomingMovies: [Movie] = []
  private var topRatedMovies: [Movie] = []
  private var cancellables: Set<AnyCancellable> = []
  let useCasesWrapper: HomeUseCasesWrapperProtocol
  
  init(
    useCasesWrapper: HomeUseCasesWrapperProtocol,
    activeTabIndex: Binding<TabBarItem>
  ) {
    self.activeTabIndex = activeTabIndex
    self.useCasesWrapper = useCasesWrapper
  }
  
  func loadData() {
    useCasesWrapper.getPopularUseCase.execute().sink(
      receiveCompletion: { completion in
        switch completion {
        case .failure(let error):
          //TODO: handle errors
          print(error)
        case .finished:
          print("dowloaded")
        }
      },
      receiveValue: { [weak self] result in
        self?.popularsMovies = result
      }
    ).store(in: &cancellables)
    
    useCasesWrapper.getNowPlayingUseCase.execute().sink(
      receiveCompletion: { completion in
        switch completion {
        case .failure(let error):
          //TODO: handle errors
          print(error)
        case .finished:
          print("dowloaded")
        }
      },
      receiveValue: { [weak self] result in
        self?.nowPlayingMovies = result
        self?.displayedMovies = result
      }
    ).store(in: &cancellables)
    
    useCasesWrapper.getTopRatedUseCase.execute().sink(
      receiveCompletion: { completion in
        switch completion {
        case .failure(let error):
          //TODO: handle errors
          print(error)
        case .finished:
          print("dowloaded")
        }
      },
      receiveValue: { [weak self] result in
        self?.topRatedMovies = result
      }
    ).store(in: &cancellables)
    
    useCasesWrapper.getUpcomingUseCase.execute().sink(
      receiveCompletion: { completion in
        switch completion {
        case .failure(let error):
          //TODO: handle errors
          print(error)
        case .finished:
          print("dowloaded")
        }
      },
      receiveValue: { [weak self] result in
        self?.upcomingMovies = result
      }
    ).store(in: &cancellables)
  }
  
  func tabChange() {
    switch selectedTab {
    case .nowPlaying:
      displayedMovies = nowPlayingMovies
    case .upcomingMovies:
      displayedMovies = upcomingMovies
    case .topRatedMovies:
      displayedMovies = topRatedMovies
    }
  }
  
  func searchTapped() {
    activeTabIndex.wrappedValue = .search
  }
}
