//
//  SummaryPageView.swift
//  ACNIFY
//
//  Created by Rahmat Maftuh Ihsan on 19/08/22.
//

import SwiftUICharts
import SwiftUI

struct SummaryPageView: View {
    
    @State var isBack = false
    var body: some View {
        if isBack{
            HomePageView()
        }else{
            NavigationView{
                ScrollView{
                    VStack{
                        GraphicView()
                        
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
                                
                                Rectangle()
                                    .frame(width:338, height: 245)
                                
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
                        
                        Section{
                            VStack{
                                Text ("Review")
                                    .foregroundColor(Color("primaryGreen"))
                                    .font(.system(size: 17).bold())
                                //                                .Color("primaryGreen")
                                    .padding(.trailing,210-26)
                                
                                HStack{
                                    Image ("GirlExample")
                                    
                                    VStack{
                                        Section{
                                            Text ("Acne Spot")
                                                .foregroundColor(Color("primaryGreen"))
                                                .font(.system(size: 12))
                                                .fontWeight(.regular)
                                            
                                            Text ("12 Acne")
                                                .font(.system(size: 14))
                                                .fontWeight(.semibold)
                                        }
                                        
                                        Spacer()
                                            .frame(height:16)
                                        
                                        Section{
                                            Text ("Your Feeling")
                                                .foregroundColor(Color("primaryGreen"))
                                                .font(.system(size: 12))
                                                .fontWeight(.regular)
                                            
                                            Text ("😁")
                                                .font(.system(size: 14))
                                                .fontWeight(.semibold)
                                        
                                        Spacer()
                                            .frame(height:16)
                                            
                                        Section{
                                            Text ("Description")
                                                .foregroundColor(Color("primaryGreen"))
                                                .font(.system(size: 12))
                                                    .fontWeight(.regular)
                                                
                                            Text ("jerawat masi cukup banyak tapi sudah tidak meradang seperti sebelumnya")
                                                .multilineTextAlignment(.leading)
                                                .font(.system(size: 14))
                                        }
                                                
                                        }
                                    }
                                    .padding(.leading)
                                
                                }
                            }
                        }
                        
                        Section{
                            Text ("Your Product")
                                .foregroundColor(Color("primaryGreen"))
                                .font(.system(size: 17).bold())
                            //                                .Color("primaryGreen")
                                .padding(.trailing,210-26)
                        
                        DropdownView()
                        }
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
            // Legend
            Text ("Skin Progress")
                .foregroundColor(Color("primaryGreen"))
                .font(.system(size: 17).bold())
            //                                .Color("primaryGreen")
                .padding(.trailing,210-26)
            
            let iphone10 = Legend(color: Color("gray"), label: "iPhone10")
            
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
                .frame(width: 338, height: 181, alignment: .leading)
        }
        //
        
        //Resource: https://github.com/AfrazCodes/SwiftUICharts
    }
}

struct DropdownView: View{
    
    
    @State private var isExpandedDay = false
    @State private var isExpandedNight = false
    var body: some View{
        VStack{
            Section{
                DisclosureGroup(isExpanded: $isExpandedDay)
                    {
                    VStack{
                        Text ("Rahmat")
                        Text ("Rahmat")
                        Text ("Rahmat")
                        Text ("Rahmat")
                    }
                    .padding(.trailing,190)
                    .frame(width: 360)
                    .background(.green)
                    
                        
                    }label: {
                        HStack{
                            Image("dayDailyRoutine2")
                                .resizable()
                                .frame(width: 28, height: 28)
                            Text("Day Routine")
                                .font(.system(size: 16))
                                .fontWeight(.bold)
                        }
                    }
    //                .frame(width: 358, height: 44)
                    .font(.system(size: 16))
                    .foregroundColor(.black)
                    .background(Color("secondaryYellow3rd"))
                    .padding(.all)
                    .cornerRadius(8)
                    .accentColor(.black)
            }
            
         
            
            
            Section{
                DisclosureGroup(isExpanded: $isExpandedNight)
                    {
                    VStack{
                        Text ("Rahmat")
                        Text ("Rahmat")
                        Text ("Rahmat")
                        Text ("Rahmat")
                    }
                    .padding(.trailing,190)
                    .frame(width: 360)
                    .background(.green)
                    
                        
                    }label: {
                        HStack{
                            Image("nightSummary")
                                .resizable()
                                .frame(width: 28, height: 28)
                            Text("Day Routine")
                                .font(.system(size: 16))
                                .fontWeight(.bold)
                        }
                    }
    //                .frame(width: 358, height: 44)
                    .font(.system(size: 16))
                    .foregroundColor(.white)
                    .background(Color("purpleSummary"))
                    .padding(.all)
                    .cornerRadius(8)
                    .accentColor(.white)
            }
        }
    }
}
