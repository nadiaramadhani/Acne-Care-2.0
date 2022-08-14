//
//  AcneLogProductRepository.swift
//  ACNIFY
//
//  Created by Agus Budianto on 13/08/22.
//

import Foundation

protocol UserProductRepository{
    func getAllUsedUserProduct(userID: String) -> [UserProduct]
    func getAllUserProduct(userID: String) -> [UserProduct]
    func saveChanges()
    func rollBack()
}



class AddNewProductData {
    var userID: String = ""
    var name: String = ""
    var isUsed: Bool = false
    var productDetailID:Int = 0
}
