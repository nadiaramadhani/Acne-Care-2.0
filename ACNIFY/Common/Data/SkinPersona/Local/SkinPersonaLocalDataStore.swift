//
//  QuizLocalDataStore.swift
//  ACNIFY
//
//  Created by Agus Budianto on 09/08/22.
//

import Foundation


protocol SkinPersonaLocalDataStore{
    func getSkinPersonasByUserID(id: String) throws -> [SkinPersona]?
    func createNewSkinPersona() -> SkinPersona
    func saveChanges()
    func rollBack()
}
