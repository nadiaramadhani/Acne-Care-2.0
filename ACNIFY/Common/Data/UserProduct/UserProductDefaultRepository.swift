//
//  AcneLogProductDefaultRepository.swift
//  ACNIFY
//
//  Created by Agus Budianto on 13/08/22.
//

import Foundation

final class UserProductDefaultRepository: UserProductRepository {
 
    private let userProductLocalDataSource: UserProductLocalDataStore
    private let userLocalDataStore: UserLocalDataStore
    
    init(
        acneLogProductLocalDataSource: UserProductLocalDataStore = UserProductDefaultLocalDataStore(),
        userLocalDataStore: UserLocalDataStore = UserDefaultLocalDataStore()
    ) {
        self.userProductLocalDataSource = acneLogProductLocalDataSource
        self.userLocalDataStore = userLocalDataStore
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
        userProductLocalDataSource.saveChanges()
    }
    
    func rollBack() {
        userProductLocalDataSource.rollBack()
    }
    
    private func getAllAcneLogProductsByUserID(userID: String) -> [UserProduct] {
        do {
            guard let products = try userProductLocalDataSource.getAllProductByUserID(userID: userID) else {return[]}
            
            return products
        }catch{
            print(error)
            return []
        }
    }
    
    func createDefaultProduct(userID: String) {
//        self.createNightDefaultProduct(userID: userID)
//        self.createDayDefaultProduct(userID: userID)
    }
    
    func createNightDefaultProduct(userID: String) {
        guard let currentUser = try? userLocalDataStore.getUserByID(id: userID) else {return}
        
        guard let listProducts = try? userProductLocalDataSource.getAllProductByUserID(userID: userID) else {return}
        
        guard listProducts.filter({$0.routineType == UserProduct.nightRoutineType}).isEmpty else {return}
        
        
        let productDefaults = UserProductDetail.getDefaultProduct()
        for productDetail in productDefaults {
            let newProductDay = userProductLocalDataSource.createNewAcneLogProduct()
            newProductDay.routineType = UserProduct.nightRoutineType
            newProductDay.userID = UUID.init(uuidString: userID)
            newProductDay.isUsed = true
            newProductDay.created_at = Date.now
            newProductDay.productDetailID = Int16(productDetail.ID)
            newProductDay.user = currentUser
            currentUser.addToProducts(newProductDay)
        }
        
   
        
        userProductLocalDataSource.saveChanges()
    }
    
    func createDayDefaultProduct(userID: String) {
        guard let currentUser = try? userLocalDataStore.getUserByID(id: userID) else {return}
        
        guard let listProducts = try? userProductLocalDataSource.getAllProductByUserID(userID: userID) else {return}
        
        guard listProducts.filter({$0.routineType == UserProduct.dayRoutineType}).isEmpty else {return}
        
        
        let productDefaults = UserProductDetail.getDefaultProduct()
        
        for productDetail in productDefaults {
            let newProductDay = userProductLocalDataSource.createNewAcneLogProduct()
            newProductDay.routineType = UserProduct.dayRoutineType
            newProductDay.userID = UUID.init(uuidString: userID)
            newProductDay.isUsed = true
            newProductDay.created_at = Date.now
            newProductDay.productDetailID = Int16(productDetail.ID)
            newProductDay.user = currentUser
            currentUser.addToProducts(newProductDay)
        }
        
        userProductLocalDataSource.saveChanges()
    }
}
