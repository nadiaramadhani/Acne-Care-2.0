//
//  TreatmentPhotoViewModel.swift
//  ACNIFY
//
//  Created by Agus Budianto on 15/08/22.
//

import Foundation


final class TreatmentPhotoViewModel: ObservableObject{
    @Published var acneLog: AcneLog?
    @Published var acneLogDesc: String = ""
    @Published var acneLogCondition: String = ""
    @Published var selectedEmoji: String = ""
    
    @Published var isAcneGoneQuickAnswerSelected: Bool = false
    @Published var isAcneGetDryerQuickAnswerSelected : Bool = false
    @Published var isAcneStreakQuickAnswerSelected: Bool = false
    @Published var isAcneAPimpleAppearsQuickAnswerSelected  : Bool = false
    @Published var isAcneRedPimpleQuickAnswerSelected : Bool = false
    
    
    private var currentUserID: String
    private let acneLogRepository: AcneLogRepository
    private let userRepository: UserRepository
    private let userProductRepository: UserProductRepository
    
    init(
        acneLogRepository: AcneLogRepository = AcneLogDefaultRepository(),
        userRepository: UserRepository = UserDefaultRepository(),
        userProductRepositroy: UserProductRepository = UserProductDefaultRepository(),
        acneLog: AcneLog?
    ){
        self.acneLogRepository = acneLogRepository
        self.userRepository = userRepository
        self.userProductRepository = userProductRepositroy
        self.acneLog = acneLog
        
        self.currentUserID =  AuthenticationDefaultRepository.shared.userID!
    }
    
    func saveChanges(){
        acneLog?.condition = self.acneLogCondition
        acneLog?.desc = self.acneLogDesc
        acneLogRepository.saveChanges()
}
    
    func cancelChanges(){
        acneLogRepository.rollBack()
    }
    
}


extension TreatmentPhotoViewModel {
    static let emojiBetter : String = "😁"
    static let emojiNormal : String = "🙂"
    static let emojiWorst : String = "🙁"
    
    static let acneGoneQuickAnswer = "Acne was gone"
    static let acneGetDryerQuickAnswer = "My face get drier"
    static let acneStreakQuickAnswer = "Streak"
    static let acneAPimpleAppearsQuickAnswer  = "A pimple appears"
    static let acneRedPimpleQuickAnswer = "Red pimple"
    
    static func getEmojiScore(emoji: String) -> Int {
        switch emoji {
        case emojiWorst:
            return 1
        case emojiNormal:
            return 2
        case emojiBetter:
            return 3
        default:
            return 1
        }
    }
    
    static func getEmojiName(emoji: String) -> String {
        switch emoji {
        case emojiWorst:
            return "worst"
        case emojiNormal:
            return "normal"
        case emojiBetter:
            return "better"
        default:
            return "worst"
        }
    }
}
