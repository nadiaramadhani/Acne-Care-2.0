//
//  TesterPickerView.swift
//  ACNIFY
//
//  Created by Rahmat Maftuh Ihsan on 25/06/22.
//

import SwiftUI

struct TesterPickerView: View {
    
    //BINDING UNTUK NARIK DATA PRODUCT YANG SUDAH DIPILIH
    

    @State var selected = 0
 
    
    @State var isCreateMorning = false
    @State var isCreateNight = false
    @State var isEditMorning = false
    @State var isEditNight = false
    @State var isBack = false
    
    @StateObject var lnManagerNight = LocalNotificationManagerNight()
    @StateObject var lnManagerMorning = LocalNotificationManagerMorning()
    
    
    var body: some View {
        
        if isBack{
            MainPageView()
        }else if isEditMorning{
            ProductPopUpMorning()
        }else if isEditNight{
            ProductPopUpNight()
//            NightChooseProduct()
//                .environmentObject(lnManagerNight)
                
        }else if isCreateMorning{
            ProductPopUpMorning()
            
        }else if isCreateNight{
            ProductPopUpNight()
//            NightChooseProduct()
//                .environmentObject(lnManagerNight)
            
        }
        else{
            
            NavigationView{
                ZStack{
//                    Color("secondaryYellow3rd")
//                        .edgesIgnoringSafeArea(.all)
                    VStack{
                    

                            Picker("What is your favorite color?", selection: $selected) {
                                
                                Text("Morning Routine").tag(0)
                                    .foregroundColor(.black)
                                    .font(.system(size:16))
                                
                                
                                Text("Night Routine").tag(1)
                                
                            }
                            .padding([.leading, .bottom, .trailing])
                            //.padding(.top, 20)
                            .pickerStyle(.segmented)
                            //.position(x: 195, y: -130)
//                            .frame(width:385, height:50)
                            
                            
                            if selected == 0{
                                VStack{
                                    Text("Edit")
                                        .font(.system(size:16))
                                        .fontWeight(.light)
                                        .foregroundColor(Color("primaryGreen"))
                                    //.padding(16)
                                        .foregroundColor(.gray)
                                        .frame(width:350,alignment: .trailing)
                                    
                                        .onTapGesture{
                                            self.isEditMorning = true
                                        }
                                    
//                                    HStack{
//
//                                        Toggle("Turn on the Skincare Notification", isOn: $isEditMorning)
//
//                                    }.frame(width: 360, height: 44, alignment: .leading)
//                                        .edgesIgnoringSafeArea(.all)
                                    Spacer()
                                    
                                    VStack{
                                        Image("sadMap")
                                        
                                        Text("You have not added a product, please add a product in the “Edit” button above")
                                            .font(.system(size:14))
                                            .fontWeight(.light)
                                            .frame(width: 300, alignment: .center)
                                            .multilineTextAlignment(.center)
                                        Button(action: {self.isCreateMorning = true},
                                               label: {
                                            Text("Create")
                                                .font(.headline)
                                                .fontWeight(.semibold)
                                                .foregroundColor(.white)
                                                .padding()
                                            //.padding(.horizontal,6)
                                                .frame(width: 153, height: 50)
                                                .background(
                                                    Color("primaryGreen")
                                                        .cornerRadius(10)
                                                        .shadow(radius: 5))
                                            
                            
                                        })
                            
//                                        NavigationLink("", destination: morningChooseProduct(),
//                                           isActive: $isCreateMorning)
                                    }
                                    Spacer()
                                    
                                }
                                
                                
                                //SEGMENTED NIGHT ROUTINE
                            }else if selected == 1{
                                VStack{
                                    Text("Edit")
                                        .font(.system(size:16))
                                        .fontWeight(.light)
                                        .foregroundColor(Color("primaryGreen"))
                                    //.padding(16)
                                        .foregroundColor(.gray)
                                        .frame(width:350,alignment: .trailing)
                                        .onTapGesture{
                                            self.isEditNight = true
                                        }
                                    
//                                    HStack{
//
//                                        Toggle("Turn on the Skincare Notification", isOn: $isEditNight)
//
//                                    }.frame(width: 360, height: 44, alignment: .leading)
//                                        .edgesIgnoringSafeArea(.all)
                                    
                                    Spacer()
                            
                                    VStack{
                                        Image("sadMap")
                                        
                                        Text("You have not added a product, please add a product in the “Edit” button above")
                                            .font(.system(size:14))
                                            .fontWeight(.light)
                                            .frame(width: 300, alignment: .center)
                                            .multilineTextAlignment(.center)
                                        
                                        Button(action: {self.isCreateNight = true},
                                               label: {
                                            Text("Create")
                                                .font(.headline)
                                                .fontWeight(.semibold)
                                                .foregroundColor(.white)
                                                .padding()
                                            //.padding(.horizontal,6)
                                                .frame(width: 153, height: 50)
                                                .background(
                                                    Color("primaryGreen")
                                                        .cornerRadius(10)
                                                        .shadow(radius: 5))
                                            
                            
                                        })
                            
                                        
//                                        NavigationLink("", destination: NightChooseProduct(),
//                                           isActive: $isCreateNight)
                                    }
                                    Spacer()
                                    
                                }
                            }
                            
                            
                            
                            
//                                        //Create Button
//                                        Button(action: {self.isCreate = true},
//                                               label: {
//                                            Text("Create")
//                                                .font(.headline)
//                                                .fontWeight(.semibold)
//                                                .foregroundColor(.white)
//                                                .padding()
//                                            //.padding(.horizontal,6)
//                                                .frame(width: 153, height: 50)
//                                                .background(
//                                                    Color("primaryGreen")
//                                                        .cornerRadius(10)
//                                                        .shadow(radius: 5))
//
//
//                                        })
//
//                                        NavigationLink("", destination: TakePhotos(),
//                                           isActive: $isCreate)
//
//                   // }
                    
 
                    
                }
               .navigationTitle("Skincare")
               .navigationBarTitleDisplayMode(.inline)
               .navigationBarItems(leading:
                                       HStack{
                   Button(action: {
                       self.isBack = true
                   }){
                       Label("",systemImage: "chevron.backward")
                       
                   }
                   
               }
                                   
                                   
               )
               
            }
            }
        }
    }
}


struct TesterPickerView_Previews: PreviewProvider {
    static var previews: some View {
        TesterPickerView()
    }
}
