//
//  HomeViewModel.swift
//  MoviesApp
//
//  Created by Ezequiel Nicolas Velez on 18/09/2024.
//

import Combine
import SwiftUI

protocol MainTabViewModelProtocol: ObservableObject {
  var isLoading: Bool { get set }
}

final class MainTabViewModel: MainTabViewModelProtocol {
  @Published var isLoading: Bool = true
  
}
