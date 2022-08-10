//
//  AuthDefaultLocalDataStore.swift
//  ACNIFY
//
//  Created by Agus Budianto on 09/08/22.
//

import Foundation


final class AuthDefaultLocalDataStore: AuthLocalDataStore {
    let userDefault: UserDefaults
    let userIDKey = "user_id"
    
    init(userDefault: UserDefaults = UserDefaults.standard) {
        self.userDefault = userDefault
    }
    
    func Login(userID: String) {
        self.userDefault.set(userID, forKey: self.userIDKey)
    }
    
    func Logout() {
        self.userDefault.removeObject(forKey: self.userIDKey)
    }
    
    func getCurrentUserID() -> String? {
        return self.userDefault.string(forKey: userIDKey)
    }
    
    
}
