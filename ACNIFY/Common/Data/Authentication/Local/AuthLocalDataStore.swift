//
//  AuthLocalDataStore.swift
//  ACNIFY
//
//  Created by Agus Budianto on 09/08/22.
//

import Foundation


protocol AuthLocalDataStore {
    func Login(userID: String)
    func Logout()
    func getCurrentUserID() -> String?
}
