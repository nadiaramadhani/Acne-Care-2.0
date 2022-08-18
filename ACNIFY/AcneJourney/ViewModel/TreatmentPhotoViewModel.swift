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
    private let userProductRepository: UserProductRepository
    
    init(
        acneLogRepository: AcneLogRepository = AcneLogDefaultRepository(),
        userRepository: UserRepository = UserDefaultRepository(),
        userProductRepositroy: UserProductRepository = UserProductDefaultRepository()
    ){
        self.acneLogRepository = acneLogRepository
        self.userRepository = userRepository
        self.userProductRepository = userProductRepositroy
        
        self.acneLog = acneLogRepository.createNewAcneLog(data: AcneLogData())
        self.currentUserID =  AuthenticationDefaultRepository.shared.userID!
    }
    
    func saveChanges(){
        guard let currentAcneLog = self.acneLog else{return}
        acneLogRepository.saveChanges()
    }
    
    func cancelChanges(){
        acneLogRepository.rollBack()
    }
    
}
