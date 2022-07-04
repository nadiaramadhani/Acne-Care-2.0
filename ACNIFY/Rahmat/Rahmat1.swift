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
    @State private var isSelectedToner: Bool = false
    @State private var isSelectedSerum: Bool = false
    @State private var isSelectedMoisturizerMorning: Bool = false
    @State private var isSelectedAcneTreatmentMorning: Bool = false
    @State private var isSelectedSunscreenMorning: Bool = false
    @State private var isEditMorning: Bool = false
    @State private var sheetsNotificationMorning: Bool = false
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var textEntered = ""
    @State private var showingAlert = false
    

    
    @State var isNext = false
    @State var isDone = false
    @State var isBack = false
    @State var isCancelSheet = false
    @State var isSaveSheet = false
    @State var currentTimeMorning = Date()
    @EnvironmentObject var lnManagerMorning: LocalNotificationManagerMorning
    @Environment(\.scenePhase) var scenePhase
    @State private var scheduleDate = Date()
    
    
    var body: some View {
        
        if isBack{
            TesterPickerView()
        }else if isDone{
            TakePhotos()
        }else if isCancelSheet{
            morningChooseProduct()
        }else if isSaveSheet{
            morningChooseProduct()
            
        }else{
            
            NavigationView{
                
                ZStack{
                    Color(.white)
                        .edgesIgnoringSafeArea(.all)
                    
                    
                    VStack {
                        Text("Set Reminder")
                            .font(.system(size:20))
                            .fontWeight(.bold)
                            .padding(.top,50)
                            .padding(.leading,-180)
                        
                        HStack{
                            
                            Toggle("Turn on the Skincare Notification", isOn: $sheetsNotificationMorning)
                                .sheet(isPresented: $sheetsNotificationMorning, content:{
                                    NavigationView{
                                        VStack{
                                            if lnManagerMorning.isGranted{

                                                GroupBox{
                                                    DatePicker("Time", selection:$scheduleDate,displayedComponents: [.hourAndMinute])
                                                    
                                                    Button("Set Notification"){
                                                        Task{
                                                            let dateComponents = Calendar.current.dateComponents([ .hour, .minute], from: scheduleDate)
                                                            let localNotificationMorning = LocalNotificationMorning(identifier: UUID().uuidString,
                                                                        title: "Morning Routine Reminder",
                                                                        body: "Don't forget to do treatment and checklist!",
                                                                        dateComponents: dateComponents,
                                                                        repeats: true)
                                                            await lnManagerMorning.schedule(localNotificationMorning: localNotificationMorning)
                                                    }
                                                }
                                                    .buttonStyle(.bordered)
                                        }

                                                .frame(width: 300)
                                                

                                                }
                                        else{

                                        }

                                        }
                                        .environmentObject(lnManagerMorning)
                                        .navigationBarTitle("Reminder")
                                        .navigationBarTitleDisplayMode(.inline)
                                        .navigationBarItems(leading:
                                                                HStack{
                                            Button(action: {
                                                self.isCancelSheet = true
                                            }){
                                                Text("Cancel")
                                                    .foregroundColor(.blue)
                                                    .frame(alignment: .leading)
                                        
                                            }
                                            
                                        }
                                                            
                                                            
                                        )
                                        .navigationBarItems(trailing:
                                                                HStack{
                                            Button(action: {
                                                self.isSaveSheet = true
                                            }){
                                                Text("Save")
                                                    .font(.headline)
                                                    .fontWeight(.semibold)
                                                    .foregroundColor(.blue)
                                                    .frame(alignment: .leading)
                                                
                                                
                                            }
                                            
                                        }
                                                            
                                                            
                                        )
                                        
                                    }
                                })
                            
                            
                        }.frame(width: 360, height: 44, alignment: .leading)
                            .edgesIgnoringSafeArea(.all)
                        
                        Text("Product Type")
                            .font(.system(size:20))
                            .fontWeight(.bold)
                            .padding(.leading,-180)
                        
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
                                                .frame(width: 217,alignment: .leading)
                                            
                                            
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
                                        
                                        
                                        
                                        
                                        Toggle("",isOn: $isSelectedToner)
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
                                        
                                        
                                        
                                        
                                        Toggle("",isOn: $isSelectedSerum)
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
                                        
                                        
                                        
                                        
                                        Toggle("",isOn: $isSelectedMoisturizerMorning)
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
                                        
                                        
                                        
                                        
                                        Toggle("",isOn: $isSelectedAcneTreatmentMorning)
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
                                        
                                        
                                        
                                        
                                        Toggle("",isOn: $isSelectedSunscreenMorning)
                                            .labelsHidden()
                                            .toggleStyle(NewToggleCheckbox())
                                            .font(.largeTitle)
                                        
                                    }
                                }
                                
                            }
                        })
                        .padding(.leading,0)
                        .frame(width: 500, height: 630)
                        .edgesIgnoringSafeArea(.bottom)
                           
                    }
                    CustomAlert(textEntered: $textEntered, showingAlert: $showingAlert)
                                            .opacity(showingAlert ? 1 : 0)
                        
                }
                .navigationBarTitle("Edit")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(leading:
                                        HStack{
                    Button(action: {
                        self.isBack = true
                    }){
                        Text("Cancel")
                            .foregroundColor(.blue)
                            .frame(alignment: .leading)
                
                    }
                    
                }
                                    
                                    
                )
                .navigationBarItems(trailing:
                                        HStack{
                    Button(action: {
                        self.isDone = true
                    }){
                        Text("Done")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(.blue)
                            .frame(alignment: .leading)
                        
                        
                    }
                    
                }
                                    
                                    
                )
//                .sheet(isPresented: $show, content: )
                
                
            }
            .navigationViewStyle(.stack )
            .task{
                try? await lnManagerMorning.requestAuthorization()
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
            Image(systemName: configuration.isOn ? "checkmark.square": "square")
        }
        .tint(Color("primaryGreen")) //atau "primaryGreen"
        
    }
}

struct morningChooseProduct_Previews: PreviewProvider {
    static var previews: some View {
        morningChooseProduct()
            .environmentObject(LocalNotificationManagerMorning())
    }
}

//BISA BUAT STRUCT BARU YANG ISINYA LIST PRODUCT DAN SET WAKTU

//class NotificationManager{
//    static let instance = NotificationManager()
//    func requestAuthorization(){
//        let options: UNAuthorizationOptions = [.alert, .sound, .badge]; UNUserNotificationCenter.current().requestAuthorization(options: options) { (success, error) in
//            if success {
//                print("All set!")
//            } else if let error = error {
//                print(error.localizedDescription)
//            }
//        }
//    }
//}



//struct sheetsNotificationMorning: View{
//    var body: some View{
//        .sheet
//        
//    }
//}
//tUTORIAL local notif= https://www.youtube.com/watch?v=iRjyk1S0nvo
