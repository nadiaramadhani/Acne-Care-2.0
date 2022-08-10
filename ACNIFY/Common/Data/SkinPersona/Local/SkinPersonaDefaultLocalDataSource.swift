//
//  SkinPersonaDefaultLocalDataSource.swift
//  ACNIFY
//
//  Created by Agus Budianto on 09/08/22.
//

import Foundation


final class SkinPersonaDefaultLocalDataSource: SkinPersonaLocalDataStore {
    private let container = PersistenceController.shared.container

    func getSkinPersonasByUserID(id: String) throws -> [SkinPersona]? {
        let fetchRequest = SkinPersona.fetchRequest()
        fetchRequest.predicate =  NSPredicate(format: "userID == %@", id)
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "createdAt", ascending: false)]
        
        return try self.container.viewContext.fetch(fetchRequest)
    }
    
    func createNewSkinPersona() -> SkinPersona {
        let newSkinPersona = SkinPersona(context: container.viewContext)
        newSkinPersona.id = UUID.init()
        
        return newSkinPersona
    }
    
    func saveChanges() {
        try? self.container.viewContext.save()
    }
    
    func rollBack() {
        self.container.viewContext.rollback()
    }
    
    
}
