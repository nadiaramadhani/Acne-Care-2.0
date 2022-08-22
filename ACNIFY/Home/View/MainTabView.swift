//
//  MainTabView.swift
//  ACNIFY
//
//  Created by Rahmat Maftuh Ihsan on 20/08/22.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        NavigationView{
        TabView{
            HomePageView()
          
                .tabItem{
                    Image(systemName: "house")
                    Text("Progress")
                }.tag(0)
            
            ProfileView()
           
                .tabItem{
                    Image(systemName: "person.crop.circle")
                    Text("Profile")

                }.tag(1)
                
        }
        .accentColor(Color("primaryGreen"))
        }
        

        
        
    }
    
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
