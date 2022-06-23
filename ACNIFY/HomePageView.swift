//
//  IntroView.swift
//  ACNIFY
//
//  Created by Local Administrator on 23/06/22.
//

import SwiftUI

struct HomePageView: View {
    @AppStorage("signed_in") var currentUserSignedIn: Bool = false
    
    var body: some View {
        
        ZStack{
//            RadialGradient(gradient: Gradient(colors: [Color.gray, Color.blue]),
//                           center: .topLeading,
//                           startRadius: 5,
//                           endRadius: UIScreen.main.bounds.height)
            
            if currentUserSignedIn {
                HomeView()
                    .transition(.asymmetric(insertion: .move(edge: .bottom), removal: .move(edge: .top)))
                
            } else {
                onBoardingView()
                    .transition(.asymmetric(insertion: .move(edge: .top), removal: .move(edge: .bottom)))
            }
        }
    }
}

struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}
