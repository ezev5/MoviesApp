//
//  Video.swift
//  MoviesApp
//
//  Created by Ezequiel Nicolas Velez on 21/09/2024.
//

import Foundation

struct Video: Decodable {
  let key: String
  let type: String
}

struct VideoList: Decodable {
  let results: [Video]
  let page: Int?
  
  public init(results: [Video], page: Int?) {
    self.results = results
    self.page = page
  }
}
