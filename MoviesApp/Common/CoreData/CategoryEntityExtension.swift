//
//  CategoryEntityExtension.swift
//  MoviesApp
//
//  Created by Ezequiel Nicolas Velez on 20/09/2024.
//
//

import Foundation
import CoreData

extension CategoryEntity {
  convenience init(
    context: NSManagedObjectContext,
    name: String
  ) {
    self.init(context: context)
    self.name = name
  }
}
