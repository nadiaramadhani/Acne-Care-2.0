//
//  MainTabView.swift
//  ACNIFY
//
//  Created by Rahmat Maftuh Ihsan on 20/08/22.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView{
            HomePageView()
          
                .tabItem{
                    Image(systemName: "house")
                    Text("Progress")
                }
            
            ProfileView()
           
                .tabItem{
                    Image(systemName: "person.crop.circle")
                    Text("Profile")

                }
        }
        .edgesIgnoringSafeArea(.bottom)
        
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
