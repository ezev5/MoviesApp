//
//  GetVideoIdUseCase.swift
//  MoviesApp
//
//  Created by Ezequiel Nicolas Velez on 21/09/2024.
//

import Foundation
import Combine

protocol GetVideoIdUseCaseProtocol {
  func execute(movieId: Int) -> AnyPublisher<String, Error>
}

final class GetVideoIdUseCase: GetVideoIdUseCaseProtocol {
  private let repository: GetVideoIdRepositoryProtocol
  
  init(repository: GetVideoIdRepositoryProtocol) {
    self.repository = repository
  }
  
  func execute(movieId: Int) -> AnyPublisher<String, Error> {
    return repository.getVideoId(movieId: movieId).eraseToAnyPublisher()
  }
}

protocol GetVideoIdRepositoryProtocol {
  func getVideoId(movieId: Int) -> AnyPublisher<String, Error>
}

final class GetVideoIdRepository: GetVideoIdRepositoryProtocol {
  private let remoteDataManager: GetMovieIdDataManagerProtocol
  
  init(
    remoteDataManager: GetMovieIdDataManagerProtocol
  ) {
    self.remoteDataManager = remoteDataManager
  }
  
  func getVideoId(movieId: Int) -> AnyPublisher<String, Error> {
    remoteDataManager.getVideoId(movieId: movieId)
  }
}

protocol GetMovieIdDataManagerProtocol {
  func getVideoId(movieId: Int) -> AnyPublisher<String, Error>
}

final class GetMovieIdDataManager: GetMovieIdDataManagerProtocol {
  func getVideoId(movieId: Int) -> AnyPublisher<String, Error> {
    let endpoint: Endpoint = .videoId(movieId)
    guard let url: URL = URL(string: endpoint.servicePath) else {
      return Fail(error: MovieAppError.badURL).eraseToAnyPublisher()
    }
    var request: URLRequest = URLRequest(url: url)
    request.allHTTPHeaderFields = [
      "accept": "application/json",
      "Authorization": endpoint.authorizationToken
    ]
    
    return NetworkingManager.download(request: request)
      .decode(type: VideoList.self, decoder: JSONDecoder())
      .tryMap({ videoList in
        return videoList.results.filter({ $0.type == "Trailer" }).first?.key ?? ""
      })
      .eraseToAnyPublisher()
  }
}
