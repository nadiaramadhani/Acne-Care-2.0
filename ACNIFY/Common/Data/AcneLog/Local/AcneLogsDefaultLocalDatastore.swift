//
//  AcneLogsDefaultLocalDatastore.swift
//  ACNIFY
//
//  Created by Agus Budianto on 12/08/22.
//

import Foundation


final class AcneLogsDefaultLocalDatastore: AcneLogsLocalDataStore {
    
    private let container = PersistenceController.shared.container
    
    func getAcneLogsByUserID(userId: String) throws -> [AcneLog]? {
        let fetchRequest = AcneLog.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", userId)
        
        return try self.container.viewContext.fetch(fetchRequest)
    }
    
    func createNewAcneLog() -> AcneLog {
        let newAcneLog = AcneLog(context: container.viewContext)
        newAcneLog.id = UUID.init()
        newAcneLog.time = Date()
        
        return newAcneLog
    }
    
    
}
