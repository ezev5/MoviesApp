//
//  HomeGetTopRatedUseCaseTest.swift
//  MoviesAppTests
//
//  Created by Ezequiel Nicolas Velez on 22/09/2024.
//

import XCTest
import Combine
@testable import MoviesApp

final class HomeGetTopRatedUseCaseTest: XCTestCase {
  private var repository: MockHomeMovieRepository!
  private var sut: HomeGetTopRatedUseCase!
  private var cancellables: Set<AnyCancellable> = []

    override func setUp() {
      super.setUp()
      repository = MockHomeMovieRepository()
      sut = HomeGetTopRatedUseCase(repository: repository)
    }

    override func tearDown() {
      sut = nil
      repository = nil
      cancellables.removeAll()
      super.tearDown()
    }

    func testGetTopRatedSuccess() throws {
      // Given
      let didGetTopRatedMoviesList: XCTestExpectation = XCTestExpectation()
      let expectedResult: [Movie] = [
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

      var unsafeMovieList: [Movie]?
      repository.calls.getTopRatedRequest = false

      // When
      sut.execute()
        .sink(
          receiveCompletion: { completion in
            switch completion {
            case .finished:
              didGetTopRatedMoviesList.fulfill()
            case .failure(let error):
              XCTFail("Execute failed with error: \(error)")
            }
          }, receiveValue: { response in
            unsafeMovieList = response
          }
        )
        .store(in: &cancellables)

      // Then
      wait(for: [didGetTopRatedMoviesList], timeout: 2.0)
      let safeMovieList: [Movie] = try XCTUnwrap(unsafeMovieList)
      XCTAssertTrue(repository.calls.getTopRatedRequest)
      XCTAssertEqual(expectedResult.first?.id, safeMovieList.first?.id)
      XCTAssertEqual(expectedResult.first?.title , safeMovieList.first?.title)
      XCTAssertEqual(expectedResult.first?.posterPath, safeMovieList.first?.posterPath)
      XCTAssertEqual(expectedResult.first?.releaseDate, safeMovieList.first?.releaseDate)
      XCTAssertEqual(expectedResult.first?.voteAverage, safeMovieList.first?.voteAverage)
      XCTAssertEqual(expectedResult.first?.backdropPath, safeMovieList.first?.backdropPath)
      XCTAssertEqual(expectedResult.first?.overview, safeMovieList.first?.overview)
    }
  
  func testGetNowPlayingFails() throws {
    // Given
    let didFetchError: XCTestExpectation = XCTestExpectation()
    var unsafeError: Error?
    repository.calls.getTopRatedRequest = false
    repository.simulateError = true

    // When
    sut.execute()
      .sink(
        receiveCompletion: { completion in
          switch completion {
          case .finished:
            XCTFail("Execute finish")
          case .failure(let error):
            unsafeError = error
            didFetchError.fulfill()
          }
        }, receiveValue: { _ in }
      )
      .store(in: &cancellables)

    // Then
    wait(for: [didFetchError], timeout: 1.0)
    XCTAssertNotNil(unsafeError)
    XCTAssertTrue(repository.calls.getTopRatedRequest)
  }
}
