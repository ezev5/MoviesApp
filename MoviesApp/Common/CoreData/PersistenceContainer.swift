//
//  PersistenceContainer.swift
//  MoviesApp
//
//  Created by Ezequiel Nicolas Velez on 20/09/2024.
//

import Foundation
import CoreData

struct PersistenceContainer {
  static let shared = PersistenceContainer()
  
  let container: NSPersistentContainer
  let containerName: String = "MovieDB"
  
  var context: NSManagedObjectContext {
    container.viewContext
  }
  
  init() {
    self.container = NSPersistentContainer(name: containerName)
    container.loadPersistentStores { description, error in
      if let error = error {
        print("error loading Core Data \(error)")
      }
    }
  }
}
