//
//  AcneLogRepository.swift
//  ACNIFY
//
//  Created by Agus Budianto on 13/08/22.
//

import Foundation

protocol AcneLogRepository{
    func getAcneLogsByUserID(userID: String) -> [AcneLog]?
    func createNewAcneLog(data: AcneLogData)
    func saveChanges()
    func rollBack()
}

class AcneLogData {
        var userID: UUID?
        var condition: String = ""
        var description: String = ""
        var imageData: Data?
        var type: String = ""
}
