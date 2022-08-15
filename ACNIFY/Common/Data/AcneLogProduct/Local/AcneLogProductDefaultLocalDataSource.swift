//
//  AcneLogProductDefaultLocalDataSource.swift
//  ACNIFY
//
//  Created by Agus Budianto on 15/08/22.
//

import Foundation

final class AcneLogProductDefaultLocalDataSource: AcneLogProductLocalDataSource {
    
    private let container = PersistenceController.shared.container

    func createNewAcneLogProduct() -> AcneLogProduct {
        let newAcneLogProduct = AcneLogProduct(context: container.viewContext)
        newAcneLogProduct.acneLogID = UUID.init()
        
        return newAcneLogProduct
    }
}
