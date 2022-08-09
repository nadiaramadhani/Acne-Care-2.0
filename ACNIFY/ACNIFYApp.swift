//
//  ACNIFYApp.swift
//  ACNIFY
//
//  Created by Local Administrator on 22/06/22.
//

import SwiftUI

@main
struct ACNIFYApp: App {
    
    //DI FILE APP
    //
    //ContentView()
    //.environment(\.managedObjectContext, dataController.container.viewContext)
    //   @StateObject private var locationManager = LocationManager()
    
    @AppStorage("FirstTimeUser") var firstTimeUser: Bool = true
    @AppStorage("first_quiz") var firstTimeQuiz: Bool = true
    
    @ObservedObject var authentificationRepository = AuthenticationDefaultRepository.shared
    private let skinPersonaRepository = SkinPersonaDefaultRepository()
    
    let transition: AnyTransition = .asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading))

    var body: some Scene {
        WindowGroup {
            if firstTimeUser {
                OnBoardingView()
            } else {
                LoginView()
                    .fullScreenCover(isPresented: $authentificationRepository.isLogedIn){
//                        skinPersonaRepository.isFirstQuiz(userID: authentificationRepository.userID ?? "")
                        if true {
                        QuizMainView()
                    } else{
                    MainPageView()
                        .transition(transition)
                    }
                }
            }
        }
    }
}




