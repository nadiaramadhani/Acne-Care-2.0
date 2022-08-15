//
//  AcneLogProductDefaultRepository.swift
//  ACNIFY
//
//  Created by Agus Budianto on 13/08/22.
//

import Foundation

final class UserProductDefaultRepository: UserProductRepository {
    
    private let acneLogProductLocalDataSource: AcneLogProductLocalDataStore
    
    init(acneLogProductLocalDataSource: AcneLogProductLocalDataStore = AcneLogProductDefaultLocalDataStore()) {
        self.acneLogProductLocalDataSource = acneLogProductLocalDataSource
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
        acneLogProductLocalDataSource.saveChanges()
    }
    
    func rollBack() {
        acneLogProductLocalDataSource.rollBack()
    }
    
    private func getAllAcneLogProductsByUserID(userID: String) -> [UserProduct] {
        do {
            guard let acnelogProducts = try acneLogProductLocalDataSource.getAllProductByUserID(userID: userID) else {return[]}
            
            return acnelogProducts
        }catch{
            print(error)
            return []
        }
    }
}
