//
//  Genre.swift
//  MoviesApp
//
//  Created by Ezequiel Nicolas Velez on 18/09/2024.
//

import Foundation

struct Genre: Codable, Hashable {
    let id: Int
    let name: String

    public init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
}

struct GenreList: Codable {
    let genres: [Genre]

    public init(genres: [Genre]) {
        self.genres = genres
    }
}
