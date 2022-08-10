//
//  MainPageView.swift
//  ACNIFY
//
//  Created by Rahmat Maftuh Ihsan on 24/06/22.
//

import SwiftUI

struct Box {
    var id: Int
    let title, imageUrl: String
    
}


struct MainPageView: View {
    
    let viewModel = HomeViewModel()
    
    let boxes:[Box] = [
        Box(id: 0, title:"12 Juni 2022", imageUrl:"0"),
        Box(id: 1, title:"13 Juni 2022", imageUrl:"0"),
        Box(id: 2, title:"14 Juni 2022", imageUrl:"0"),
        Box(id: 3, title:"15 Juni 2022", imageUrl:"0"),
        Box(id: 4, title:"16 Juni 2022", imageUrl:"0"),
    ]
    @AppStorage("signed_in") var currentUserSignedIn: Bool = false
    
    
    var body: some View {
        NavigationView{
 
                ZStack{
                    Color("secondaryYellow3rd")
                        .edgesIgnoringSafeArea(.all)
                    VStack{
                        
                        Text("Welcome \(viewModel.currentUser?.name ?? "Username")!")
                            .font(.system(size:24, weight:.bold,design: .default))
                            .italic()
                            .multilineTextAlignment(.leading)
                            .foregroundColor(Color("primaryGreen"))
                            .frame(width: 350, alignment: .leading)
                            .padding(.top)
                        
                        
                        
                        Text("What are you looking for today?")
                            .frame(width: 350, alignment: .leading)
                        //                    .font(.title3)
                            .font(.system(size:17, weight:.thin,design: .default))
                        //.padding(.leading, 0)
                            .padding(0)
                        
                        
                        ZStack{
                            RoundedRectangle(cornerRadius: 40)
                                .fill(Color(.white))
                                .edgesIgnoringSafeArea(.bottom)
                                .padding(.top)
                            VStack{
                                
                                
                                Text("Daily Routine")
                                    .font(.system(size:20, weight:.bold,design: .default))
                                    .padding(.leading,-170)
                                    .padding(.top,40)
                                
                                Spacer()
                                    .frame(height:0)
                                
                                
                                NavigationLink(destination: TesterPickerView().navigationBarHidden(true)){
                                    ZStack{
                                        Image("ICard")
                                            .padding()
                                            .shadow(color: .gray, radius: 2)
                                        
                                        
                                        VStack{
                                            Text("Skincare Time")
                                                .font(.system(size: 16))
                                                .fontWeight(.bold)
                                                .padding(.trailing, 165)
                                            
                                            
                                            Button(action: {
                                                withAnimation(.spring()){
                                                   }},
                                                   label: {
                                                Text("Update")
                                                    .font(.system(size:13))
                                                    .fontWeight(.semibold)
                                                    .foregroundColor(.white)
                                                    .padding()
                                                    .frame(width: 80, height: 41)
                                                    .background(
                                                        Color("primaryGreen")
                                                            .cornerRadius(10)
                                                            .shadow(radius: 5))
                                            })
                                            .padding(.trailing,200 )
                                            
                                            
                                        }
                                    }
                                }.buttonStyle(.plain)
                              
                
                                
                                
                                Spacer()
                                    .frame(height:35)
                                
                                Text("Skin Information")
                                    .font(.system(size:20, weight:.bold,design: .default))
                                    .padding(.leading,-170)
                                
                                NavigationLink(destination:  SkinResultView()      .navigationBarHidden(true)) {
                                    ZStack{
                                        RoundedRectangle(cornerRadius: 20, style:.continuous)
                                            .frame(width: 340, height: 92)
                                            .foregroundColor(Color("beige"))
                                        //                                    .fill(Color("beige"))
                                            .padding()
                                            .shadow(color: .brown, radius: 2)
                                        
                                        
                                        HStack{
                                            Image("mySkinPersona")
                                                .padding()
                                                .padding(.leading, 10)
                                            
                                            Text("My Skin Persona")
                                                .font(.system(size: 16))
                                                .fontWeight(.bold)
                                            
                                                .padding()
                                            Image("arrow")
                                                .padding()
                                                .padding(.trailing, 10)
                                        }
                                        
                                        
                                    }
                                    
                                }.buttonStyle(.plain)
                                
                                Spacer()
                                    .frame(height:35)
                                
                                HStack {
                                    Text("Acne Journey")
                                        .font(.system(size:20, weight:.bold,design: .default))
                                    //   .padding(.leading,-170)
                                    
                                    Spacer()
                                    
                                    NavigationLink(destination: HistoryView().navigationBarHidden(true)){
                                        Text("See more")
                                            .font(.system(size: 15))
                                            .foregroundColor(Color("primaryGreen"))
                                    }
                                     
                                }
                                .padding()
                                
                                Spacer()
                                    .frame(height:0)
                                
                                
                                ScrollView(.horizontal){
                                    HStack{
                                        
                                        BoxView()
                                        BoxView()
                                        BoxView()
                                        BoxView()
                                        BoxView()
                                        BoxView()
                                        
                                    }
                                }.padding(20)
                                
                            }
                            
                        }
                    }
                }
            }
    }
}


struct BoxView: View{
    var body: some View{
        VStack{
            Image("Image")
                .resizable()
                .frame(width:80, height:120)
                .cornerRadius(12) //Ini belum di set ukuran corner radiusnya
            Text("12 Juni 2022")
                .font(.system(size:14, weight:.thin,design: .default))
        }
    }
}


struct MainPageView_Previews: PreviewProvider {
    static var previews: some View {
        MainPageView()
    }
}
