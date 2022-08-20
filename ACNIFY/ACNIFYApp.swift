//
//  ACNIFYApp.swift
//  ACNIFY
//
//  Created by Local Administrator on 22/06/22.
//

import SwiftUI

@main
struct ACNIFYApp: App {
    
    @AppStorage("FirstTimeUser") var firstTimeUser: Bool = true
    
    @ObservedObject var authentificationRepository = AuthenticationDefaultRepository.shared
    @ObservedObject var skinPersonaRepository = SkinPersonaDefaultRepository.shared
    
    let transition: AnyTransition = .asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading))
    
    var body: some Scene {
        WindowGroup {
            if firstTimeUser {
                OnBoardingView()
            } else {
                LoginView()
                    .fullScreenCover(isPresented: $authentificationRepository.isLogedIn){
                        if skinPersonaRepository.isFirstUserQuiz {
                            QuizMainView()
                        } else{
                            HomePageView()
                                .transition(transition)
                                .onAppear{
                                    let paths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
                                    print(paths[0])
                                }
                        }
                    }
            }
            
        }
    }
}




