//
//  Rahmat2.swift
//  ACNIFY
//
//  Created by Rahmat Maftuh Ihsan on 27/06/22.
//

//Ini untuk page milih night morning

import Foundation
import SwiftUI
import CoreMedia

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
    
    @State var isNext = false
    @State var isDone = false
    @State var isBack = false
    @State var isCancelSheetNight = false
    @State var isSaveSheetNight = false
    @State var currentTimeNight = Date()
    
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
                    VStack {
                        Text("Set Reminder")
                            .font(.system(size:20))
                            .fontWeight(.bold)
                            .padding(.top,50)
                            .padding(.leading,-180)
                        
                        HStack{
                            
                            Toggle("Turn on the Skincare Notification", isOn: $isEditNight
                            ).sheet(isPresented: $isEditNight, content:{
                                NavigationView{
                                    VStack{
                                        Form{
                                            Section(header: Text("")){
                                                DatePicker("Time", selection: $currentTimeNight, displayedComponents: .hourAndMinute)
                                            }
                                        }
                                        
                                    }
                                    .navigationBarTitle("Reminder")
                                    .navigationBarTitleDisplayMode(.inline)
                                    .navigationBarItems(leading:
                                                            HStack{
                                        Button(action: {
                                            self.isCancelSheetNight = true
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
                                            self.isSaveSheetNight = true
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
                                            
                                            Text("Add your product")
                                                .font(.system(size:12))
                                                .fontWeight(.light)
                                                .foregroundColor(Color("primaryGreen"))
                                                .onTapGesture{
                                                    self.addProductOilCleanserNight = true
                                                }
//                                            Button(action:{
//                                                self.addProductOilCleanserNight = true
//
//                                            }){
//                                                Text("Add your Product")
//                                                    .font(.system(size:12))
//                                                    .fontWeight(.light)
//                                                    .foregroundColor(Color("primaryGreen"))
//                                                    .alert(isPresented: $addProductOilCleanserNight, content:{
//                                                        Alert(
//
//                                                            title: Text("Product Name"),
//                                                            message: Text("Write a product name that you use"),
//                                                            primaryButton:.default(Text("Save")),
//                                                            secondaryButton:.cancel(Text("Back"))
//
////                                                            ,Harusnya bisa input TextField disini<<#Label: View#>>
//                                                        )
//                                                    })
//
//
//                                            }
                                            
                                                    Button("Show Alert") {
                                                        addProductOilCleanserNight = true
                                                    }
                                                    .font(.system(size:12))
                                                    .foregroundColor(Color("primaryGreen"))
                                                    .alert("Login", isPresented: $addProductOilCleanserNight, actions: {
                                                            TextField("Username", text: $username)
                                                            SecureField("Password", text: $password)
                                                        
                                                        

//                                                        Button("Login", action: {})
//                                                        Button("Cancel", role: .cancel, action: {})


                                                    }, message: {
                                                        Text("Please enter your username and password.")
                                                    })
                                                }
                                        
//Resource mendekati yang paling mudah https://www.youtube.com/watch?v=1FqRNf2WbJE
                                        
                                        
                                        
                                        
                                        
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
                                        Image("nightFacialWash")
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
                                                .frame(width: 215,alignment: .leading)
                                            
                                            
                                            Spacer()
                                                .frame(height:20)
                                            
                                            Text("Add your product")
                                                .font(.system(size:12))
                                                .fontWeight(.light)
                                                .foregroundColor(Color("primaryGreen"))
                                                .onTapGesture{
                                                    
                                                }
                                        }
                                        
                                        
                                        Toggle("",isOn: $isSelectedFacialNight)
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
                                        Image("nightToner")
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
                                            
                                            Text("Add your product")
                                                .font(.system(size:12))
                                                .fontWeight(.light)
                                                .foregroundColor(Color("primaryGreen"))
                                                .onTapGesture{
                                                    
                                                }
                                        }
                                        
                                        
                                        
                                        
                                        Toggle("",isOn: $isSelectedTonerNight)
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
                                        Image("nightSerum")
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
                                            
                                            Text("Add your product")
                                                .font(.system(size:12))
                                                .fontWeight(.light)
                                                .foregroundColor(Color("primaryGreen"))
                                                .onTapGesture{
                                                    
                                                }
                                        }
                                        
                                        
                                        
                                        
                                        Toggle("",isOn: $isSelectedSerumNight)
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
                                        Image("nightMoisturizer")
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
                                            
                                            Text("Add your product")
                                                .font(.system(size:12))
                                                .fontWeight(.light)
                                                .foregroundColor(Color("primaryGreen"))
                                                .onTapGesture{
                                                    
                                                }
                                        }
                                        
                                        
                                        
                                        
                                        Toggle("",isOn: $isSelectedMoisturizerNight)
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
                                        Image("nightAcneTreatment")
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
                                                .frame(width: 215,alignment: .leading)
                                            
                                            
                                            Spacer()
                                                .frame(height:20)
                                            
                                            Text("Add your product")
                                                .font(.system(size:12))
                                                .fontWeight(.light)
                                                .foregroundColor(Color("primaryGreen"))
                                                .onTapGesture{
                                                    
                                                }
                                        }
                                        
                                        
                                        
                                        
                                        Toggle("",isOn: $isSelectedAcneTreatmentNight)
                                            .labelsHidden()
                                            .toggleStyle(NewNightToggleCheckbox())
                                            .font(.largeTitle)
                                        
                                    }
                                }
                                
                                
                                
                                
                                
                                
                                
                            }
                        })
                        .padding(.leading,0)
                      
                        .frame(width: 500, height: 630)
                        .edgesIgnoringSafeArea(.bottom)
                        
                        
//                        Text("Set Reminder")
//                            .font(.system(size:20))
//                            .fontWeight(.bold)
//                            .padding(.leading,-180)
//                            .padding(.top,10)
                        
//                        ZStack{
//                            Rectangle()
//                                .fill(Color.blue)
//                                .frame(width: 350, height: 44)
//                                .cornerRadius(12)
//
//                                .padding(5)
                            
                            
//                            HStack{
//
//                                Toggle("Skincare Notification", isOn: $isSelectedSerumNight)
//                                
//                            }.frame(width: 360, height: 44, alignment: .leading)
//                            .edgesIgnoringSafeArea(.all)
                    }
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
               
                
                
            }
        }
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
    }
}


//tUTORIAL local notif= https://www.youtube.com/watch?v=iRjyk1S0nvo
