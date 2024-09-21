//
//  Movie.swift
//  MoviesApp
//
//  Created by Ezequiel Nicolas Velez on 18/09/2024.
//

import Foundation

//TODO: me faltaria el nombre de la categoria,el runtime, el video
struct Movie: Codable, Identifiable, Hashable {
  
  var id: Int
  var overview: String
  var releaseDate: String
  var title: String
  var backdropPath: String?
  var posterPath: String?
  var voteAverage: Double
  var genreIds: [Int]
  
  enum CodingKeys: String, CodingKey {
    case id
    case overview
    case releaseDate = "release_date"
    case title
    case backdropPath = "backdrop_path"
    case posterPath = "poster_path"
    case voteAverage = "vote_average"
    case genreIds = "genre_ids"
  }
  
  public init(
    id: Int,
    overview: String,
    releaseDate: String,
    title: String,
    backdropPath: String,
    posterPath: String,
    voteAverage: Double,
    genreIds: [Int]
  ) {
    self.id = id
    self.overview = overview
    self.releaseDate = releaseDate
    self.title = title
    self.backdropPath = backdropPath
    self.posterPath = posterPath
    self.voteAverage = voteAverage
    self.genreIds = genreIds
  }
}

struct MovieList: Decodable {
  let results: [Movie]
  let page: Int?
  
  public init(results: [Movie], page: Int?) {
    self.results = results
    self.page = page
  }
}
