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
    @Published var firstAcneLog: AcneLog?
    
    private let skinPersonaRepository: SkinPersonaRepository
    private let userRepository: UserRepository
    private let acneLogRepository: AcneLogRepository
    
    init(skinPersonaRepository: SkinPersonaRepository = SkinPersonaDefaultRepository.shared,
         userRepository: UserRepository = UserDefaultRepository(),
         acneLogRepository: AcneLogRepository = AcneLogDefaultRepository()
    ){
        self.skinPersonaRepository = skinPersonaRepository
        self.userRepository = userRepository
        self.acneLogRepository = acneLogRepository
       
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
    
    func createAcneLogdata(){
        let data = AcneLogData()
        data.userID = UUID.init(uuidString: AuthenticationDefaultRepository.shared.userID!)
        data.type = "firstcomer"
        
        self.firstAcneLog = acneLogRepository.createNewAcneLog(data: data)
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



extension NewQuizViewModel {
    struct SkinConditionDescription{
        var name = ""
        var desc = ""
        var source = ""
    }
    
    static let oilySkinConditionDescription = SkinConditionDescription(name: "Oily", desc: "Oily skin may has enlarged pores, dull or shiny, thick complexion, blackheads, pimples, or other blemishes. Oiliness can change depending upon the time of year or the weather. Things that can cause or worsen it include, puberty or other hormonal imbalances, stress, heat or too much humidity", source: "https://www.webmd.com/beauty/whats-your-skin-type")
    
    static let normalConditionDescription = SkinConditionDescription(name: "Normal", desc: "Normal skin not too dry and not too oily, normal skin has, no or few imperfections, no severe sensitivity, barely visible pores, and a radiant complexion", source: "https://www.webmd.com/beauty/whats-your-skin-type")
    
    static let combinationSkinConditionDescription = SkinConditionDescription(name: "Combination", desc: "Our skin can be dry or normal in some areas and oily in others, such as the T-zone (nose, forehead, and chin). Many people have this type. It may need slightly different care in different areas. Combination skin can have pores that look larger than normal because they’re more open, blackheads and shiny skin", source: "https://www.webmd.com/beauty/whats-your-skin-type")
    
    static let drySkinConditionDescription = SkinConditionDescription(name: "Dry", desc: "Dry skin may has almost invisible pores,dull, rough complexion, red patches, less elastic skin, more visible lines, your skin can crack, peel, or become itchy, irritated, or inflamed. If it’s very dry, it can become rough and scaly, especially on the backs of your hands, arms, and legs. ", source: "https://www.webmd.com/beauty/whats-your-skin-type")
    
    
    static let mildSkinConditionDescription = SkinConditionDescription(name: "Mild", desc: "Mild acne consist of open and closed comedones with few inflammatory papules and pustules", source: "https://www.nhs.uk/conditions/acne/diagnosis")
    
    static let severeConditionDescription = SkinConditionDescription(name: "Severe", desc: "Severe acne consist lots of large, painful papules, pustules, nodules or cysts; you might also have some scarring", source: "https://www.nhs.uk/conditions/acne/diagnosis")
    
    static let moderateSkinConditionDescription = SkinConditionDescription(name: "Moderate", desc: "Moderate acne severity consist of more widespread whiteheads and blackheads, with many papules and pustules", source: "https://www.nhs.uk/conditions/acne/diagnosis")
    
  
    static func getSkinTypeDesc(type: String) -> SkinConditionDescription {
        switch type {
        case NewQuizViewModel.drySkinType:
            return NewQuizViewModel.drySkinConditionDescription
        case NewQuizViewModel.oilyAnswerNo:
            return NewQuizViewModel.oilySkinConditionDescription
        case NewQuizViewModel.combinationSkinType:
            return NewQuizViewModel.combinationSkinConditionDescription
        case NewQuizViewModel.normalSkinType:
            return NewQuizViewModel.normalConditionDescription
        default:
            return NewQuizViewModel.normalConditionDescription
        }
    }
    
    static func getAcneSevereDesc(type: String) -> SkinConditionDescription {
        switch type {
        case NewQuizViewModel.acneConditionMild:
            return NewQuizViewModel.mildSkinConditionDescription
        case NewQuizViewModel.acneConditionSevere:
            return NewQuizViewModel.severeConditionDescription
        case NewQuizViewModel.acneConditionModerate:
            return NewQuizViewModel.moderateSkinConditionDescription
        default:
            return NewQuizViewModel.moderateSkinConditionDescription
        }
    }
    
}
