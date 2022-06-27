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
    
    let boxes:[Box] = [
        Box(id: 0, title:"12 Juni 2022", imageUrl:"0"),
        Box(id: 1, title:"13 Juni 2022", imageUrl:"0"),
        Box(id: 2, title:"14 Juni 2022", imageUrl:"0"),
        Box(id: 3, title:"15 Juni 2022", imageUrl:"0"),
        Box(id: 4, title:"16 Juni 2022", imageUrl:"0"),
    ]
    
    @State var isDailyRoutineTapped = false
    @State var updateButton = false
    
    var body: some View {
        if isDailyRoutineTapped{
            TesterPickerView()
        }else if updateButton{
            TesterPickerView()
        }
        else{
            ZStack{
                Color("secondaryYellow3rd")
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    
                    Text("**Welcome Rudy**")
                    //.font(.title)
                        .font(.system(size:24, weight:.bold,design: .default))
                        .italic()
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color("primaryGreen"))
                        .frame(width: 350, alignment: .leading)
                        //.padding(.leading, 0)
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
                        // .frame(width: .infinity, height: 700)
                            .edgesIgnoringSafeArea(.bottom)
                            .padding(.top)
                        VStack{
//                            HStack{
//                                Image("girlOnHomepage")
//                                    .padding(.trailing,5)
//                                VStack{
//                                    Text("Rahmat")
//                                        .font(.system(size:14, weight:.thin,design: .default))
//                                        .padding(.leading,0)
//                                    Text("Rahmat")
//                                        .font(.system(size:16, weight:.semibold,design: .default))
//                                        .padding(.leading,0)
//                                }
//                            }
//                            .padding(.leading,-160)
                            
                            Text("Daily Routine")
                                .font(.system(size:20, weight:.bold,design: .default))
                                .padding(.leading,-170)
                                .padding(.top,40)
                            
                            Spacer()
                                .frame(height:0)
                            
                            ZStack{
                                Image("skincareTimeHomepage")
                                
                                Button(action: {self.updateButton = true},
                                       label: {
                                        Text("Update")
                                        .font(.system(size:13))
                                        .fontWeight(.semibold)
                                        .foregroundColor(.white)
                                        .padding()
                                        //.padding(.horizontal,6)
                                        .frame(width: 80, height: 41)
                                        .background(
                                            Color("primaryGreen")
                                                .cornerRadius(10)
                                                .shadow(radius: 5))
                                        .position(x:98, y:113)
                                })
                            }
                           // NavigationLink("", destination: DailyLogRoutine(),
                                          // isActive: $updateButton)
                            
                            
                            Spacer()
                                .frame(height:35)
                            
                            Text("Skin Information")
                                .font(.system(size:20, weight:.bold,design: .default))
                                .padding(.leading,-170)
                            
                            Image("skincareCardHomepage")
                                //.resizable() //ukuran bisa di custom
                                //.padding()
                                .onTapGesture {
                                    isDailyRoutineTapped = true
                                }
                            //NavigationLink("", destination: onBoardingView(),
                                           //isActive: $isDailyRoutineTapped)
                            
                            
                            Spacer()
                                .frame(height:35)
                            
                            Text("Activity")
                                .font(.system(size:20, weight:.bold,design: .default))
                                .padding(.leading,-170)
                            
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
            Image("0")
                .resizable()
                .frame(width:96, height:120)
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
