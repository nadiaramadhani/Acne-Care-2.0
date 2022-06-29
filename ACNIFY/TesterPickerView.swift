//
//  TesterPickerView.swift
//  ACNIFY
//
//  Created by Rahmat Maftuh Ihsan on 25/06/22.
//

import SwiftUI

struct TesterPickerView: View {
    
//    let cards = [
//        Card(stepName:"Facial Wash",desc: "Wash your face with gentle face wash", imageInput:"Day"),
//        Card(stepName:"Moisturizer",desc: "Always make sure to hydrated your skin", imageInput:"Moisturizer"),
//        Card(stepName:"Acne Treatment",desc: "Treatments work to clear away bacteria and dry up the excess oils that lead to acne", imageInput:"Day"),
//        Card(stepName:"Sunscreen",desc: "Protect the skin from the harmful effects of the sun", imageInput:"Day")
//
//    ]
   
    //@State private var selectedCard: Card?
    @State var selected = 0
//    @State private var isSelectedFacialMorning: Bool = false
//    @State private var isSelectedMoisturizerMorning: Bool = false
//    @State private var isSelectedAcneTreatmentMorning: Bool = false
//    @State private var isSelectedSunscreenMorning: Bool = false
//    @State private var isSelectedFacialNight: Bool = false
//    @State private var isSelectedMoisturizeNight: Bool = false
//    @State private var isSelectedAcneTreatmentNight: Bool = false
    
    @State var isNext = false
    @State var isEditMorning = false
    @State var isEditNight = false
    @State var isBack = false
    
    var body: some View {
        
        if isBack{
            MainPageView()
        }else if isEditMorning{
            morningChooseProduct()
        }else if isEditNight{
            NightChooseProduct() 
        }else{
        NavigationView{
            
        ZStack{
            Color("secondaryYellow3rd")
                  .edgesIgnoringSafeArea(.all)
        VStack {
            Picker("What is your favorite color?", selection: $selected) {
               
                Text("Morning Routine").tag(0)
                    .foregroundColor(.black)
                    .font(.system(size:16))
                    
                  
                Text("Night Routine").tag(1)
             
            }
            .padding([.leading, .bottom, .trailing])
            //.padding(.top, 20)
            .pickerStyle(.segmented)
            .position(x: 195, y: -130)
            .frame(width:385, height:50)
           
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
                    
                    HStack{

                        Toggle("Turn on the Skincare Notification", isOn: $isEditMorning)
                        
                    }.frame(width: 360, height: 44, alignment: .leading)
                    .edgesIgnoringSafeArea(.all)
                    
                    VStack{
                        Image("sadMap")
                    
                    Text("You have not added a product, please add a product in the “Edit” button above")
                        .font(.system(size:14))
                        .fontWeight(.light)
                        .frame(width: 300, alignment: .center)
                        .multilineTextAlignment(.center)
                    }
                    
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
                    
                    HStack{

                        Toggle("Turn on the Skincare Notification", isOn: $isEditNight)
                        
                    }.frame(width: 360, height: 44, alignment: .leading)
                    .edgesIgnoringSafeArea(.all)
                    VStack{
                        Image("sadMap")
                    
                    Text("You have not added a product, please add a product in the “Edit” button above")
                        .font(.system(size:14))
                        .fontWeight(.light)
                        .frame(width: 300, alignment: .center)
                        .multilineTextAlignment(.center)
                    }
                }
            }
            
            
            
            
//            //Next Button
//            Button(action: {self.isNext = true},
//                   label: {
//                Text("Next")
//                    .font(.headline)
//                    .fontWeight(.semibold)
//                    .foregroundColor(.white)
//                    .padding()
//                //.padding(.horizontal,6)
//                    .frame(width: 153, height: 50)
//                    .background(
//                        Color("primaryGreen")
//                            .cornerRadius(10)
//                            .shadow(radius: 5))
//
//            })
            
            NavigationLink("", destination: TakePhotos(),
                           isActive: $isNext)
        }
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
//        .navigationBarItems(trailing:
//            HStack{
//                Button(action: {
//                    self.isEdit = true
//            }){
//                Text("Edit")
//                    .padding(16)
//                    .foregroundColor(.gray)
//                    .frame(alignment: .leading)
//
//            }
//
//            }
//
//
//        )
        
        
    }
        }
}
}


struct TesterPickerView_Previews: PreviewProvider {
    static var previews: some View {
        TesterPickerView()
    }
}
