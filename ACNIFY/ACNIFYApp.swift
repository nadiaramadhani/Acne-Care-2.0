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


    var body: some Scene {
        WindowGroup {
IntroView()
           //     .environmentObject(locationManager)


        }
    }
}
