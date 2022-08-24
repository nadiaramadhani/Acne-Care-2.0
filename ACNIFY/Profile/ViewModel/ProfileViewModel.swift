//
//  ProfileViewModel.swift
//  ACNIFY
//
//  Created by Agus Budianto on 24/08/22.
//

import Foundation

final class ProfileViewModel: ObservableObject {
    @Published var userName = "User"
    @Published var skinType = ""
    @Published var acneSeverity = ""
    
    
    private let userRepository: UserRepository
    private let skinPersonaRepository: SkinPersonaRepository
    
    init(userRepository: UserRepository = UserDefaultRepository(), skinPersonaRepository: SkinPersonaRepository = SkinPersonaDefaultRepository.shared){
        self.userRepository = userRepository
        self.skinPersonaRepository = skinPersonaRepository
    }
    
    
    func getData() {
        let userId = AuthenticationDefaultRepository.shared.userID!
        
        let logedInUser = userRepository.getUserByID(id: userId)!
        self.userName = logedInUser.name!
        
        guard let skinPersona = skinPersonaRepository.getUserLatestSkinPersona(userID: userId) else {
            print("not found")
            return
        }
        
        self.skinType = skinPersona.skinType ?? "-"
        self.acneSeverity = skinPersona.acneType ?? "-"
        
        
    }
}
