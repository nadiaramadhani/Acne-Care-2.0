//
//  HomePageView.swift
//  ACNIFY
//
//  Created by Local Administrator on 16/08/22.
//
//
//  HomePageView.swift
//  ACNIFY
//
//  Created by Local Administrator on 15/08/22.
//

import SwiftUI

struct HomePageView: View {
    
    @State private var isMorningCard = false
    @State private var isNightCard = false
    @State private var nightViewCheck = false
    @State private var TakePhotosonAlert = false
    @State private var summaryPageFromGraphic = false
    
    @ObservedObject var viewModel = HomeViewModel()
    @State var isNightLinkActive = false
    @State var isDayLinkActive = false
    
    var body: some View {
        NavigationView{
        ZStack {
            NavigationLink(destination: TakePhotos(viewModel: TreatmentPhotoViewModel(acneLog: viewModel.nightLog)).navigationBarHidden(true), isActive: self.$TakePhotosonAlert) { EmptyView() }
            Image("Oval2")
                .ignoresSafeArea()
            VStack{
                ZStack {
                    NavigationLink(destination: IntroProductView(pageDisplayed: .Night)
                        .navigationBarHidden(true), isActive: $isNightLinkActive) {EmptyView()}
                    NavigationLink(destination: IntroProductView(pageDisplayed: .Day)
                        .navigationBarHidden(true), isActive: $isDayLinkActive) {EmptyView()}
                    
                    NavigationLink(destination: TakePhotos(viewModel: TreatmentPhotoViewModel(acneLog: viewModel.nightLog)).navigationBarHidden(true), isActive: self.$TakePhotosonAlert) { EmptyView() }
                    VStack{
                        Image("Oval2")
                            .ignoresSafeArea()
                        Spacer()
                    }
                    VStack{
                        HStack{
                            Text("Welcome \(viewModel.currentUser?.name ?? "User")!")
                                .font(.title3)
                                .fontWeight(.bold)
                                .italic()
                                .padding(.leading)
                                .foregroundColor(Color("primaryGreen"))
                            
                            Spacer()
                            
                        }
                        HStack{
                            
                            Text(viewModel.totalWeekSinceFirstLog)
                                .padding(.leading)
                            Spacer()
                            
                        }
                        .padding(.bottom)
                        ZStack{
                            Section{
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(Color.white)
                                    .frame(width: 370, height: 364)
                                    .shadow(color: .gray, radius: 3)
                                
                                VStack {
                                    
                                    Text("Today's Routine")
                                        .font(.system(size: 17))
                                        .fontWeight(.bold)
                                        .padding(.trailing, 220)
                                    Text("Monday, 15 August")
                                        .padding(.trailing, 200)
                                        .foregroundColor(.gray)
                                    
                                    
                                    ZStack {
                                        
                                        Image("dayCard")
                                            .frame(width: 325, height: 143)
                                        HStack{
                                            VStack(alignment: .leading){
                                                HStack{
                                                    
                                                    Image("day")
                                                    Text("Day Routine")
                                                        .font(.system(size: 16))
                                                        .fontWeight(.bold)
                                                }
                                                Text("Facewash")
                                                    .font(.system(size: 17))
                                                    .padding(.leading, 35)
                                                
                                                Text("Moisturizer")
                                                    .font(.system(size: 17))
                                                    .padding(.leading, 35)
                                                
                                                Text("Sunscreen")
                                                    .font(.system(size: 17))
                                                    .padding(.leading, 35)
                                                
                                                
                                            }
                                            Spacer()
                                                .frame(width:35)
                                            
                                            Button {
                                                if viewModel.isDayProductCreated {
                                                    viewModel.doDayChecklist()
                                                }else{
                                                    viewModel.createDayProduct()
                                                    isDayLinkActive.toggle()
                                                    
                                                }
                                            } label: {
                                                Text(viewModel.isDayProductCreated ? "Done" : "Create")
                                                    .font(.system(size: 13))
                                                    .fontWeight(.semibold)
                                            }
                                            .foregroundColor(Color.white)
                                            .frame(width: 80, height: 41)
                                            .background(Color("yellow"))
                                            .cornerRadius(12)
                                            .padding(.leading, 60).opacity(viewModel.dayLog == nil ? 1 : 0.6)
                                            
                                            
                                            
                                            
                                        }
                                    }.onTapGesture {
                                        isDayLinkActive.toggle()
                                    }
                                    
                                    
                                    
                                    
                                    
                                    
                                    ZStack{
                                        Image("nightCard")
                                        HStack{
                                            VStack(alignment: .leading){
                                                HStack{
                                                    Image("night")
                                                    Text("Night Routine")
                                                        .font(.system(size: 16))
                                                        .fontWeight(.bold)
                                                }
                                                Text("Facewash")
                                                    .font(.system(size: 17))
                                                    .padding(.leading, 35)
                                                
                                                Text("Moisturizer")
                                                    .font(.system(size: 17))
                                                    .padding(.leading, 35)
                                                
                                                Text("Acne Treatment")
                                                    .font(.system(size: 17))
                                                    .padding(.leading, 35)
                                                
                                                
                                            }
                                            .foregroundColor(Color.white)
                                            
                                            Button {
                                                if viewModel.isNightProductCreated {
                                                    viewModel.doNightChecklist()
                                                    self.nightViewCheck = true
                                                }else{
                                                    viewModel.createNightProduct()
                                                    isDayLinkActive.toggle()
                                                }
                                                
                                            } label: {
                                                Text(viewModel.isNightProductCreated ? "Done" : "Create")
                                                    .font(.system(size: 13))
                                                    .fontWeight(.semibold)
                                            }
                                            .foregroundColor(Color.black)
                                            .frame(width: 80, height: 41)
                                            .background(Color.white)
                                            .cornerRadius(12)
                                            .padding(.leading, 60)
                                            .opacity(viewModel.nightLog == nil ? 1 : 0.6)
                                            .alert(isPresented: $nightViewCheck, content:{
                                                Alert(title: Text("Would you like to take a photo to record today's progress?"),
                                                      primaryButton: .destructive(Text("Skip"), action:{
                                                    print("Skip has been selected")
                                                }), secondaryButton: .default(Text("Take Photos"), action:{
                                                    self.TakePhotosonAlert = true
                                                }))
                                            })
                                        }
                                    }.onTapGesture {
                                        isNightLinkActive.toggle()
                                    }
                                    
                                }
                                
                            }
                        }
                        
                        Rectangle()
                            .fill(Color(hex: "#EDECED"))
                            .frame(height: 8)
                            .edgesIgnoringSafeArea(.horizontal)
//                        HStack{
//
//                            Spacer()
//
//                        }.padding(.leading, 26)
//                            .padding(.top, 5)
                        
                        VStack{
                            HStack{
                                
                                Text ("Skin Progress")
                                    .font(.system(size: 17).bold())
                                    .bold()
                                    .padding()
                                
                                Spacer()
                                Button{
                                    
                                }label: {
                                    Text("See more")
                                        .font(.system(size: 12).bold())
                                        .bold()
                                        .foregroundColor(Color(hex: "#006255"))
                                        .padding(.trailing, 26)
                                }
                            }
                            GraphicView()
                                .onTapGesture {
                                    summaryPageFromGraphic.toggle()
                                }
                            NavigationLink("",destination: (SummaryPageView()),isActive: $summaryPageFromGraphic)
                                .navigationBarHidden(true)
                        }
                        
                    }
                }
                .onAppear{
                    viewModel.getTotalWeekElapsed()
                    viewModel.checkChecklistAvailablility()
                }
                
            }
        }
    }
    }

}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}
