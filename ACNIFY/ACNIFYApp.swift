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
    @AppStorage("signed_in") var currentUserSignedIn: Bool = false
    @AppStorage("first_quiz") var firstTimeQuiz: Bool = true
    
    @State var isQuisPresent = false
    @State var isOnboardingPresented = false
    let transition: AnyTransition = .asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading))

    var body: some Scene {
        WindowGroup {
            if firstTimeUser {
                OnBoardingView()
            } else {
                LoginView()
                .fullScreenCover(isPresented: $currentUserSignedIn){
                    
                    if firstTimeQuiz {
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




