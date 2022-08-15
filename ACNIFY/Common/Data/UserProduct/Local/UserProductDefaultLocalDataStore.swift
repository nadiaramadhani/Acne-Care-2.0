//
//  AcneLogsProductDefaultLocalDataStore.swift
//  ACNIFY
//
//  Created by Agus Budianto on 13/08/22.
//

import Foundation


final class UserProductDefaultLocalDataStore: UserProductLocalDataStore {
    private let container = PersistenceController.shared.container

    func createNewAcneLogProduct() -> UserProduct {
        let newAcneLogProduct = UserProduct(context: container.viewContext)
        
        newAcneLogProduct.id = UUID.init()
        return newAcneLogProduct
    }
    
    func getAllProductByUserID(userID: String) throws -> [UserProduct]? {
        let fetchRequest = UserProduct.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "userID == %@", userID)
        
        return try self.container.viewContext.fetch(fetchRequest)
    }
    
    func saveChanges() {
        try? self.container.viewContext.save()
    }
    
    func rollBack() {
        self.container.viewContext.rollback()
    }
}
