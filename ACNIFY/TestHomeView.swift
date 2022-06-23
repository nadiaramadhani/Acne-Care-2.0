//
//  HomeView.swift
//  ACNIFY
//
//  Created by Local Administrator on 23/06/22.
//

import SwiftUI

struct TestHomeView: View {
    @AppStorage("name") var currentUserName: String?
    @AppStorage("signed_in") var currentUserSignedIn: Bool = false
    
    var body: some View {
        VStack {
            Image(systemName: "person.circle.fill")
                .resizable()
                .scaledToFit()
            .frame(width: 150, height: 150, alignment: .center)
            Text("Hello \(currentUserName ?? "Username")!")
            Text("Your skin type")
            
            
        }.font(.title2)
            .padding()
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        TestHomeView()
    }
}
