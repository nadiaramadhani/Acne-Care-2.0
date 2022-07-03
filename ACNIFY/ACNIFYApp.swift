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
 //   @StateObject private var dataController = DataController()
    //
    //ContentView()
    //.environment(\.managedObjectContext, dataController.container.viewContext)

    var body: some Scene {
        WindowGroup {
IntroView()
//                .environment(\.managedObjectContext, dataController.container.viewContext)

        }
    }
}
