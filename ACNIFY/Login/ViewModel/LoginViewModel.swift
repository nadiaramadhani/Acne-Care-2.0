//
//  LoginViewModel.swift
//  ACNIFY
//
//  Created by Agus Budianto on 02/08/22.
//

import Foundation
import SwiftUI


class LoginViewModel: ObservableObject {
    @AppStorage("name") var currentUserName: String?
    @AppStorage("signed_in") var currentUserSignedIn: Bool = false
    
    
    func setLoginUser(for username: String){
        currentUserName = username
        currentUserSignedIn = true
    }
}
