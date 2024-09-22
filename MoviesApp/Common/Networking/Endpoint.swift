//
//  Endpoints.swift
//  MoviesApp
//
//  Created by Ezequiel Nicolas Velez on 19/09/2024.
//

import Foundation

enum Endpoint {
  private static let bearerToken: String =  "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmYzQ4YmI4M2FjZmVlOWJiZDhhNDM2MTNkODJhOWFmZiIsIm5iZiI6MTcyNjY3MjU1OS45MTYwOTEsInN1YiI6IjY2ZWFlZGNjNTE2OGE4OTZlMTFmNzM1YyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.jkOLxqhUagjn-5Dbm49uMMk1VjaCNLP-9LWwq_6r4T0"
  private static let baseURL: String = "https://api.themoviedb.org/3/movie/"
  private static let popularPath: String = "popular"
  private static let nowPlayingPath: String = "now_playing"
  private static let upcomingPath: String = "upcoming"
  private static let topRatedPath: String = "top_rated"
  private static let genresPath: String = "genre/movie/list"
  private static let searchPath: String = "https://api.themoviedb.org/3/search/movie"
  private static let videoPath: String = "/videos"
  
  case popular
  case nowPlaying
  case upComing
  case topRated
  case search
  case videoId(Int)
  
  var servicePath: String {
    switch self {
    case .popular: return Endpoint.baseURL + Endpoint.popularPath
    case .nowPlaying: return Endpoint.baseURL + Endpoint.nowPlayingPath
    case .upComing: return Endpoint.baseURL + Endpoint.upcomingPath
    case .topRated: return Endpoint.baseURL + Endpoint.topRatedPath
    case .search: return Endpoint.searchPath
    case .videoId(let movieId): return Endpoint.baseURL + "\(movieId)" + Endpoint.videoPath
    }
  }
  
  var authorizationToken: String {
    return Endpoint.bearerToken
  }
}
