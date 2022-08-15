//
//  TreatmentPhotoViewModel.swift
//  ACNIFY
//
//  Created by Agus Budianto on 15/08/22.
//

import Foundation


final class TreatmentPhotoViewModel: ObservableObject{
    @Published var acneLog: AcneLog?
    private var currentUserID: String

    
    private let acneLogRepository: AcneLogRepository
    private let userRepository: UserRepository
    
    init(acneLogRepository: AcneLogRepository = AcneLogDefaultRepository(), userRepository: UserRepository = UserDefaultRepository()){
        self.acneLogRepository = acneLogRepository
        self.userRepository = userRepository
        
        self.acneLog = acneLogRepository.createNewAcneLog(data: AcneLogData())
        self.currentUserID =  AuthenticationDefaultRepository.shared.userID!
    }
    
    func saveChanges(){
        guard let currentLog = self.acneLog else{return}
        
        userRepository.addNewAcneLog(id: currentUserID, acneLog: currentLog)
        acneLogRepository.saveChanges()
    }
    
    func cancelChanges(){
        acneLogRepository.rollBack()
    }
    
}
