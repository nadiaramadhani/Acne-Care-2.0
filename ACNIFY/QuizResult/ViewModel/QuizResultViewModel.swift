//
//  QuizResultViewModel.swift
//  ACNIFY
//
//  Created by Agus Budianto on 10/08/22.
//

import Foundation

final class QuizResultViewModel: ObservableObject {
    @Published var skinType: QuizViewModel.QuizQuestion?
    @Published var acneType: QuizViewModel.QuizQuestion?
    
    private let skinPersonaRepository: SkinPersonaRepository
    
    init(skinPersonaRepository: SkinPersonaRepository = SkinPersonaDefaultRepository()){
        self.skinPersonaRepository = skinPersonaRepository
        
        guard let userID = AuthenticationDefaultRepository.shared.userID else {return}
        
        let skinPersona = skinPersonaRepository.getUserLatestSkinPersona(userID: userID)
        
        if let skinTitle = skinPersona?.skinType {
            self.skinType = self.getSkinDataByTitle(title: skinTitle)
        }
        
        if let acneTitle = skinPersona?.acneType {
            self.acneType = self.getAcneDataByTitle(title: acneTitle)
        }
    }
}

extension QuizResultViewModel {
    func getSkinDataByTitle(title: String) -> QuizViewModel.QuizQuestion? {
        return QuizViewModel.getSkinData().filter{$0.title == title}.first
    }
    
    func getAcneDataByTitle(title: String) -> QuizViewModel.QuizQuestion? {
        return QuizViewModel.getAcneData().filter{$0.title == title}.first
    }
}


