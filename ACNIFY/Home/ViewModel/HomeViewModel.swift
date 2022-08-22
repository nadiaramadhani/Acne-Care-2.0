//
//  HomeViewModel.swift
//  ACNIFY
//
//  Created by Agus Budianto on 10/08/22.
//

import Foundation

final class HomeViewModel: ObservableObject {
    @Published var currentUser: User?
    @Published var dayLog: AcneLog?
    @Published var nightLog: AcneLog?
    @Published var totalWeekSinceFirstLog = ""
    @Published var isNightProductCreated = false
    @Published var isDayProductCreated = false

    private let userRepository: UserRepository
    private let acneLogRepository: AcneLogRepository
    private let userProductRepository: UserProductRepository
    
    init(
        userRepository: UserRepository = UserDefaultRepository(),
        acneLogRepository: AcneLogRepository = AcneLogDefaultRepository(),
        userProductRepository: UserProductRepository = UserProductDefaultRepository()
    ){
        self.userRepository = userRepository
        self.acneLogRepository = acneLogRepository
        self.userProductRepository = userProductRepository
        let logedinUserID  = AuthenticationDefaultRepository.shared.userID
        
        self.dayLog = acneLogRepository.getDayAcneLogsByUserID(userID: logedinUserID!)
        self.nightLog = acneLogRepository.getNightAcneLogsByUserID(userID: logedinUserID!)
        self.currentUser = userRepository.getUserByID(id: logedinUserID!)
        
    }
    
    func getGraphicData() -> [Date:Int]?{
        guard let logs = self.acneLogRepository.getAcneLogsByUserID(userID: (currentUser?.id)!.uuidString) else {return nil}
        
        var data : [Date : Int] = [:]
        
        for log in logs {
            if log.condition == nil  || log.time == nil {
                continue
            }
            
            data[log.time!] = logConditionToNumber(condition: log.condition!)
        }
        
        return data
    }
    
    func doDayChecklist(){
        guard dayLog == nil else {return}
        
        let acnelogData = AcneLogData()
        acnelogData.type = "day"
        acnelogData.userID = (currentUser?.id)!
        
        let newAcnelog = acneLogRepository.createNewAcneLog(data: acnelogData)
        
        userRepository.addNewAcneLog(id: (currentUser?.id)!.uuidString, acneLog: newAcnelog)
        acneLogRepository.addAcneLogUnlockProductsByUserID(userID: (currentUser?.id)!.uuidString, acneLog: newAcnelog)
        
        acneLogRepository.saveChanges()
        self.dayLog = newAcnelog
    }
    
    func doNightChecklist(){
        guard nightLog == nil else {return}
        
        let acnelogData = AcneLogData()
        acnelogData.type = "night"
        acnelogData.userID = (currentUser?.id)!
        
        let newAcnelog = acneLogRepository.createNewAcneLog(data: acnelogData)
        userRepository.addNewAcneLog(id: (currentUser?.id)!.uuidString, acneLog: newAcnelog)
        acneLogRepository.addAcneLogUnlockProductsByUserID(userID: (currentUser?.id)!.uuidString, acneLog: newAcnelog)
        
        
        acneLogRepository.saveChanges()
        self.nightLog = newAcnelog
    }
    
    func getTotalWeekElapsed(){
        guard let userID = currentUser?.id?.uuidString else {return}
        let totalDaySinceFirstLog = acneLogRepository.getDayCountSinceFirstLog(userID: userID)
        
        if totalDaySinceFirstLog < 7 {
            totalWeekSinceFirstLog = "This is your first week journey"
        } else {
            totalWeekSinceFirstLog = "It's been \(totalDaySinceFirstLog / 7) weeks keep going!"
        }
    }
    
    func createNightProduct(){
        userProductRepository.createNightDefaultProduct(userID: (currentUser?.id)!.uuidString)
    }
    
    func createDayProduct(){
        userProductRepository.createDayDefaultProduct(userID: (currentUser?.id)!.uuidString)
    }
    
    
    func checkChecklistAvailablility(){
        let userProducts  = userProductRepository.getAllUsedUserProduct(userID: AuthenticationDefaultRepository.shared.userID!)

        
        if userProducts.filter({$0.routineType == UserProduct.dayRoutineType}).count > 0 {
            isDayProductCreated = true
        }
        
        if userProducts.filter({$0.routineType == UserProduct.nightRoutineType}).count > 0 {
            isNightProductCreated = true
        }
    }
    
    private func logConditionToNumber(condition: String) -> Int {
        switch condition.lowercased(){
        case "better":
            return 3
        case "same":
            return 2
        case "worst":
            return 1
        default:
            return 1
        }
    }
}
