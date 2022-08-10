//
//  UserDefaultLocalDataStore.swift
//  ACNIFY
//
//  Created by Agus Budianto on 09/08/22.
//

import Foundation


final class UserDefaultLocalDataStore: UserLocalDataStore {
   
    private let container = PersistenceController.shared.container
    
    func getUserByName(name: String) throws -> User? {
        let fetchRequest = User.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "name == %@", name)
        
        return try self.container.viewContext.fetch(fetchRequest).first
    }

    func getUserByID(id: String) throws -> User? {
        let fetchRequest = User.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", id)
        
        return try self.container.viewContext.fetch(fetchRequest).first
    }
    
    func createNewUser() -> User {
        let user =  User(context: container.viewContext)
        user.id = UUID.init()
        
        return user
    }
    
    func saveChanges() {
        try? self.container.viewContext.save()
    }
    
    func rollback() {
        self.container.viewContext.rollback()
    }
    
    
}
