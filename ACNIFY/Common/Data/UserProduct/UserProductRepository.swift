//
//  AcneLogProductRepository.swift
//  ACNIFY
//
//  Created by Agus Budianto on 13/08/22.
//

import Foundation

protocol UserProductRepository{
    func getAllUsedUserProduct(userID: String) -> [UserProduct]
    func createDefaultProduct(userID: String)
    func getAllUserProduct(userID: String) -> [UserProduct]
    func saveChanges()
    func rollBack()
}



struct AddNewProductData {
    var userID: String = ""
    var name: String = ""
    var isUsed: Bool = false
    var productDetailID:Int = 0
}


struct UserProductDetail {
   
    var ID: Int = 0
    var title: String = ""
    var image: String = ""
    var description: String = ""
    var daysCountToUnlock: Int = 0
    
    func getImageName(routineType: String) -> String {
        switch routineType {
        case UserProduct.dayRoutineType:
            return routineType+self.image
        case UserProduct.nightRoutineType:
            return routineType+self.image
        default:
            return ""
        }
    }
    
    static func getDefaultProduct() -> [UserProductDetail] {
        return [
            UserProductDetail(ID: 1, title: "Facial Wash", image: "FacialWash", description: "Wash your face with gentle face wash", daysCountToUnlock: 0),
            UserProductDetail(ID: 2, title: "Oil Cleanser", image: "OilCleanser", description: "effectively clean the skin without stripping it or weighing it down.", daysCountToUnlock: 7),
            UserProductDetail(ID: 3, title: "Toner", image: "Toner", description: "gently refresh your skin without stripping it of its natural moisture.", daysCountToUnlock: 35),
            UserProductDetail(ID: 4, title: "Serum", image: "Serum", description: "contain a higher concentration of active ingredients", daysCountToUnlock: 28),
            UserProductDetail(ID: 5, title: "Moisturizer", image: "Moisturizer", description: "Always make sure to hyrated your skin", daysCountToUnlock: 14),
            UserProductDetail(ID: 6, title: "Acne Treatment", image: "AcneTreatment", description: "Treatments work to clear away bacteria and dry up the excess oils that lead to acne.", daysCountToUnlock: 21)

        ]
    }
}


extension UserProduct {
    static let dayRoutineType: String = "day"
    static let nightRoutineType: String = "night"
    
    func isLocked() -> Bool {
        return self.dayCountToUnlocked() > 0
    }
    
    func dayCountToUnlocked() -> Int {
        
        guard let createdDate = self.created_at else  {return 0}
        
        let totalDateElapsed = Date.now.days(sinceDate: createdDate) ?? 0
        
        let productDetail = UserProductDetail.getDefaultProduct().filter{
            $0.ID == self.productDetailID
        }.first!
        
        return productDetail.daysCountToUnlock - totalDateElapsed
    }
}
