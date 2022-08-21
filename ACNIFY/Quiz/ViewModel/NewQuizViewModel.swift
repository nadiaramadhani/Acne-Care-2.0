//
//  NewQuizViewModel.swift
//  ACNIFY
//
//  Created by Agus Budianto on 21/08/22.
//

import Foundation


final class NewQuizViewModel: ObservableObject {
    @Published var poresSkinAnswer = ""
    @Published var tightSkinAnswer = ""
    @Published var shinySkinAnswer = ""
    @Published var oilyCertainAreaSkinAnswer = ""
    @Published var acneSeverityMap = [String:NewQuizViewModel.AcneType]()
    
    private let skinPersonaRepository: SkinPersonaRepository
    private let userRepository: UserRepository
    
    init(skinPersonaRepository: SkinPersonaRepository = SkinPersonaDefaultRepository.shared,
         userRepository: UserRepository = UserDefaultRepository()
    ){
        self.skinPersonaRepository = skinPersonaRepository
        self.userRepository = userRepository
    }
    
    func saveSkinPersona() {
        guard let logedInUserId = AuthenticationDefaultRepository.shared.userID else {return}
        
        let newPersona = skinPersonaRepository.createNewSkinPersona(
            skinType: getSkinType(),
            acneType: getAcneSeverity(),
            userID: logedInUserId
        )
        
        
        _ = SkinPersonaDefaultRepository.shared.isFirstQuiz(userID: logedInUserId)
        userRepository.addNewUserSkinPersona(id: newPersona.userID!.uuidString, skinPersona: newPersona)

    }
        
    func getSkinType() -> String {
        guard !poresSkinAnswer.isEmpty && !tightSkinAnswer.isEmpty && !shinySkinAnswer.isEmpty && !oilyCertainAreaSkinAnswer.isEmpty else {return NewQuizViewModel.normalSkinType}
        
        
        if poresSkinAnswer == NewQuizViewModel.poresAnswerLarge && shinySkinAnswer == NewQuizViewModel.shinyAnswerYes && oilyCertainAreaSkinAnswer == NewQuizViewModel.oilyAnswerNo{
            return NewQuizViewModel.oilySkinType
        }
        
        if poresSkinAnswer == NewQuizViewModel.poresAnswerLarge && shinySkinAnswer == NewQuizViewModel.shinyAnswerYes && oilyCertainAreaSkinAnswer == NewQuizViewModel.oilyAnswerYes{
            return NewQuizViewModel.combinationSkinType
        }
        
        if poresSkinAnswer == NewQuizViewModel.poresAnswerSmall && shinySkinAnswer == NewQuizViewModel.shinyAnswerNo && tightSkinAnswer ==  NewQuizViewModel.tightAnswerYes{
            return NewQuizViewModel.drySkinType
        }
        
        
        return NewQuizViewModel.normalSkinType
    }
    
    func getAcneSeverity()-> String {
        var totalSeverity = 0
        for key in acneSeverityMap.keys {
            if let value = acneSeverityMap[key]?.rawValue {
                totalSeverity += value * NewQuizViewModel.getMultiplier(position: key)
                print(value * NewQuizViewModel.getMultiplier(position: key))
                print(key)
            }
        }
        
        if totalSeverity >= 32{
            return NewQuizViewModel.acneConditionVerySevere
        }
        
        if totalSeverity >= 25 {
            return NewQuizViewModel.acneConditionSevere
        }
        
        if totalSeverity >= 13 {
            return NewQuizViewModel.acneConditionModerate
        }
        
        return NewQuizViewModel.acneConditionMild
    }
}

extension NewQuizViewModel{
    static var acneConditionVerySevere = "VerySevere"
    static var acneConditionSevere = "Severe"
    static var acneConditionModerate = "Moderate"
    static var acneConditionMild = "Mild"
        
    
    static var oilySkinType = "Oily"
    static var drySkinType = "Dry"
    static var combinationSkinType = "Combination"
    static var normalSkinType = "Normal"
    

    static var poresAnswerLarge = "Large"
    static var poresAnswerSmall = "Small"
    static var tightAnswerYes = "Yes"
    static var tightAnswerNo = "No"
    static var shinyAnswerYes = "Yes"
    static var shinyAnswerNo = "No"
    static var oilyAnswerYes = "Yes"
    static var oilyAnswerNo = "No, it's all over my face"
    
    struct QuizQuestion : Identifiable {
        var id = UUID.init()
        var location: String? = ""
        var image: String? = ""
        var question: String = ""
        var answerList : [QuizQuestionAnswer] = [QuizQuestionAnswer]()
    }
    
    struct QuizQuestionAnswer : Identifiable {
        var id = UUID.init()
        var image: String = ""
        var answer: String = ""
    }
    
    static func getQuestionList() -> [NewQuizViewModel.QuizQuestion] {
        var q1 = QuizQuestion(image: "PoreQuiz", question: "How do your pores look?")
        let q1a1 = QuizQuestionAnswer(image:"largePores", answer: self.poresAnswerLarge)
        let q1a2 = QuizQuestionAnswer(image:"smallPores", answer: self.poresAnswerSmall)
        
        var q2 = QuizQuestion( image: "DryQuiz", question: "Does your skin feel tight?")
        let q2a1 = QuizQuestionAnswer(image: "tight", answer: self.tightAnswerYes)
        let q2a2 = QuizQuestionAnswer(image: "notTight", answer: self.tightAnswerNo)
        
        var q3 = QuizQuestion( image: "OilyQuiz", question: "Does your face look shiny?")
        let q3a1 = QuizQuestionAnswer(image: "shiny", answer: self.shinyAnswerYes)
        let q3a2 = QuizQuestionAnswer(image: "notShiny", answer: self.shinyAnswerNo)
        
        var q4 = QuizQuestion(image: "CombiQuiz", question: "Does your face feel oily on certain area?")
        let q4a1 = QuizQuestionAnswer(image: "combi", answer: self.oilyAnswerYes)
        let q4a2 = QuizQuestionAnswer(image: "notCombi", answer: self.oilyAnswerNo)
        
        q1.answerList.append(q1a1)
        q1.answerList.append(q1a2)
        q2.answerList.append(q2a1)
        q2.answerList.append(q2a2)
        q3.answerList.append(q3a1)
        q3.answerList.append(q3a2)
        q4.answerList.append(q4a1)
        q4.answerList.append(q4a2)
        
        
        return [
            q1, q2, q3, q4
        ]
    }
}


extension NewQuizViewModel {
    
    static let ForeheadMultipler = 2
    static let RightCheekMultipler  = 2
    static let LeftCheekMultipler  = 2
    static let NoseMultipler = 1
    static let ChinMultipler  = 1
    static let ChestAndUpperBackMultipler  = 3
    
    static func getMultiplier(position: String) -> Int {
        switch position {
        case Forehead:
            return ForeheadMultipler
        case RightCheek:
            return RightCheekMultipler
        case LeftCheek:
            return LeftCheekMultipler
        case Nose:
            return NoseMultipler
        case ChestAndUpperBack:
            return ChestAndUpperBackMultipler
        case Chin:
            return ChinMultipler
        default:
            return 0
        }
    }
    
    
    static let Forehead = "Forehead"
    static let RightCheek = "Right Cheek"
    static let LeftCheek = "Left Cheek"
    static let Nose = "Nose"
    static let Chin = "Chin"
    static let ChestAndUpperBack = "Chest And Upper Back"
  
    enum AcneType: Int {
        case NoLesion = 0
        case Comedones = 1
        case Papule = 2
        case Pustule = 3
        case Nodule = 4
    }
    
}
