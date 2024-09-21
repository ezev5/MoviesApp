//
//  CategoryEntity+CoreDataProperties.swift
//  MoviesApp
//
//  Created by Ezequiel Nicolas Velez on 20/09/2024.
//
//

import Foundation
import CoreData

/*
extension CategoryEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CategoryEntity> {
        return NSFetchRequest<CategoryEntity>(entityName: "CategoryEntity")
    }

}

// MARK: Generated accessors for movies
extension CategoryEntity {

    @objc(addMoviesObject:)
    @NSManaged public func addToMovies(_ value: MovieEntity)

    @objc(removeMoviesObject:)
    @NSManaged public func removeFromMovies(_ value: MovieEntity)

    @objc(addMovies:)
    @NSManaged public func addToMovies(_ values: NSSet)

    @objc(removeMovies:)
    @NSManaged public func removeFromMovies(_ values: NSSet)

}*/

extension CategoryEntity {
  convenience init(
    context: NSManagedObjectContext,
    name: String
  ) {
    self.init(context: context)
    self.name = name
  }
}
