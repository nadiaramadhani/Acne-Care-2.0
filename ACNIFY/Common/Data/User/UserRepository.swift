//
//  UserRepository.swift
//  ACNIFY
//
//  Created by Agus Budianto on 09/08/22.
//

import Foundation

protocol UserRepository {
    func getUserByID(id: String) -> User?
    func addNewUserSkinPersona(id: String, skinPersona: SkinPersona)
    func addNewAcneLog(id: String, acneLog: AcneLog)
}
