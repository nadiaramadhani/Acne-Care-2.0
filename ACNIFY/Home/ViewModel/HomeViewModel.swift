//
//  HomeViewModel.swift
//  ACNIFY
//
//  Created by Agus Budianto on 10/08/22.
//

import Foundation

final class HomeViewModel: ObservableObject {
    @Published var currentUser: User?
    
    private let userRepository: UserRepository
    
    init(userRepository: UserRepository = UserDefaultRepository()){
        self.userRepository = userRepository
        let logedinUserID  = AuthenticationDefaultRepository.shared.userID
        currentUser = userRepository.getUserByID(id: logedinUserID!)
    }
}
