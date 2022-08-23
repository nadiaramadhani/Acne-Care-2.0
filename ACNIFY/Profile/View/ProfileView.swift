//
//  ProfileView.swift
//  ACNIFY
//
//  Created by Rahmat Maftuh Ihsan on 20/08/22.
//

import SwiftUI

struct ProfileView: View {
    @State private var selected = 1
    @StateObject var lnManager = LocalNotificationManagerMorning()
    var body: some View {
        NavigationView{
            ZStack(alignment: .top){
                    Color(.white)
                        .edgesIgnoringSafeArea(.all)
                    
                    Image ("Oval2")
                        .edgesIgnoringSafeArea(.all)
                
                VStack{
                    
                //MARK: Section Profile
                    Section{
                        Image("GirlExample")
                            .clipShape(Circle())
                        
                        Text("Trier Tieta")
                            .font(.system(size:20))
                            .fontWeight(.bold)
                        HStack{
                            Text("Oily Skin")
                                .font(.system(size: 12))
                                .fontWeight(.regular)
                            
                            Circle()
                                .frame(width: 5, height: 5)
                            
                            Text("Acne: 12")
                                .font(.system(size: 12))
                                .fontWeight(.regular)
                        }
                    }
                    
                    
                //MARK: Section Skin Conditions and Comparing Skin
                    Section{
                        Picker("Skin", selection: $selected){
                            Text("Skin Conditions")
                                .tag(1)
                            Text("Comparing Skin")
                                .tag(2)
                        }
                        .pickerStyle(.segmented)
                        .padding()
                    }
                    
                }
                
                        
            }.navigationBarItems(trailing:
//                                    HStack{
//                Button(action: {
////                    self.isDone = true
//                }){
//                    Image(systemName: "bell.fill")
//                        .foregroundColor(Color("primaryGreen"))
//
//                }
                
                NavigationLink {
                    SetReminderView()
                    .environmentObject(lnManager)
                    
                } label: {
                    Image(systemName: "bell.fill")
                                           .foregroundColor(Color("primaryGreen"))
                

            })
            
        }
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
