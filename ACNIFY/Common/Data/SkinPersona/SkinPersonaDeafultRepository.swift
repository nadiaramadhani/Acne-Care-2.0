//
//  SkinPersonaDeafultRepository.swift
//  ACNIFY
//
//  Created by Agus Budianto on 09/08/22.
//

import Foundation

final class SkinPersonaDefaultRepository: SkinPersonaRepository, ObservableObject {
    
    static let shared = SkinPersonaDefaultRepository()
    
    @Published var isFirstUserQuiz: Bool = true
    
    private let skinPersonaLocalDataStore: SkinPersonaLocalDataStore
    private let userLocalDataStore: UserLocalDataStore
    
    init(
        skinPersonaLocalDataStore: SkinPersonaLocalDataStore  = SkinPersonaDefaultLocalDataSource(),
        userLocalDataStore: UserLocalDataStore = UserDefaultLocalDataStore()
    ){
        self.skinPersonaLocalDataStore = skinPersonaLocalDataStore
        self.userLocalDataStore = userLocalDataStore
        
        if let userID = AuthenticationDefaultRepository.shared.userID {
            _ = self.isFirstQuiz(userID: userID)
        }
    }
    
    func getUserSkinPersonas(userID: String) -> [SkinPersona] {
        do {
            guard let skinPersonas = try skinPersonaLocalDataStore.getSkinPersonasByUserID(id: userID) else {return []}
            
            return skinPersonas
        } catch {
            print(error)
            return []
        }
    }
    
    func getUserLatestSkinPersona(userID: String) -> SkinPersona? {
        do {
            guard let skinPersonas = try skinPersonaLocalDataStore.getSkinPersonasByUserID(id: userID) else {return nil}
            
            return skinPersonas.last
        } catch {
            print(error)
            return nil
        }
    }
    
    func isFirstQuiz(userID: String) -> Bool {
       let skinPersonas = self.getUserSkinPersonas(userID: userID)
        
       self.isFirstUserQuiz = skinPersonas.count == 0
        
        
       return self.isFirstUserQuiz
    }
    
    
    func createNewSkinPersona(skinType: String, acneType: String, userID: String) -> SkinPersona {
        let newSKinPersona = skinPersonaLocalDataStore.createNewSkinPersona()
        newSKinPersona.userID = UUID.init(uuidString: userID)
        newSKinPersona.acneType = acneType
        newSKinPersona.skinType = skinType
        
        skinPersonaLocalDataStore.saveChanges()
        return newSKinPersona
    }
    
    
}
