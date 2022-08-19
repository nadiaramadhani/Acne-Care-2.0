//
//  Rahmat2.swift
//  ACNIFY
//
//  Created by Rahmat Maftuh Ihsan on 27/06/22.
//

//Ini untuk page milih night 

import Foundation
import SwiftUI
import CoreMedia
import NotificationCenter
import UserNotifications

struct NightChooseProduct: View {
    
    
    @State private var selected = 0
    @State private var isSelectedOilCleanserNight: Bool = false
    @State private var isSelectedFacialNight: Bool = false
    @State private var isSelectedTonerNight: Bool = false
    @State private var isSelectedSerumNight: Bool = false
    @State private var isSelectedMoisturizerNight: Bool = false
    @State private var isSelectedAcneTreatmentNight: Bool = false
    @State private var isSelectedSunscreenNight: Bool = false
    @State private var isEditNight: Bool = false
    @State private var sheetsNotificationNight: Bool = false
    @State private var addProductOilCleanserNight: Bool = false
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var textEntered = ""
    @State private var showingAlert = false
    
    @State var isNext = false
    @State var isDone = false
    @State var isBack = false
    @State var isCancelSheetNight = false
    @State var isSaveSheetNight = false
    @State var currentTimeNight = Date()
    @EnvironmentObject var lnManagerNight: LocalNotificationManagerNight
    @Environment(\.scenePhase) var scenePhase
    @Environment(\.presentationMode) var presentation
    
    @State private var scheduleDate = Date()
    
    var body: some View {
        
        if isBack{
            TesterPickerView()
        }else if isDone{
            TesterPickerView()
        }else if isCancelSheetNight {
            NightChooseProduct()
        }else if isSaveSheetNight{
            NightChooseProduct()
        }else{
            NavigationView{
                
                ZStack{
                    Color(.white)
                        .edgesIgnoringSafeArea(.all)
                    
                    Image ("Oval2")
                        .edgesIgnoringSafeArea(.all)
                        .position(x:250, y:110)
                    
                    
                    VStack {
                        Text("Product Type")
                            .font(.system(size:17))
                            .fontWeight(.bold)
                            .padding(.leading,-180)
                            .padding(.top,40)
                        
                        
                        
                        
                        ScrollView(.vertical, showsIndicators: false, content: {
                            VStack{
                                ZStack{
                                    Rectangle()
                                        .fill(Color.white)
                                        .frame(width: 355, height: 115)
                                        .cornerRadius(12)
                                        .padding(5)
                                        .shadow(radius: 5)
                                    
                                    HStack{
                                        Image("nightOilCleanser")
                                            .frame(width:40, height: 90)
                                            .padding()
                                        
                                        VStack(alignment: .leading){
                                            Text("Oil Cleanser")
                                                .font(.system(size:16))
                                                .fontWeight(.semibold)
                                                .foregroundColor(Color("primaryGreen"))
                                            
                                            
                                            Text("Effectively clean the skin without stripping it or weighing it down")
                                            
                                                .font(.system(size:14))
                                                .fontWeight(.light)
                                                .multilineTextAlignment(.leading)
                                                .frame(width: 215,alignment: .leading)
                                            
                                            
                                            Spacer()
                                                .frame(height:20)
                                            
                                            
                                            addProductButton
                                        }
                                        Toggle("",isOn: $isSelectedOilCleanserNight)
                                            .labelsHidden()
                                            .toggleStyle(NewNightToggleCheckbox())
                                            .font(.largeTitle)
                                        
                                    }
                                }
                                
                                ZStack{
                                    Rectangle()
                                        .fill(Color.white)
                                        .frame(width: 355, height: 115)
                                        .cornerRadius(12)
                                        .padding(5)
                                        .shadow(radius: 5)
                                    
                                    
                                    HStack{
                                     
                                        Spacer()
                                            .frame(width: 16)
                                        
                                        Image("nightFacialWash")
                                            .frame(width:40, height: 90)
                                            .padding(.leading,-45)
                                        
                                        Spacer()
                                            .frame(width: 16)
                                        
                                        VStack(alignment: .leading){
                                            Text("Facial Wash")
                                                .font(.system(size:16))
                                                .fontWeight(.semibold)
                                                .foregroundColor(Color("primaryGreen"))
                                            
                                            
                                            Text("Wash your face with gentle face wash")
                                            
                                                .font(.system(size:14))
                                                .fontWeight(.light)
                                                .multilineTextAlignment(.leading)
                                                .frame(width: 215,alignment: .leading)
                                            
                                            
                                            Spacer()
                                                .frame(height:20)
                                            
                                            Text("Product can be opened in 7 days")
                                                .frame(width: 215,alignment: .leading)
                                                .font(.system(size:12))
                                                .foregroundColor(Color("primaryGreen"))
                                            
                                        }
                                        
                                        
                                    }
                                }.opacity(0.5)
                                

                            }
                        })
                        .padding(.leading,0)
                        
                        .frame(width: 500, height: 710)
                        .edgesIgnoringSafeArea(.bottom)
                    }
                  
                }
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(leading:
                                        HStack{
                    Button(action: {
//                        self.isBack = true
                        self.presentation.wrappedValue.dismiss()
                    }){
                        HStack{
                            Image (systemName: "chevron.backward")
                            .font(.system(size:22))
                            .foregroundColor(Color ("primaryGreen"))
                            
                            Text("Your Skincare Product")
                                .foregroundColor(Color("primaryGreen"))
                                .font(.system(size:20))
                                .fontWeight(.bold)
                                .frame(alignment: .leading)
                        }
                
                    }
                    
                }
                                    
                )
                
            }
            .navigationViewStyle(.stack )
            .task{
//                try? await lnManagerNight.requestAuthorization()
            }
            .onChange(of: scenePhase){newValue in
                if newValue == .active{
                    Task {
                        await lnManagerNight.getCurrentSettings()
                        // await lnManager.getPendingRequests()
                    }
                }
            }
            
        }
    }
    
    private var addProductButton : some View {
        Button("Add your product") {
            self.showingAlert.toggle()
            self.textEntered = ""                                                    }
        .font(.system(size:12))
        .foregroundColor(Color("primaryGreen"))
    }
}



struct NewNightToggleCheckbox: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View{
        Button {
            configuration.isOn.toggle()
        } label: {
            Image(systemName: configuration.isOn ? "checkmark.square": "square")
        }
        .tint(Color("primaryGreen")) //atau "primaryGreen"
        
    }
}

struct NightChooseProduct_Previews: PreviewProvider {
    static var previews: some View {
        NightChooseProduct()
            .environmentObject(LocalNotificationManagerNight())
    }
}

