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
    @State private var isDone = false

    var body: some View {
        NavigationView{
        ZStack(alignment: .top){
            Image ("Oval2")
                .edgesIgnoringSafeArea(.all)

            VStack{
                HStack{
                    Spacer()
                    NavigationLink(destination: SetReminderView() .environmentObject(lnManager)

                    ){
                        Image(systemName: "bell.fill")
                            .resizable()
                            .foregroundColor(Color("primaryGreen"))
                            .font(.system(size: 20))
                            .frame(width: 30 , height: 30)
                    }
                }
                //MARK: Section Profile
                //                 ZStack(alignment: .top){
//                HStack{
//                    Spacer()
//
////                    .padding(.trailing)
////                        .padding(.top)
//

//                }
                VStack{
                    
                    Image("GirlExample")
                        .clipShape(Circle())

                    Spacer()
                        .frame(height:1)
                    
                    
                    Text("Trier Tieta")
                        .font(.system(size:20))
                        .fontWeight(.bold)
                    
                    Spacer()
                        .frame(height:8)
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
                    
                    Section{
                        Picker("Skin", selection: $selected){
                            Text("Skin Conditions")
                                .tag(1)
                            
                            Text("Comparing Skin")
                                .tag(2)
                            
                        }
                        .pickerStyle(.segmented)
                        
                        
                        
                    }
                }

                //      }
                .position(x: 185, y: 25)
                .frame(width: 360,height: 170)
                //MARK: Section Skin Conditions and Comparing Skin
                if selected == 1{
                    SkinConditionsView()
                }else if selected == 2{
                    ComparingSkinView()
                }


            }


        }
        .navigationBarHidden(true)

        }
    }
}






struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
