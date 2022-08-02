//
//  PersistanceController.swift
//  ACNIFY
//
//  Created by Agus Budianto on 01/08/22.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    let container: NSPersistentContainer

    init(_ storageType: StorageType = .persistent) {

        container = NSPersistentContainer(name: "CoreDataNadia")

        if storageType == .inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }

        container.loadPersistentStores(completionHandler: { (_, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
    }

    enum StorageType {
        case persistent
        case inMemory
    }
}


extension NSPersistentContainer {

    var updateContext: NSManagedObjectContext {
        let context = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
        context.parent = self.viewContext
        return context
    }

}
