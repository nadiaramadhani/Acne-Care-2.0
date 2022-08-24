//
//  SummaryViewModel.swift
//  ACNIFY
//
//  Created by Agus Budianto on 23/08/22.
//

import Foundation
import SwiftUI
import SwiftUICharts

final class SummaryViewModel: ObservableObject{
    @Published var acneLogList: [AcneLog]?
    @Published var selectedDate: Date?
    @Published var selectedAcneLog: AcneLog?
    @Published var productUsedNightNames: [String] = []
    @Published var productUsedDayNames: [String] = []
    
    private let acneLogRepository: AcneLogDefaultRepository
    private let userProductRepository: UserProductRepository
    
    
    init(acneLogRepository: AcneLogDefaultRepository = AcneLogDefaultRepository(), userProductRepository: UserProductRepository = UserProductDefaultRepository()
    ){
        self.acneLogRepository = acneLogRepository
        self.userProductRepository = userProductRepository
    }
    
    func getAcnelogData(){
        self.acneLogList = acneLogRepository.getAcneLogsByUserID(userID: AuthenticationDefaultRepository.shared.userID!)
        
        guard let dateSelected = self.selectedDate else {return}
        
        self.selectedAcneLog = acneLogList?.filter{$0.image != nil && $0.type == UserProduct.nightRoutineType && $0.time! > dateSelected && $0.time! < dateSelected.dayAfter}.first
    }
    
    func getProductNameUsed(){
        let userProducts = userProductRepository.getAllUsedUserProduct(userID: AuthenticationDefaultRepository.shared.userID!)
        
        self.productUsedDayNames = userProducts.filter{$0.routineType == "day" && $0.isUsed && !$0.isLocked()}.map{
            let productId = Int($0.productDetailID)
            return UserProductDetail.getDefaultProduct().filter{$0.ID == productId}.first!.title
        }
        
        self.productUsedNightNames = userProducts.filter{$0.routineType == "night" && $0.isUsed && !$0.isLocked()}.map{
            let productId = Int($0.productDetailID)
            return UserProductDetail.getDefaultProduct().filter{$0.ID == productId}.first!.title
        }
        
    }
    
}
