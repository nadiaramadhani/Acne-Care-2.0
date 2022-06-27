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
    @State private var selected = 0
    @State private var isSelectedFacialMorning: Bool = false
    @State private var isSelectedMoisturizerMorning: Bool = false
    @State private var isSelectedAcneTreatmentMorning: Bool = false
    @State private var isSelectedSunscreenMorning: Bool = false
    @State private var isSelectedFacialNight: Bool = false
    @State private var isSelectedMoisturizeNight: Bool = false
    @State private var isSelectedAcneTreatmentNight: Bool = false
    
    @State var isNext = false
    @State var isEdit = false
    @State var isBack = false
    
    var body: some View {
        
        if isBack{
            MainPageView()
        }else if isEdit{
            MainPageView()
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
            .padding(.top, -10.0)
            .pickerStyle(.segmented)
            //.position(x: 195, y: 50)
            .frame(width:385)
            //CARA 1
            
            if selected == 0{
                ScrollView(.vertical, showsIndicators: false, content: {
                    VStack{
                        ZStack{
                        Rectangle()
                            .fill(Color.white)
                            .frame(width: 355, height: 115)
                            .cornerRadius(12)
                            .padding(5)
                        
                            HStack{
                                Image("Day")
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
                                    .toggleStyle(ToggleCheckboxStyle())
                                    .font(.largeTitle)
                                
                            }
                        }
                        
                        ZStack{
                        Rectangle()
                            .fill(Color.white)
                            .frame(width: 355, height: 115)
                            .cornerRadius(12)
                            .padding(5)
                        
                            HStack{
                                Image("Day")
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

                                
                                    
                                
                                Toggle("",isOn: $isSelectedMoisturizerMorning)
                                    .labelsHidden()
                                    .toggleStyle(ToggleCheckboxStyle())
                                    .font(.largeTitle)
                                
                            }
                        }
                        
                        ZStack{
                        Rectangle()
                            .fill(Color.white)
                            .frame(width: 355, height: 115)
                            .cornerRadius(12)
                            .padding(5)
                        
                            HStack{
                                Image("Day")
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
                                    .toggleStyle(ToggleCheckboxStyle())
                                    .font(.largeTitle)
                                
                            }
                        }
                        
                        ZStack{
                        Rectangle()
                            .fill(Color.white)
                            .frame(width: 355, height: 115)
                            .cornerRadius(12)
                            .padding(5)
                        
                            HStack{
                                Image("Day")
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
                                    .toggleStyle(ToggleCheckboxStyle())
                                    .font(.largeTitle)
                                
                            }
                        }
                        

                        


                    }
                })
                .padding(.leading,0)
                .frame(width: 500, height: 570)
                
                
                
                //SEGMENTED NIGHT ROUTINE
            }else if selected == 1{
                ScrollView(.vertical, showsIndicators: false, content: {
                    VStack{
                        ZStack{
                        Rectangle()
                            .fill(Color.white)
                            .frame(width: 355, height: 115)
                            .cornerRadius(12)
                            .padding(5)
                        
                            HStack{
                                Image("Day")
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

                                
                                    
                                
                                Toggle("",isOn: $isSelectedFacialNight)
                                    .labelsHidden()
                                    .toggleStyle(ToggleCheckboxStyle())
                                    .font(.largeTitle)
                                
                            }
                        }
                        
                        ZStack{
                        Rectangle()
                            .fill(Color.white)
                            .frame(width: 355, height: 115)
                            .cornerRadius(12)
                            .padding(5)
                        
                            HStack{
                                Image("Day")
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

                                
                                    
                                
                                Toggle("",isOn: $isSelectedMoisturizeNight)
                                    .labelsHidden()
                                    .toggleStyle(ToggleCheckboxStyle())
                                    .font(.largeTitle)
                                
                            }
                        }
                        
                        ZStack{
                        Rectangle()
                            .fill(Color.white)
                            .frame(width: 355, height: 115)
                            .cornerRadius(12)
                            .padding(5)
                        
                            HStack{
                                Image("Day")
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

                                
                                    
                                
                                Toggle("",isOn: $isSelectedAcneTreatmentNight)
                                    .labelsHidden()
                                    .toggleStyle(ToggleCheckboxStyle())
                                    .font(.largeTitle)
                                
                            }
                        }

                      


                    }
                })
                .padding(.leading,0)
                .frame(width: 500, height: 570)
            }
            
            
            //Next Button
            Button(action: {self.isNext = true},
                   label: {
                Text("Next")
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
        .navigationBarItems(trailing:
            HStack{
                Button(action: {
                    self.isEdit = true
            }){
                Text("Edit")
                    .padding(16)
                    .foregroundColor(.gray)
                    .frame(alignment: .leading)
                
            }
            
            }
                            
                            
        )
        
        
    }
        }
}
}

//struct Card: Identifiable{
//    let stepName: String
//    let desc: String
//    let imageInput: String
//    let id  = UUID()
//}

struct ToggleCheckboxStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View{
        Button {
            configuration.isOn.toggle()
        } label: {
            Image(systemName: "checkmark.square")
                .symbolVariant(configuration.isOn ? .fill: .none)
        }
        .tint(Color(.gray)) //atau "primaryGreen"
    }
}

struct TesterPickerView_Previews: PreviewProvider {
    static var previews: some View {
        TesterPickerView()
    }
}
