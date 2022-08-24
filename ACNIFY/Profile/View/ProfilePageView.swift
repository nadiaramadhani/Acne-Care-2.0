//
//  TestProfileView.swift
//  ACNIFY
//
//  Created by Local Administrator on 23/8/22.
//

import SwiftUI

struct ProfilePageView: View {
    @State private var selected : Int = 1
    @StateObject var lnManager = LocalNotificationManagerMorning()
    @State var isReminder: Bool = false
    @State var alertIsPresented: Bool = false
    
    var body: some View {
            ZStack(alignment: .top){
                Image("Oval2")
                    .edgesIgnoringSafeArea(.all)
                
                VStack{
                    HStack{
                        Spacer()
                        
                        NavigationLink(destination: SetReminderView() .environmentObject(lnManager)
                                       
                        ){
                            Image(systemName: "bell.fill")
                                .font(.system(size: 25))
                                .foregroundColor(Color("primaryGreen"))
                                .padding(.trailing)
                        }
                        
                        
                    }
                    
                    Image("tyta")
                    
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
                    
                    Picker("Skin", selection: $selected){
                        Text("Skin Conditions")
                            .tag(1)
                        
                        Text("Skin Comparison")
                            .tag(2)
                        
                    }
                    .padding()
                    .pickerStyle(.segmented)
                    
                    if selected == 1 {
                        
                        DrySkinView()
                    }
                    else if selected == 2 {
                        ComparingSkinView()
                    }
                    
//                    NavigationLink(isActive: $isReminder) {
//                        SkinQuizMainView()
//                    } label: {
//                        Text("Test Again")
//                            .foregroundColor(Color.white)
//                            .frame(width: 325, height: 50)
//                            .background(Color("yellow"))
//                            .cornerRadius(12)
//                    }
                    NavigationLink(destination: SkinQuizMainView().navigationBarHidden(true), isActive: $isReminder, label: {EmptyView()})
                          
                    Button {
                        self.alertIsPresented = true
                    } label: {
                        Text("Test Again")
                                                   .foregroundColor(Color.white)
                                                   .frame(width: 325, height: 50)
                                                   .background(Color("yellow"))
                                                   .cornerRadius(12)
                    }

                        
          
                    Spacer()
                    
                }
                .alert(isPresented: $alertIsPresented, content:{
                    Alert(title: Text("Leave Page"), message: Text("Are you sure you want to re-test your skin and acne condition?"), primaryButton: .default(Text("Cancel")),
                          secondaryButton: .default(Text("Sure"), action: {
                        isReminder = true
                    }))
                })
            }
            .navigationBarHidden(true)
        }
        
    }


struct TestProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePageView()
    }
}
