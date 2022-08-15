//
//  LoginViewModel.swift
//  ACNIFY
//
//  Created by Agus Budianto on 02/08/22.
//

import Foundation
import SwiftUI


final class LoginViewModel: ObservableObject {
    private var authentificationRepository: AuthenticationRepository
    
    init(authentificationRepository: AuthenticationRepository = AuthenticationDefaultRepository.shared){
        self.authentificationRepository = authentificationRepository
    }
    
    func setLoginUser(for username: String){
        let _ = authentificationRepository.login(name: username)
    }
}
