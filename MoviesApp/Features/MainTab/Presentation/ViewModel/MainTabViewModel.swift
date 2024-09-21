//
//  HomeViewModel.swift
//  MoviesApp
//
//  Created by Ezequiel Nicolas Velez on 18/09/2024.
//

import Combine
import SwiftUI

enum TabBarItem: Hashable {
  case home
  case search
  case watchList
  
  var title: String {
    switch self {
    case .home: return "Home"
    case .search: return "Search"
    case .watchList: return "Watch List"
    }
  }
  
  var iconName: String {
    switch self {
    case .home: return "house"
    case .search: return "magnifyingglass"
    case .watchList: return "bookmark"
    }
  }
}

protocol MainTabViewModelProtocol: ObservableObject {
  var isLoading: Bool { get set }
  var tabs: [TabBarItem] { get }
  var tabSelection: TabBarItem { get set }
}

final class MainTabViewModel: MainTabViewModelProtocol {
  @Published var isLoading: Bool = true
  var tabs: [TabBarItem] = [.home, .search, .watchList]
  @Published var tabSelection: TabBarItem = .home
}
