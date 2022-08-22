//
//  SummaryPageView.swift
//  ACNIFY
//
//  Created by Rahmat Maftuh Ihsan on 21/08/22.
//


import SwiftUI
import SwiftUICharts

struct SummaryPageView: View {
    
    @State var isBack = false
    @State var currentDate: Date = Date()
    @State var progressDay : Float = 0.5
    @State var progressNight: Float = 1.0
    
    var body: some View {
        if isBack{
            HomePageView()
        }else{
            NavigationView{
                ScrollView{
                    VStack{
                        Spacer()
                            .frame(height: 24)
                            
                        GraphicView()
                        
                        Spacer()
                            .frame(height: 32)
                       

                        Section{
                            VStack{
                                Text ("Look at your progress")
                                    .foregroundColor(Color("primaryGreen"))
                                    .font(.system(size: 17).bold())
                                //                                .Color("primaryGreen")
                                    .padding(.trailing,210-26)
                                
                                Spacer()
                                    .frame(height:8)
                                
                                Text("Choose the date to see the details")
                                    .font(.system(size: 12))
                                    .fontWeight(.regular)
                                    .padding(.trailing,190-26)
                                
                                ZStack{
                                    RoundedRectangle(cornerRadius: 8)
                                        .frame(width: 350, height: 400)
                                        .foregroundColor(.white)
                                        .shadow(color: .gray, radius: 2)
                                    
                                    CustomCalendar(currentDate: $currentDate, progressDay: $progressDay, progressNight: $progressNight)
                                        .frame(width: 338, height: 245)
                                        
                                }
                                .padding()

                                Spacer()
                                    .frame(height:24)
                                
                                VStack{
                                    HStack{
                                        Image("PhotoTake")
                                        Text("Photo Taken")
                                            
                                    }
                                    .padding(.trailing,220)
                                    
                                    Spacer()
                                        .frame(height:8)
                                    
                                    HStack{
                                        Image("DayRing")
                                        Text("Completed Day Routine")
                                    }
                                    .padding(.trailing,130)
                                    
                                    Spacer()
                                        .frame(height:8)
                                    
                                    HStack{
                                        Image("NightRing")
                                        Text("Completed Night Routine")
                                    }
                                    .padding(.trailing,120)
                                    
                                    Spacer()
                                        .frame(height:8)
                                    
                                    HStack{
                                        Image("CompleteRing")
                                        Text("Completed Day & Night Routine")
                                    }
                                    .padding(.trailing,75)

                                }
                                
                                
                            }
                            
                            
                        }
                        
                        Spacer()
                            .frame(height: 40)
                        
                        ReviewView()
                        
                        Spacer()
                            .frame(height: 32)
                        
                        DropdownView()
                        
                    }
                    .navigationBarTitle("Summary")
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarItems(leading:
                                            HStack{
                        Button(action: {
                            self.isBack = true
                        }){
                            Image(systemName: "chevron.left")
                                .foregroundColor(Color("primaryGreen"))
                                .frame(alignment: .leading)
                    
                        }
                        
                    }
                                        
                                        
                    )
                }
            }
            .navigationBarHidden(true)
    }
        
        
        
        
    }
}

struct SummaryPageView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryPageView()
    }
}

struct GraphicView: View{
    var body: some View{
        
        VStack{
            //MARK: Ini cara buat grafik pake resource yang ini https://github.com/AfrazCodes/SwiftUICharts
            // Legend
            Text ("Skin Progress")
                .foregroundColor(Color("primaryGreen"))
                .font(.system(size: 17).bold())
            //                                .Color("primaryGreen")
                .padding(.trailing,235)
            
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(Color.white)
                    .frame(width: 338, height: 200)
                    .shadow(color: .gray, radius: 3)
                
                Section{
                    let iphone10 = Legend(color: Color("primaryGreen"), label: "")
                        

                    // DataPoint
                    let points: [DataPoint] = [
                        .init(value: 2, label:"Week 1", legend: iphone10),
                        .init(value: 1, label:"Week 2", legend: iphone10),
                        .init(value: 3, label:"Week 3", legend: iphone10),
                        .init(value: 1, label:"Week 4", legend: iphone10)

                    ]

                    // Line
                    LineChartView(dataPoints: points)
                        .padding()
                        .frame(width: 338, height: 100, alignment: .leading)
                }
            }
            
            //MARK: iIni cara buat grafik pake resource ini https://www.youtube.com/watch?v=0CG1pKOw1sw&t=912s
//            LineView(data: [2,3,1,3,2], title: "Your Skin", legend: "Aaaa")
//                .padding()
//                .frame(width: 338, height: 181, alignment: .leading)

        }
        //
        
       
        
    }
}



struct ReviewView: View{
    var body: some View{
       
            VStack{
                Text ("Review")
                    .foregroundColor(Color("primaryGreen"))
                    .font(.system(size: 17).bold())
                //                                .Color("primaryGreen")
                    .padding(.trailing,285)
                
                HStack{
                    Image ("GirlExample")
                        .padding(.leading)
                    
                    Spacer()
                        .frame(width:24)
                    
                    VStack{
                        Section{
                            Text ("Acne Spot")
                                .foregroundColor(Color("primaryGreen"))
                                .font(.system(size: 12))
                                .fontWeight(.regular)
                                .frame(width: 200, alignment: .leading)
                            
                            Text ("12 Acne")
                                .font(.system(size: 14))
                                .fontWeight(.semibold)
                                .frame(width: 200, alignment: .leading)
                            
                            
                        }
                        
                        Spacer()
                            .frame(height:16)
                        
                        Section{
                            Text ("Your Feeling")
                                .foregroundColor(Color("primaryGreen"))
                                .font(.system(size: 12))
                                .fontWeight(.regular)
                                .frame(width: 200, alignment: .leading)
                            
                         
                            
                            Text ("😁")
                                .font(.system(size: 14))
                                .fontWeight(.semibold)
                                .frame(width: 200, alignment: .leading)
                        
                        Spacer()
                            .frame(height:16)
                            
                        Section{
                            Text ("Description")
                                .foregroundColor(Color("primaryGreen"))
                                .font(.system(size: 12))
                                .frame(width: 200, alignment: .leading)
                            
                                
                            Text ("jerawat masi cukup banyak tapi sudah tidak meradang seperti sebelumnya")
                                .frame(width: 200, alignment: .leading)
                                .multilineTextAlignment(.leading)
                                .font(.system(size: 14))
                        }
                                
                        }
                    }
                    //width: 338-24-132 = 182 ~ 180
                //height: 245,184
                    .frame(width: 200, height: 180)
                    
                
                }
            }
        
    }
}

struct DropdownView: View{
    
    
    @State private var isExpandedDay = false
    @State private var isExpandedNight = false
    var body: some View{
        VStack(spacing:8 ){
            Section{
                Text ("Your Product")
                    .foregroundColor(Color("primaryGreen"))
                    .font(.system(size: 17).bold())
                //                                .Color("primaryGreen")
                    .padding(.trailing,240)
            }
            
            Section{
                DisclosureGroup(isExpanded: $isExpandedDay)
                    {
                    VStack{
                        HStack{
                            Circle()
                                .foregroundColor(Color("kuningTerang"))
                                .frame(width: 11, height: 11)
                            
                            Spacer()
                                .frame(width: 12)
                            
                            Text ("Facial Wash")
                        }
                        
                       
                       
                    }
                    .padding(.trailing,140)
                    .frame(width: 345)
                    
                    
                    
                        
                    }
                
            
                    label: {
                        HStack{
                            Image("dayDailyRoutine2")
                                .resizable()
                                .frame(width: 28, height: 28)
                            Text("Day Routine")
                                .font(.system(size: 16))
                                .fontWeight(.bold)
                        }
                        
                    }
                    .frame(width: 310)
                    .padding(.all)
                    .font(.system(size: 16))
                    .foregroundColor(.black)
                    .background(Color("secondaryYellow3rd"))
                    .cornerRadius(8)
                    
                    .accentColor(.black)
                    
            }.shadow(color: .gray, radius: 3)
            
                        
            Section{
                DisclosureGroup(isExpanded: $isExpandedNight)
                    {
                    VStack{
                        HStack{
                            Circle()
                                .foregroundColor(Color("kuningTerang"))
                                .frame(width: 11, height: 11,alignment: .leading)
                            
                            Spacer()
                                .frame(width: 12)
                                
                            Text ("Facial Wash")
                                .foregroundColor(.white)
                        }
                      
                    }
                    .padding(.trailing,140)
                    .frame(width: 345)
                    
                    
                        
                    }label: {
                        HStack{
                            Image("nightSummary")
                                .resizable()
                                .frame(width: 28, height: 28)
                            Text("Night Routine")
                                .font(.system(size: 16))
                                .fontWeight(.bold)
                        }
                    }
                    .frame(width: 310)
                    .padding(.all)
                    .font(.system(size: 16))
                    .foregroundColor(.white)
                    .background(Color("purpleSummary"))
                    .cornerRadius(8)
                    .accentColor(.white)
            }
            .shadow(color: .gray, radius: 9)
        }
    }
}

