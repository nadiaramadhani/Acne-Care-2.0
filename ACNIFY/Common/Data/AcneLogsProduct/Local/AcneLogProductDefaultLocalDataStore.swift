//
//  AcneLogsProductDefaultLocalDataStore.swift
//  ACNIFY
//
//  Created by Agus Budianto on 13/08/22.
//

import Foundation


final class AcneLogProductDefaultLocalDataStore: AcneLogProductLocalDataStore {
    private let container = PersistenceController.shared.container

    func createNewAcneLogProduct() -> AcneLogProduct {
        let newAcneLogProduct = AcneLogProduct(context: container.viewContext)
        
        newAcneLogProduct.id = UUID.init()
        return newAcneLogProduct
    }
}
