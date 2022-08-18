//
//  AcneLogDefaultRepository.swift
//  ACNIFY
//
//  Created by Agus Budianto on 13/08/22.
//

import Foundation


final class AcneLogDefaultRepository: AcneLogRepository {
    private let acneLogLocalDataStore: AcneLogLocalDataStore
    private let userProductDataStore: UserProductLocalDataStore
    private let acneLogProductDataStore: AcneLogProductLocalDataSource
    
    init(
        acneLogLocalDataStore: AcneLogLocalDataStore = AcneLogDefaultLocalDataStore(),
        userProductDataStore: UserProductLocalDataStore = UserProductDefaultLocalDataStore(),
        acneLogProductDataStore: AcneLogProductLocalDataSource = AcneLogProductDefaultLocalDataSource()
    ){
        self.acneLogLocalDataStore = acneLogLocalDataStore
        self.userProductDataStore = userProductDataStore
        self.acneLogProductDataStore = acneLogProductDataStore
    }
    
    
    func createNewAcneLog(data: AcneLogData) -> AcneLog {
        let newAcneLog = acneLogLocalDataStore.createNewAcneLog()
        
        newAcneLog.userID = data.userID
        newAcneLog.id = UUID.init()
        newAcneLog.desc = data.description
        newAcneLog.condition = data.condition
        newAcneLog.type = data.type
        
        return newAcneLog
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
    
    func addAcneLogUnlockProductsByUserID(userID: String, acneLog: AcneLog) {
        guard let products = try? userProductDataStore.getAllProductByUserID(userID: AuthenticationDefaultRepository.shared.userID!) else {return}
        
        for userProduct in products {
            let newAcneLogProduct = acneLogProductDataStore.createNewAcneLogProduct()
            newAcneLogProduct.acneLog = acneLog
            
            newAcneLogProduct.acneLogID = acneLog.id
            newAcneLogProduct.desc = userProduct.desc
            newAcneLogProduct.name = userProduct.name
            
        }
    }
    
    func getMorningAcneLogsByUserID(userID: String) -> AcneLog? {
        do {
            guard let acneLogs = try acneLogLocalDataStore.getTodayAcneLogByUserID(userID: userID) else {return nil}
            
            return acneLogs.filter{$0.type == "morning"}.first
        } catch {
            print(error)
            return nil
        }
    }
    
    func getNightAcneLogsByUserID(userID: String) -> AcneLog? {
        do {
            guard let acneLogs = try acneLogLocalDataStore.getTodayAcneLogByUserID(userID: userID) else {return nil}
            
            return acneLogs.filter{$0.type == "night"}.first
        } catch {
            print(error)
            return nil
        }
    }
    
    func saveChanges() {
        acneLogLocalDataStore.saveChanges()
    }
    
    func rollBack() {
        acneLogLocalDataStore.rollBack()
    }
    
}



