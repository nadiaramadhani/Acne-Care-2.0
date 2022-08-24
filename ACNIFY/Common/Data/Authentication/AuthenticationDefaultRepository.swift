//
//  AuthenticationDefaultRepository.swift
//  ACNIFY
//
//  Created by Agus Budianto on 09/08/22.
//

import Foundation

final class AuthenticationDefaultRepository: AuthenticationRepository, ObservableObject {
    
    static let shared = AuthenticationDefaultRepository()
    
    @Published var isLogedIn = false
    @Published var userID: String?
    

    
    private let userDataStore: UserLocalDataStore
    private let authDataStore: AuthLocalDataStore
    

    
    init(
        userDataStore: UserLocalDataStore = UserDefaultLocalDataStore(),
        authDataStore: AuthLocalDataStore = AuthDefaultLocalDataStore()
    ){
        self.userDataStore = userDataStore
        self.authDataStore = authDataStore
        
        if let userID  = authDataStore.getCurrentUserID() {
            isLogedIn = true
            self.userID = userID
        }
    }
    
     func login(name: String) -> User? {

        do {
            guard !name.isEmpty else {return nil}
            
            guard let logedInUser = try userDataStore.getUserByName(name: name) else {
                
                let newUser = userDataStore.createNewUser()
                newUser.name = name
                
                userDataStore.saveChanges()
                
                guard let userID = newUser.id else{return nil}
                authDataStore.Login(userID: userID.uuidString)
                self.userID = userID.uuidString
                
                isLogedIn = true
                return newUser
            }
            
            guard let userID = logedInUser.id else{return nil}
            
            authDataStore.Login(userID: userID.uuidString)
             
                        
            isLogedIn = true

            return logedInUser
        } catch {
            print(error)
            return nil
        }
         
    }
    
    func logout() {
        authDataStore.Logout()
    }
    
}
