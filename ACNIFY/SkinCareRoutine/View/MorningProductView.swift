//
//  Rahmat1.swift
//  ACNIFY
//
//  Created by Rahmat Maftuh Ihsan on 27/06/22.
//



//Ini untuk page milih daily morning

import Foundation
import SwiftUI
import CoreMedia
import NotificationCenter
import UserNotifications

struct morningChooseProduct: View {
    
    //Ngestate hasil yagn udah dicentang hasilnya true
    @State private var selected = 0
    @State private var isSelectedOilCleanserMorning: Bool = false
    @State private var isSelectedFacialMorning: Bool = false
    @State private var textEntered = ""
    @State private var showingAlert = false
    @State private var isLocked = false
    

    
    @State var isNext = false
    @State var isDone = false
    @State var isBack = false
    @EnvironmentObject var lnManagerMorning: LocalNotificationManagerMorning
    @Environment(\.scenePhase) var scenePhase
    @Environment(\.presentationMode) var presentation
    
    
    var body: some View {
        
        if isBack{
          NightChooseProduct()
        }else{
            
            NavigationView{
                
                ZStack{
                    Color(.white)
                        .edgesIgnoringSafeArea(.all)
                    
                    Image ("Oval2")
                        .edgesIgnoringSafeArea(.all)
                        .position(x:200, y:110)
                    
                    
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
                                        .frame(width: 350, height: 113)
                                        .cornerRadius(12)
                                        .padding(5)
                                        .shadow(radius: 5)
                                    
                                    HStack{
                                        Image("dayOilCleanser")
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
                                        
                                        //Nambahin list produk yang dicentang
                                        //Kalo udah dicentang, dia tetap di slide ini dan tercentang
                                        
                                        
                                        
                                        Toggle("",isOn: $isSelectedOilCleanserMorning)
                                            .labelsHidden()
                                            .toggleStyle(NewToggleCheckbox())
                                            .font(.largeTitle)
                                        
                                    }
                                }
                                .opacity(isLocked ? 1 : 0.5)
                                .onTapGesture {
                                        isLocked.toggle()
                                        
                                    }
                                Toggle("",isOn: $isSelectedOilCleanserMorning)
                                    .labelsHidden()
                                    .toggleStyle(NewToggleCheckbox())
                                    .font(.largeTitle)
                                
                                ZStack{
                                    Rectangle()
                                        .fill(Color.white)
                                        .frame(width: 355, height: 115)
                                        .cornerRadius(12)
                                        .padding(5)
                                        .shadow(radius: 5)

                                    
                                    HStack{
                                        Image("Day")
                                            .frame(width:40, height: 90)
                                            .padding()
                                        
                                        VStack(alignment: .leading){
                                            Text("Facial Wash")
                                                .font(.system(size:16))
                                                .fontWeight(.semibold)
                                                .foregroundColor(Color("primaryGreen"))
                                            
                                            
                                            Text("Wash your face with gentle face wash")
                                            
                                                .font(.system(size:14))
                                                .fontWeight(.light)
                                                .multilineTextAlignment(.leading)
                                                .frame(width: 217,alignment: .leading)
                                            
                                            
                                            Spacer()
                                                .frame(height:20)
                                            
                                            addProductButton
                                        }
                                        
                                        
                                        Toggle("",isOn: $isSelectedFacialMorning)
                                            .labelsHidden()
                                            .toggleStyle(NewToggleCheckbox())
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
                                        Image("dayToner")
                                            .frame(width:40, height: 90)
                                            .padding()
                                        
                                        VStack(alignment: .leading){
                                            Text("Toner")
                                                .font(.system(size:16))
                                                .fontWeight(.semibold)
                                                .foregroundColor(Color("primaryGreen"))
                                            
                                            
                                            Text("Gently refresh your skin without stripping it of its natural moisture.")
                                            
                                                .font(.system(size:14))
                                                .fontWeight(.light)
                                                .multilineTextAlignment(.leading)
                                                .frame(width: 215,alignment: .leading)
                                            
                                            
                                            Spacer()
                                                .frame(height:20)
                                            
                                            addProductButton
                                        }
                                        
                                        
                                        
                                        
                                  
                                        
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
                                        Image("daySerum")
                                            .frame(width:40, height: 90)
                                            .padding()
                                        
                                        VStack(alignment: .leading){
                                            Text("Serum")
                                                .font(.system(size:16))
                                                .fontWeight(.semibold)
                                                .foregroundColor(Color("primaryGreen"))
                                            
                                            
                                            Text("Contain a higher concentration of active ingredients")
                                            
                                                .font(.system(size:14))
                                                .fontWeight(.light)
                                                .multilineTextAlignment(.leading)
                                                .frame(width: 215,alignment: .leading)
                                            
                                            
                                            Spacer()
                                                .frame(height:20)
                                            
                                            addProductButton
                                        }
                                        
                                        
                                        
                                        
                                    
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
                                        Image("Moisturizer")
                                            .frame(width:40, height: 90)
                                            .padding()
                                        
                                        VStack(alignment: .leading){
                                            Text("Moisturizer")
                                                .font(.system(size:16))
                                                .fontWeight(.semibold)
                                                .foregroundColor(Color("primaryGreen"))
                                            
                                            
                                            Text("Always make sure to hydrated your skin")
                                            
                                                .font(.system(size:14))
                                                .fontWeight(.light)
                                                .multilineTextAlignment(.leading)
                                                .frame(width: 215,alignment: .leading)
                                            
                                            
                                            Spacer()
                                                .frame(height:20)
                                            
                                            addProductButton
                                        }
                                        
                                        
                                        
                                        
                               
                                        
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
                                        Image("dayAcneTreatment")
                                            .frame(width:40, height: 90)
                                            .padding()
                                        
                                        VStack(alignment: .leading){
                                            Text("Acne Treatment")
                                                .font(.system(size:16))
                                                .fontWeight(.semibold)
                                                .foregroundColor(Color("primaryGreen"))
                                            
                                            
                                            Text("Clear away bacteria and dry up the excess oils that lead to acne")
                                            
                                                .font(.system(size:14))
                                                .fontWeight(.light)
                                                .multilineTextAlignment(.leading)
                                                .frame(width: 217,alignment: .leading)
                                            
                                            
                                            Spacer()
                                                .frame(height:20)
                                            
                                            addProductButton
                                        }
                                        
                                        
                                        
                                        
                                     
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
                                        Image("daySunscreen")
                                            .frame(width:40, height: 90)
                                            .padding()
                                        
                                        VStack(alignment: .leading){
                                            Text("Sunscreen")
                                                .font(.system(size:16))
                                                .fontWeight(.semibold)
                                                .foregroundColor(Color("primaryGreen"))
                                            
                                            
                                            Text("Protect the skin from the harmful effects of the sun")
                                            
                                                .font(.system(size:14))
                                                .fontWeight(.light)
                                                .multilineTextAlignment(.leading)
                                                .frame(width: 217,alignment: .leading)
                                            
                                            
                                            Spacer()
                                                .frame(height:20)
                                            
                                            addProductButton
                                        }
                                        
                                        
                                        
                                        
                                   
                                    }
                                }
//                                .opacity(isLocked ? 1 : 0.5)
//                                .onTapGesture {
//                                        isLocked.toggle()
//
//                                    }
                                
                                
                                ZStack{
                                    Rectangle()
                                        .fill(Color.white)
                                        .frame(width: 355, height: 115)
                                        .cornerRadius(12)
                                        .padding(5)
                                        .shadow(radius: 5)

                                    
                                    HStack{
                                        Spacer()
                                            .frame(width:16)
                                        
                                        Image("Day")
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
                                                .font(.system(size:12))
                                                .foregroundColor(Color("primaryGreen"))
                                        }
                                        
                                        
                                        
                                        
//                                        Toggle("",isOn: $isSelectedFacialMorning)
//                                            //.labelsHidden()
//                                            .toggleStyle(NewToggleCheckbox())
//                                            .font(.largeTitle)
                                        
                                        
                                        
                                    }
                                }.opacity(0.5)
                                

                                
                            }
                            //.padding(.bottom,500)
                        })
                        .padding(.leading,0)
                        .edgesIgnoringSafeArea(.bottom)
//                        .padding(.top,25)
                        .frame( height: 710)
                        
                           
                    }
                   
                        
                }
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(leading:
                                        HStack{
                    Button(action: {
                        presentation.wrappedValue.dismiss()
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
//                try? await lnManagerMorning.requestAuthorization()
        }
            .onChange(of: scenePhase){newValue in
                if newValue == .active{
                    Task {
                        await lnManagerMorning.getCurrentSettings()
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




struct NewToggleCheckbox: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View{
        Button {
            configuration.isOn.toggle()
        } label: {
            Image(systemName: configuration.isOn ? "lock.open.fill": "lock.fill")
        }
        .tint(Color("primaryGreen"))
        
        
    }
        
}

struct morningChooseProduct_Previews: PreviewProvider {
    static var previews: some View {
        morningChooseProduct()
            .environmentObject(LocalNotificationManagerMorning())
    }
}
