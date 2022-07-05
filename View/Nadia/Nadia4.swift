//
//  Nadia4.swift
//  ACNIFY
//
//  Created by Rahmat Maftuh Ihsan on 27/06/22.
//

import SwiftUI
struct IntroView : View {
    @AppStorage("signed_in") var currentUserSignedIn: Bool = false
    
    var body: some View {
        
        ZStack{
//
            if currentUserSignedIn {
                SkinType()
                    .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
                
            } else {
                onBoardingView()
                    .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
            }
        }
    }
}
