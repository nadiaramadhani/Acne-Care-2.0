//
//  SkinViewModel.swift
//  ACNIFY
//
//  Created by Local Administrator on 04/07/22.
//

import Foundation

class SkinViewModel:ObservableObject {
    
    static var shared = SkinViewModel()
    
    @Published var selectedPage: String = ""
}
