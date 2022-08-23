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
    @ObservedObject var viewModel = SummaryViewModel()
    @Binding var graphData: LineChartData
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
                ScrollView{
                    ScrollViewReader { value in
                    VStack{
                        Spacer()
                            .frame(height: 24)
                        
                        ZStack{
                            RoundedRectangle(cornerRadius: 8)
                                .frame(width: 338, height: 40)
                                .foregroundColor(Color("yellow2"))
                              
                                .shadow(color: Color("yellow2s"), radius: 2)
                            Text("Your skin is getting better, keep going")
                                .font(.caption)
                        }
                       
                        HStack{
                        Text ("Skin Progress")
                                .foregroundColor(Color("primaryGreen"))
                            .font(.system(size: 17).bold())
                            .bold()
                            Spacer()
                           
                        }.padding(.leading, 26)
                            .padding(.top, 5)
                        
                        GraphicView(graphSource: $graphData)
                        
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
                                    
                                    CustomCalendar(currentDate: $currentDate, progressDay: $progressDay, progressNight: $progressNight, acneLogList: $viewModel.acneLogList, dateSelected: $viewModel.selectedDate){
                                        viewModel.getAcnelogData()
                                        
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                            value.scrollTo(1)
                                            
                                        }
                                       
                                    }
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
                        
                        if viewModel.selectedAcneLog != nil {
                            VStack{
                            Spacer()
                                .frame(height: 40)
                            
                                ReviewView(acnelog: viewModel.selectedAcneLog!)
                              
                            
                            Spacer()
                                .frame(height: 32)
                            
                            DropdownView(acnelog: viewModel.selectedAcneLog!)
                                    
                            }.id(1)
                        }
                       
                        
                    }
                    .navigationBarTitle("Summary")
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarBackButtonHidden(true)
                    .navigationBarItems(leading:
                                            HStack{
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }){
                            Image(systemName: "chevron.left")
                                .foregroundColor(Color("primaryGreen"))
                                .frame(alignment: .leading)
                    
                        }
                        
                    }
                                        
                                        
                    )
                }
            }
            .
            onAppear{
                viewModel.getAcnelogData()
            }
         
        }
        
        }


struct GraphicView: View{
    @Binding var graphSource: LineChartData
    var body: some View{
        
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color.white)
                .frame(width: 338, height: 181)
                .shadow(color: .gray, radius: 3)
        VStack(alignment:.leading){

            Text ("Your Acne")
                .foregroundColor(Color("primaryGreen"))
                .font(.system(size: 11).bold())
                .bold()
                .padding(.bottom)
                            
            
            LineChartDemoView(data: $graphSource)
                .frame(width: 300, height: 100, alignment: .center)

       
        }
        }
    }
}



struct ReviewView: View{
    var acnelog: AcneLog
    var body: some View{
       
            VStack{
                Text ("Review")
                    .foregroundColor(Color("primaryGreen"))
                    .font(.system(size: 17).bold())
                //                                .Color("primaryGreen")
                    .padding(.trailing,285)
                
                HStack{
                    Image(uiImage: UIImage(data: acnelog.image!)!)
                        .resizable()
                        .frame(width: 132, height: 184)
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
                            
                         
                            
                            Text (TreatmentPhotoViewModel.conditionToEmoji(condition: acnelog.condition ?? ""))
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
                            
                                
                            Text (acnelog.desc ?? "jerawat masi cukup banyak tapi sudah tidak meradang seperti sebelumnya")
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
    var acnelog: AcneLog
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

