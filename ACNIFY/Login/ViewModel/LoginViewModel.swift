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
    private var userProductRepository: UserProductRepository
    
    init(
        authentificationRepository: AuthenticationRepository = AuthenticationDefaultRepository.shared,
        userProductRepository: UserProductRepository = UserProductDefaultRepository()
    ){
        self.authentificationRepository = authentificationRepository
        self.userProductRepository = userProductRepository
    }
    
    func setLoginUser(for username: String){
        let logedInUser = authentificationRepository.login(name: username)
    }
}
