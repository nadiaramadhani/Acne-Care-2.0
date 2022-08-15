//
//  AcneLogsDefaultLocalDatastore.swift
//  ACNIFY
//
//  Created by Agus Budianto on 12/08/22.
//

import Foundation


final class AcneLogDefaultLocalDataStore: AcneLogLocalDataStore {
 
    private let container = PersistenceController.shared.container
    
    func getAcneLogsByUserID(userID: String) throws -> [AcneLog]? {
        let fetchRequest = AcneLog.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "userID == %@", userID)
        
        return try self.container.viewContext.fetch(fetchRequest)
    }
    
    func createNewAcneLog() -> AcneLog {
        let newAcneLog = AcneLog(context: container.viewContext)
        newAcneLog.id = UUID.init()
        newAcneLog.time = Date()
        
        return newAcneLog
    }
  
    func saveChanges() {
        try? self.container.viewContext.save()
    }
    
    func rollBack() {
        self.container.viewContext.rollback()
    }
    
}
