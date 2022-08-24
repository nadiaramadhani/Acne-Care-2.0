//
//  MainTabView.swift
//  ACNIFY
//
//  Created by Rahmat Maftuh Ihsan on 20/08/22.
//

import SwiftUI

struct MainTabView: View {
    @State var isShowPhoto = false
    @ObservedObject var homeViewModel = HomeViewModel()
    @ObservedObject var profileViewModel = ProfileViewModel()
    var body: some View {
            TabView{
                
                HomePageView(isShowPhoto: $isShowPhoto, viewModel: homeViewModel)
                    .navigationBarHidden(true)
                    .tabItem{
                        Image(systemName: "house")
                        Text("Progress")
                    }.tag(0)
                
                ProfilePageView(viewModel: profileViewModel)
                    .navigationBarHidden(true)
                    .tabItem{
                        Image(systemName: "person.crop.circle")
                        Text("Profile")
                        
                    }.tag(1)
                
            }
            .accentColor(Color("primaryGreen"))
            .fullScreenCover(isPresented: $isShowPhoto, onDismiss: {
                homeViewModel.getGraphLineData()
            }){
                TakePhotos(isShowPhoto: $isShowPhoto, viewModel: TreatmentPhotoViewModel(acneLog: homeViewModel.nightLog))
            }
        
    }
}
    



struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
