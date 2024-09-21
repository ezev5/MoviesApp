//
//  MovieEntity+CoreDataProperties.swift
//  MoviesApp
//
//  Created by Ezequiel Nicolas Velez on 20/09/2024.
//
//

import Foundation
import CoreData

/*
extension MovieEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MovieEntity> {
        return NSFetchRequest<MovieEntity>(entityName: "MovieEntity")
    }

    @NSManaged public var id: Int64
    @NSManaged public var releaseDate: String?
    @NSManaged public var overview: String?
    @NSManaged public var title: String?
    @NSManaged public var backdropPath: String?
    @NSManaged public var posterPath: String?
    @NSManaged public var voteAverage: Double
    @NSManaged public var category: NSSet?

}

// MARK: Generated accessors for category
extension MovieEntity {

    @objc(addCategoryObject:)
    @NSManaged public func addToCategory(_ value: CategoryEntity)

    @objc(removeCategoryObject:)
    @NSManaged public func removeFromCategory(_ value: CategoryEntity)

    @objc(addCategory:)
    @NSManaged public func addToCategory(_ values: NSSet)

    @objc(removeCategory:)
    @NSManaged public func removeFromCategory(_ values: NSSet)

}
*/
extension MovieEntity {
  convenience init(
    context: NSManagedObjectContext,
    id: Int,
    overview: String,
    releaseDate: String,
    title: String,
    backdropPath: String,
    posterPath: String,
    voteAverage: Double
  ) {
    self.init(context: context)
    self.id = Int64(id)
    self.overview = overview
    self.releaseDate = releaseDate
    self.title = title
    self.backdropPath = backdropPath
    self.posterPath = posterPath
    self.voteAverage = voteAverage
  }
}
