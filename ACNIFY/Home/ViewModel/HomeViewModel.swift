//
//  HomeViewModel.swift
//  ACNIFY
//
//  Created by Agus Budianto on 10/08/22.
//

import Foundation

final class HomeViewModel: ObservableObject {
    @Published var currentUser: User?
    @Published var morningLog: AcneLog?
    @Published var nightLog: AcneLog?
    
    private let userRepository: UserRepository
    private let acneLogRepository: AcneLogRepository
    
    init(
        userRepository: UserRepository = UserDefaultRepository(),
        acneLogRepository: AcneLogRepository = AcneLogDefaultRepository()
    ){
        self.userRepository = userRepository
        self.acneLogRepository = acneLogRepository
        let logedinUserID  = AuthenticationDefaultRepository.shared.userID
        
        self.morningLog = acneLogRepository.getMorningAcneLogsByUserID(userID: logedinUserID!)
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
    
    func doMorningChecklist(){
        guard morningLog == nil else {return}
        
        let acnelogData = AcneLogData()
        acnelogData.type = "morning"
        
        let newAcnelog = acneLogRepository.createNewAcneLog(data: acnelogData)
        
        userRepository.addNewAcneLog(id: (currentUser?.id)!.uuidString, acneLog: newAcnelog)
        acneLogRepository.addAcneLogUnlockProductsByUserID(userID: (currentUser?.id)!.uuidString, acneLog: newAcnelog)
        
        acneLogRepository.saveChanges()
    }
    
    func doNightChecklist(){
        guard nightLog == nil else {return}
        
        let acnelogData = AcneLogData()
        acnelogData.type = "night"
        
        let newAcnelog = acneLogRepository.createNewAcneLog(data: acnelogData)
        userRepository.addNewAcneLog(id: (currentUser?.id)!.uuidString, acneLog: newAcnelog)
        acneLogRepository.addAcneLogUnlockProductsByUserID(userID: (currentUser?.id)!.uuidString, acneLog: newAcnelog)
        
        acneLogRepository.saveChanges()
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
