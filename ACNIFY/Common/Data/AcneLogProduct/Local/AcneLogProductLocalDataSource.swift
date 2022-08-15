//
//  AcneLogProductLocalDataStore.swift
//  ACNIFY
//
//  Created by Agus Budianto on 15/08/22.
//

import Foundation

protocol AcneLogProductLocalDataSource {
    func createNewAcneLogProduct() -> AcneLogProduct
}
