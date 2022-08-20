//
//  DailyCheckListViewModel.swift
//  ACNIFY
//
//  Created by Agus Budianto on 14/08/22.
//

import Foundation

final class ChooseProductViewModel: ObservableObject {
    
    @Published var userDayProducts: [UserProduct] =  [UserProduct]()
    @Published var userNightProducts: [UserProduct] =  [UserProduct]()
    @Published var productDayChecked: [Bool] = [Bool]()
    @Published var productNightChecked: [Bool] = [Bool]()
    
    private let logedInUserID: String
    private let userProductRepository: UserProductRepository
    
    init(userProductRepository: UserProductRepository = UserProductDefaultRepository()){
        self.logedInUserID = AuthenticationDefaultRepository.shared.userID!
        self.userProductRepository = userProductRepository
    }
    
    public func getAllUserProducts() {
        let userProducts = self.userProductRepository.getAllUserProduct(userID: self.logedInUserID)
        
        self.userDayProducts = userProducts.filter{$0.routineType == "day"}.sorted(by: {
            $0.dayCountToUnlocked() < $1.dayCountToUnlocked()
        })
        self.userNightProducts = userProducts.filter{$0.routineType == "night"}.sorted(by: {
            $0.dayCountToUnlocked() < $1.dayCountToUnlocked()
        })
        
        self.productDayChecked = userDayProducts.map{$0.isUsed}
        self.productNightChecked = userNightProducts.map{$0.isUsed}
        
    }
    

    
    public func saveChanges(){
        var i = 0
        for product in self.userDayProducts{
            product.isUsed = productDayChecked[i]
            i += 1
        }
        
        i = 0
        for product in self.userNightProducts{
            product.isUsed = productNightChecked[i]
            i += 1
        }
        
        userProductRepository.saveChanges()
    }
    
    public func rollBack(){
        userProductRepository.rollBack()
    }
}
