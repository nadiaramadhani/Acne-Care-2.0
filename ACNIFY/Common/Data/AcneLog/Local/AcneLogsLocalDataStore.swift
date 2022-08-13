//
//  AcneLogsLocalDataStore.swift
//  ACNIFY
//
//  Created by Agus Budianto on 11/08/22.
//

import Foundation

protocol AcneLogsLocalDataStore {
    func getAcneLogsByUserID(userId: String) throws -> [AcneLog]?
    func createNewAcneLog() -> AcneLog
}
