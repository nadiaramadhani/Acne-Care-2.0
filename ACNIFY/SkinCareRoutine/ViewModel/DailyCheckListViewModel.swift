//
//  DailyCheckListViewModel.swift
//  ACNIFY
//
//  Created by Agus Budianto on 14/08/22.
//

import Foundation

final class DailyCheckListViewModel: ObservableObject {
    
    @Published var userProducts: [UserProduct] =  [UserProduct]()
    @Published var productChecked: [Bool] = [Bool]()
    
    private let logedInUserID: String
    private let userProductRepository: UserProductRepository
    
    init(userProductRepository: UserProductRepository = UserProductDefaultRepository()){
        self.logedInUserID = AuthenticationDefaultRepository.shared.userID!
        self.userProductRepository = userProductRepository
    }
    
    private func getAllUserProducts() -> [UserProduct] {
        let userProducts = self.userProductRepository.getAllUserProduct(userID: self.logedInUserID)
        
        return userProducts
    }
    
    public func getUserProductData() {
        self.userProducts = self.getAllUserProducts()
        productChecked = self.userProducts.map{$0.isUsed}
    }
    
    public func saveChanges(){
        var i = 0
        for product in self.userProducts{
            product.isUsed = productChecked[i]
            i += 1
        }
        
        userProductRepository.saveChanges()
    }
    
    public func rollBack(){
        userProductRepository.rollBack()
    }
}
