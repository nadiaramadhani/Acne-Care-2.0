//
//  AcneLogDefaultRepository.swift
//  ACNIFY
//
//  Created by Agus Budianto on 13/08/22.
//

import Foundation


final class AcneLogDefaultRepository: AcneLogRepository {
    
    private let acneLogLocalDataStore: AcneLogLocalDataStore
    
    init(acneLogLocalDataStore: AcneLogLocalDataStore = AcneLogDefaultLocalDataStore()){
        self.acneLogLocalDataStore = acneLogLocalDataStore
    }
    
    func createNewAcneLog(data: AcneLogData) {
        
    }
    
    func getAcneLogsByUserID(userID: String) -> [AcneLog]? {
        do {
            guard let acneLogs = try acneLogLocalDataStore.getAcneLogsByUserID(userID: userID) else {return []}
            
            return acneLogs
        } catch {
            print(error)
            return []
        }
    }
    
    func saveChanges() {
        acneLogLocalDataStore.saveChanges()
    }
    
    func rollBack() {
        acneLogLocalDataStore.rollBack()
    }
    
    
}



