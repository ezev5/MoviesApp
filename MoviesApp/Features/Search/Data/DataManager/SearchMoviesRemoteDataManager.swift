//
//  SearchMoviesRemoteDataManager.swift
//  MoviesApp
//
//  Created by Ezequiel Nicolas Velez on 20/09/2024.
//

import Foundation
import Combine

protocol SearchMoviesRemoteDataManagerProtocol {
  func getMoviesByName(name: String) -> AnyPublisher<[Movie], Error>
}

final class SearchMoviesRemoteDataManager: SearchMoviesRemoteDataManagerProtocol {
  func getMoviesByName(name: String) -> AnyPublisher<[Movie], Error> {
    let endpoint: Endpoint = .search
    
    var urlComponents = URLComponents(string: endpoint.servicePath)
    urlComponents?.queryItems = [
      URLQueryItem(name: "query", value: name)
    ]
    
    guard let url: URL = urlComponents?.url else {
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
