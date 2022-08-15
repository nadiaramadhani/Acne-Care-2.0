//
//  AcneLogProductLocalDataStore.swift
//  ACNIFY
//
//  Created by Agus Budianto on 11/08/22.
//

import Foundation

protocol UserProductLocalDataStore {
    func createNewAcneLogProduct() -> UserProduct
    func getAllProductByUserID(userID: String) throws -> [UserProduct]?
    func saveChanges()
    func rollBack()
}
