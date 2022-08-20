//
//  QuizViewModel.swift
//  ACNIFY
//
//  Created by Agus Budianto on 07/08/22.
//

import Foundation

final class QuizViewModel: ObservableObject {
    @Published var pageDisplayed : QuizMainView.QuizType = .Skin
    @Published var selectedSkinType: QuizViewModel.QuizQuestion?
    @Published var selectedAcneType: QuizViewModel.QuizQuestion?
    @Published var selectedIndex: Int = 0
    
    private let skinPersonaRepository: SkinPersonaRepository
    private let userRepository: UserRepository
    
    init(skinPersonaRepository: SkinPersonaRepository = SkinPersonaDefaultRepository.shared,
         userRepository: UserRepository = UserDefaultRepository()
    ){
        self.skinPersonaRepository = skinPersonaRepository
        self.userRepository = userRepository
    }
}


extension QuizViewModel {
    
    struct QuizQuestion : Identifiable {
        var id: Int
        var image : String
        var title: String
        var desc: String
        
    }
    
   
    
    func saveSkinPersona() {
        guard let selectedSkin = self.selectedSkinType else {return}
       
        guard let selectedAcne = self.selectedAcneType else {return}
        
        guard let logedInUserId = AuthenticationDefaultRepository.shared.userID else {return}
        
        let newPersona = skinPersonaRepository.createNewSkinPersona(
            skinType: selectedSkin.title,
            acneType: selectedAcne.title,
            userID: logedInUserId
        )
        
        
        _ = SkinPersonaDefaultRepository.shared.isFirstQuiz(userID: logedInUserId)
        userRepository.addNewUserSkinPersona(id: newPersona.userID!.uuidString, skinPersona: newPersona)

    }
    
    public static func getAcneData() -> [QuizViewModel.QuizQuestion] {
        return [
            QuizViewModel.QuizQuestion(id: 0, image: "Papules", title: "Papules", desc: "Small, inflamed lesions presenting as pink, tender"),
            QuizViewModel.QuizQuestion(id: 1, image: "Blackhead", title: "Blackhead", desc: "There is small black or yellowish bumps that develop on the skin"),
            QuizViewModel.QuizQuestion(id: 2, image: "Whitehead", title: "Whitehead", desc: "There is small lightning yellowish bumps that develop on the skin but firmer and will not be empty when squeezed"),
            QuizViewModel.QuizQuestion(id: 3, image: "Pustules", title: "Pustules", desc: "Small, inflamed, tender, usually red at the base, have a white tip in the centre, caused by a build-up of pustules"),
            QuizViewModel.QuizQuestion(id: 4, image: "Nodules", title: "Nodules", desc: "Relatively large, spherical, painful lesions located deeper in the skin surface"),
            QuizViewModel.QuizQuestion(id: 5, image: "Cysts", title: "Cysts", desc: "Easily inflammed through specific trigger (redness, itching, burning, dryness)")
        ]
    }
    
    
    public static func getSkinData() -> [QuizViewModel.QuizQuestion] {
        return [
            QuizViewModel.QuizQuestion(id: 0, image: "skintype1", title: "Normal", desc: "No severe sensitivity, barely visible pores, hydrated"),
            QuizViewModel.QuizQuestion(id: 1, image: "skintype2", title: "Dry", desc: "Feels tight, scaling and flaking, feels itchy"),
            QuizViewModel.QuizQuestion(id: 2, image: "skintype3", title: "Oily", desc: "Large pores, shiny appearance over the face mostly in T-Zone area"),
            QuizViewModel.QuizQuestion(id: 3, image: "skintype4", title: "Combination", desc: "Shiny appearance in T-Zone (forehead, nose and chin) area, cheeks tend to be dry and tight"),
            QuizViewModel.QuizQuestion(id: 5, image: "skintype5", title: "Sensitive", desc: "Easily inflammed through specific trigger (redness, itching, burning, dryness)"),
        ]
    }
    
}
