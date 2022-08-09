//
//  QuizRepository.swift
//  ACNIFY
//
//  Created by Agus Budianto on 09/08/22.
//

import Foundation

protocol SkinPersonaRepository {
    func getUserSkinPersonas(userID: String) -> [SkinPersona]
    func getUserLatestSkinPersona(userID: String) -> SkinPersona?
    func isFirstQuiz(userID: String) -> Bool
    func createNewSkinPersona(skinType: String, acneType: String, userID: String) -> SkinPersona
}
