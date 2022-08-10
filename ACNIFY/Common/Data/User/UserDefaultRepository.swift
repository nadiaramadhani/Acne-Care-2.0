//
//  UserDefaultRepository.swift
//  ACNIFY
//
//  Created by Agus Budianto on 10/08/22.
//

import Foundation

final class UserDefaultRepository: UserRepository {
    private let userDataStore: UserLocalDataStore
    
    init(userDataStore: UserLocalDataStore = UserDefaultLocalDataStore()){
        self.userDataStore = userDataStore
    }
    
    func getUserByID(id: String) -> User? {
        try? userDataStore.getUserByID(id: id)
    }
    
    func addNewUserSkinPersona(id: String, skinPersona: SkinPersona){
        guard let user = self.getUserByID(id: id) else {return}
        
        user.addToSkinPersona(skinPersona)
        
        userDataStore.saveChanges()
    }
}
