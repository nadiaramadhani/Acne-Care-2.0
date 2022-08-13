//
//  AcneLogProductLocalDataStore.swift
//  ACNIFY
//
//  Created by Agus Budianto on 11/08/22.
//

import Foundation

protocol AcneLogProductLocalDataStore {
    func createNewAcneLogProduct() -> AcneLogProduct
    func getAllProductByUserID(userID: String) throws -> [AcneLogProduct]?
    func saveChanges()
    func rollBack()
}
