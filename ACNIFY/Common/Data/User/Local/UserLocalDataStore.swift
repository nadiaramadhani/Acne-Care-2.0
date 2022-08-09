//
//  UserLocalDataStore.swift
//  ACNIFY
//
//  Created by Agus Budianto on 09/08/22.
//

import Foundation

protocol UserLocalDataStore {
    func getUserByID(id: String) throws -> User?
    func getUserByName(name: String) throws -> User?
    func createNewUser() -> User
    func saveChanges()
    func rollback()
}
