//
//  AcneLogProductRepository.swift
//  ACNIFY
//
//  Created by Agus Budianto on 13/08/22.
//

import Foundation

protocol AcneLogProductRepository{
    func getAllUsedUserProduct(userID: String) -> [AcneLogProduct]
    func getAllUserProduct(userID: String) -> [AcneLogProduct]
    func saveChanges()
    func rollBack()
}



class AddNewProductData {
    var userID: String = ""
    var name: String = ""
    var isUsed: Bool = false
    var productDetailID:Int = 0
}
