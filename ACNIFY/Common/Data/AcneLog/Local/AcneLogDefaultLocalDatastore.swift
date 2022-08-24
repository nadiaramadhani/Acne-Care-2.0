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
    
    func getTodayAcneLogByUserID(userID: String) throws -> [AcneLog]? {
        let fetchRequest = AcneLog.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "userID == %@ && time >= %@ && time <= %@", userID, Calendar.current.startOfDay(for: Date()) as CVarArg, Calendar.current.startOfDay(for: Date() + 86400) as CVarArg)
        
        return try self.container.viewContext.fetch(fetchRequest)
    }
    
    func getOldestAcneLogByUserID(userID: String) throws -> AcneLog? {
        let fetchRequest = AcneLog.fetchRequest()
        let sort = NSSortDescriptor(key: "time", ascending: true)
        
        fetchRequest.sortDescriptors = [sort]
        fetchRequest.fetchLimit = 1
        
        return  try self.container.viewContext.fetch(fetchRequest).first
    }
    
    func saveChanges() {
        do {
        try self.container.viewContext.save()
        } catch{
            print(error.localizedDescription)
        }
    }
    
    func rollBack() {
        self.container.viewContext.rollback()
    }
    
}
