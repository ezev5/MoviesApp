//
//  MockHomeMovieRepository.swift
//  MoviesAppTests
//
//  Created by Ezequiel Nicolas Velez on 22/09/2024.
//

import Foundation
import Combine
@testable import MoviesApp

final class MockHomeMovieRepository: HomeMovieRepositoryProtocol {
  var calls: Calls = Calls()
  var constants: Constants = Constants()
  var simulateError: Bool = false
  
  func getPopularRequest() -> AnyPublisher<[MoviesApp.Movie], Error> {
    calls.getPopularRequestCalled = true
    guard !simulateError else {
      return Fail(
        error: MovieAppError.badURL
      )
      .eraseToAnyPublisher()
    }
    
    return Just(constants.movieList)
      .setFailureType(to: Error.self)
      .eraseToAnyPublisher()
  }
  
  func getNowPlayingRequest() -> AnyPublisher<[MoviesApp.Movie], Error> {
    calls.getNowPlayingRequest = true
    guard !simulateError else {
      return Fail(
        error: MovieAppError.badURL
      )
      .eraseToAnyPublisher()
    }
    
    return Just(constants.movieList)
      .setFailureType(to: Error.self)
      .eraseToAnyPublisher()
  }
  
  func getUpcomingRequest() -> AnyPublisher<[MoviesApp.Movie], Error> {
    calls.getUpcomingRequest = true
    guard !simulateError else {
      return Fail(
        error: MovieAppError.badURL
      )
      .eraseToAnyPublisher()
    }
    
    return Just(constants.movieList)
      .setFailureType(to: Error.self)
      .eraseToAnyPublisher()
  }
  
  func getTopRatedRequest() -> AnyPublisher<[MoviesApp.Movie], Error> {
    calls.getTopRatedRequest = true
    guard !simulateError else {
      return Fail(
        error: MovieAppError.badURL
      )
      .eraseToAnyPublisher()
    }
    
    return Just(constants.movieList)
      .setFailureType(to: Error.self)
      .eraseToAnyPublisher()
  }
  
  struct Calls {
    var getPopularRequestCalled: Bool = false
    var getNowPlayingRequest: Bool = false
    var getUpcomingRequest: Bool = false
    var getTopRatedRequest: Bool = false
  }
  
  struct Constants {
    var movieList: [Movie] = [
      Movie(
        id: 533535,
        overview: "A listless Wade Wilson toils away in civilian life with his days as the morally flexible mercenary, Deadpool, behind him. But when his homeworld faces an existential threat, Wade must reluctantly suit-up again with an even more reluctant Wolverine.",
        releaseDate: "2024-07-24",
        title: "Deadpool & Wolverine",
        backdropPath: "/9l1eZiJHmhr5jIlthMdJN5WYoff.jpg",
        posterPath: "/8cdWjvZQUExUUTzyp4t6EDMubfO.jpg",
        voteAverage: 9.593,
        genreIds: [38,35,878]
      )
    ]
  }
}
