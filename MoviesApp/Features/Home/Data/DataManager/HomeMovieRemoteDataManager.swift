//
//  HomeMovieRemoteDataManager.swift
//  MoviesApp
//
//  Created by Ezequiel Nicolas Velez on 19/09/2024.
//

import Foundation
import Combine

protocol HomeMovieRemoteDataManagerProtocol {
  func fetchMovies(endpoint: Endpoint) -> AnyPublisher<[Movie], Error>
}

final class HomeMovieRemoteDataManager: HomeMovieRemoteDataManagerProtocol {
  func fetchMovies(endpoint: Endpoint) -> AnyPublisher<[Movie], Error> {
    guard let url: URL = URL(string: endpoint.servicePath) else {
      return Fail(error: MovieAppError.badURL).eraseToAnyPublisher()
    }
    var request: URLRequest = URLRequest(url: url)
    request.allHTTPHeaderFields = [
      "accept": "application/json",
      "Authorization": endpoint.authorizationToken
    ]
    
    return NetworkingManager.download(request: request)
      .decode(type: MovieList.self, decoder: JSONDecoder())
      .tryMap({ movieList in
        return movieList.results
      })
      .eraseToAnyPublisher()
  }
}
