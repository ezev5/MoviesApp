//
//  HomeMovieLocalDataManager.swift
//  MoviesApp
//
//  Created by Ezequiel Nicolas Velez on 19/09/2024.
//

import Foundation
import CoreData

protocol HomeMovieLocalDataManagerProtocol {
  func getMovie(category: Category) -> [Movie]
  func saveMovies(movies: [Movie], category: Category)
}

final class HomeMovieLocalDataManager: HomeMovieLocalDataManagerProtocol {
  
  private let mapper: CoreDataMovieMapperProtocol
  private let container: PersistenceContainer
  
  init(
    mapper: CoreDataMovieMapperProtocol = CoreDataMovieMapper(),
    container: PersistenceContainer = PersistenceContainer.shared
  ) {
    self.mapper = mapper
    self.container = container
  }
  
  func saveMovies(movies: [Movie], category: Category) {
    let categoryFetchRequest: NSFetchRequest<CategoryEntity> = CategoryEntity.fetchRequest()
    categoryFetchRequest.predicate = NSPredicate(format: "name == %@", category.rawValue)
    do {
      var categoryEntity: CategoryEntity
      let fetchedCategories = try container.context.fetch(categoryFetchRequest)
      if let existingCategory = fetchedCategories.first {
        categoryEntity = existingCategory
      } else {
        categoryEntity = CategoryEntity(context: container.context, name: category.rawValue)
      }
      for movie in movies {
        let movieFetchRequest: NSFetchRequest<MovieEntity> = MovieEntity.fetchRequest()
        movieFetchRequest.predicate = NSPredicate(format: "id == %d", movie.id)
        
        let fetchedMovies = try container.context.fetch(movieFetchRequest)
        
        let movieEntity: MovieEntity
        if let existingMovie = fetchedMovies.first {
          movieEntity = existingMovie
        } else {
          movieEntity = mapper.transform(from: movie, context: container.context)
        }
        
        movieEntity.addToCategory(categoryEntity)
        categoryEntity.addToMovies(movieEntity)
      }
      
      try container.context.save()
      print("Movies and category saved")
      
    } catch let error {
      print("Fail to save movies: \(error)")
    }
  }
  
  func getMovie(category: Category) -> [Movie] {
    let fetchRequest: NSFetchRequest<MovieEntity> = MovieEntity.fetchRequest()
    fetchRequest.predicate = NSPredicate(format: "ANY categories.name == %@", category.rawValue)
    do {
      let movies: [MovieEntity] = try container.context.fetch(fetchRequest)
      return movies.map({mapper.transform(from: $0)})
    } catch let error {
      print("Error fetching movies: \(error)")
      return []
    }
  }
}
