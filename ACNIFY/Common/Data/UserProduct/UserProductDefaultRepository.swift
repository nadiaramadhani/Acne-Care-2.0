//
//  AcneLogProductDefaultRepository.swift
//  ACNIFY
//
//  Created by Agus Budianto on 13/08/22.
//

import Foundation

final class UserProductDefaultRepository: UserProductRepository {
    
    private let UserProductLocalDataSource: UserProductLocalDataStore
    
    init(acneLogProductLocalDataSource: UserProductLocalDataStore = UserProductDefaultLocalDataStore()) {
        self.UserProductLocalDataSource = acneLogProductLocalDataSource
    }
    
    func getAllUsedUserProduct(userID: String) -> [UserProduct] {
        let usedProducts = self.getAllAcneLogProductsByUserID(userID: userID).filter{$0.isUsed}
        return usedProducts
    }
    
    func getAllUserProduct(userID: String) -> [UserProduct] {
        let unlockedProduct = self.getAllAcneLogProductsByUserID(userID: userID)
        return unlockedProduct
    }
    
    func saveChanges() {
        UserProductLocalDataSource.saveChanges()
    }
    
    func rollBack() {
        UserProductLocalDataSource.rollBack()
    }
    
    private func getAllAcneLogProductsByUserID(userID: String) -> [UserProduct] {
        do {
            guard let products = try UserProductLocalDataSource.getAllProductByUserID(userID: userID) else {return[]}
            
            return products
        }catch{
            print(error)
            return []
        }
    }
}
