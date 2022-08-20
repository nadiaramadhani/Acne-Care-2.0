//
//  AcneLogsLocalDataStore.swift
//  ACNIFY
//
//  Created by Agus Budianto on 11/08/22.
//

import Foundation

protocol AcneLogLocalDataStore {
    func getAcneLogsByUserID(userID: String) throws -> [AcneLog]?
    func getOldestAcneLogByUserID(userID: String) throws -> AcneLog?
    func getTodayAcneLogByUserID(userID: String) throws -> [AcneLog]?
    func createNewAcneLog() -> AcneLog
    func saveChanges()
    func rollBack()
}
