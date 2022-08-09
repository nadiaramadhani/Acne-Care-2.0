//
//  AuthenticationRepository.swift
//  ACNIFY
//
//  Created by Agus Budianto on 09/08/22.
//

import Foundation


protocol AuthenticationRepository {
    func login(name: String) -> User?
    func logout()
}
