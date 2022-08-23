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
    
    private let acneLogRepository: AcneLogDefaultRepository
    
    init(acneLogRepository: AcneLogDefaultRepository = AcneLogDefaultRepository()){
        self.acneLogRepository = acneLogRepository
    }
    
    func getAcnelogData(){
        self.acneLogList = acneLogRepository.getAcneLogsByUserID(userID: AuthenticationDefaultRepository.shared.userID!)
        
        guard let dateSelected = self.selectedDate else {return}
        
        self.selectedAcneLog = acneLogList?.filter{$0.image != nil && $0.type == UserProduct.nightRoutineType && $0.time! > dateSelected.dayBefore && $0.time! < dateSelected.dayAfter}.first
    }
   
}
