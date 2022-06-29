//
//  Rahmat1.swift
//  ACNIFY
//
//  Created by Rahmat Maftuh Ihsan on 27/06/22.
//



//Ini untuk page milih daily morning

import Foundation
import SwiftUI

struct morningChooseProduct: View {
    
    
    @State private var selected = 0
    @State private var isSelectedOilCleanserMorning: Bool = false
    @State private var isSelectedFacialMorning: Bool = false
    @State private var isSelectedToner: Bool = false
    @State private var isSelectedSerum: Bool = false
    @State private var isSelectedMoisturizerMorning: Bool = false
    @State private var isSelectedAcneTreatmentMorning: Bool = false
    @State private var isSelectedSunscreenMorning: Bool = false

    
    @State var isNext = false
    @State var isDone = false
    @State var isBack = false
    
    var body: some View {
        
        if isBack{
            TesterPickerView()
        }else if isDone{
            TesterPickerView()
        }else{
            NavigationView{
                
                ZStack{
                    Color(.white)
                        .edgesIgnoringSafeArea(.all)
                    VStack {
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
                                            
                                            Text("Add your product")
                                                .font(.system(size:12))
                                                .fontWeight(.light)
                                                .foregroundColor(Color("primaryGreen"))
                                                .onTapGesture{
                                                    
                                                }
                                        }
                                        
                                        
                                        
                                        
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
                                            
                                            Text("Add your product")
                                                .font(.system(size:12))
                                                .fontWeight(.light)
                                                .foregroundColor(Color("primaryGreen"))
                                                .onTapGesture{
                                                    
                                                }
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
                                            
                                            Text("Add your product")
                                                .font(.system(size:12))
                                                .fontWeight(.light)
                                                .foregroundColor(Color("primaryGreen"))
                                                .onTapGesture{
                                                    
                                                }
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
                                            
                                            Text("Add your product")
                                                .font(.system(size:12))
                                                .fontWeight(.light)
                                                .foregroundColor(Color("primaryGreen"))
                                                .onTapGesture{
                                                    
                                                }
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
                                            
                                            Text("Add your product")
                                                .font(.system(size:12))
                                                .fontWeight(.light)
                                                .foregroundColor(Color("primaryGreen"))
                                                .onTapGesture{
                                                    
                                                }
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
                                            
                                            Text("Add your product")
                                                .font(.system(size:12))
                                                .fontWeight(.light)
                                                .foregroundColor(Color("primaryGreen"))
                                                .onTapGesture{
                                                    
                                                }
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
                                            
                                            Text("Add your product")
                                                .font(.system(size:12))
                                                .fontWeight(.light)
                                                .foregroundColor(Color("primaryGreen"))
                                                .onTapGesture{
                                                    
                                                }
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
                        .frame(width: 500, height: 660)
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

//struct ToggleCheckbox: ToggleStyle {
//    func makeBody(configuration: Configuration) -> some View{
//        Button {
//            configuration.isOn.toggle()
//        } label: {
//            Image(systemName: "checkmark.square")
//                .symbolVariant(configuration.isOn ? .fill: .none)
//        }
//        .tint(Color(.gray)) //atau "primaryGreen"
//    }
//}

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
    }
}


//tUTORIAL local notif= https://www.youtube.com/watch?v=iRjyk1S0nvo
