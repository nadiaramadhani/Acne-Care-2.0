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
import SwiftUICharts

struct HomePageView: View {
    @Binding var isShowPhoto: Bool
    
    @State private var isMorningCard = false
    @State private var isNightCard = false
    @State private var nightViewCheck = false
    @State private var TakePhotosonAlert = false
    @State private var summaryPageFromGraphic = false
    
    @ObservedObject var viewModel : HomeViewModel
    @State var isNightLinkActive = false
    @State var isDayLinkActive = false
    
    var body: some View {
        VStack{
            ZStack {
                Image("Oval2")
                    .ignoresSafeArea()
                VStack{
                    ZStack {
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
                                        Text(Date().getDisplayedTime())
                                            .padding(.trailing, 180)
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
                                                    ForEach(viewModel.productUsedDayNames, id:\.self){ name in
                                                        Text(name)
                                                            .font(.system(size: 17))
                                                            .padding(.leading, 35)
                                                    }
                                                    
                                                    
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
                                            if viewModel.isDayProductCreated {
                                                isDayLinkActive.toggle()
                                            }
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
                                                    
                                                    ForEach(viewModel.productUsedNightNames, id:\.self){ name in
                                                        Text(name)
                                                            .font(.system(size: 17))
                                                            .padding(.leading, 35)
                                                    }
                                                    
                                                    
                                                }
                                                .foregroundColor(Color.white)
                                                
                                                Button {
                                                    if viewModel.isNightProductCreated {
                                                        viewModel.doNightChecklist()
                                                        self.nightViewCheck = true
                                                    }else{
                                                        viewModel.createNightProduct()
                                                        isNightLinkActive.toggle()
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
                                                        self.isShowPhoto = true
                                                    }))
                                                })
                                            }
                                        }.onTapGesture {
                                            if viewModel.isNightProductCreated  {
                                                isNightLinkActive.toggle()
                                            }
                                        }
                                        
                                    }
                                    
                                }
                            }
                            
                            Rectangle()
                                .fill(Color(hex: "#EDECED"))
                                .frame(height: 8)
                                .edgesIgnoringSafeArea(.horizontal)
                            
                            VStack{
                                HStack{
                                    
                                    Text ("Skin Progress")
                                        .font(.system(size: 17).bold())
                                        .bold()
                                        .padding()
                                    
                                    Spacer()
                                    Button{
                                        self.summaryPageFromGraphic.toggle()
                                    }label: {
                                        Text("See more")
                                            .font(.system(size: 12).bold())
                                            .bold()
                                            .foregroundColor(Color(hex: "#006255"))
                                            .padding(.trailing, 26)
                                    }
                                }
                                
                                
                              
                                GraphicView(graphSource: $viewModel.chartData).onTapGesture {
                                    summaryPageFromGraphic.toggle()
                                }
                                
                            }
                            
                        }
                    }
                    .onAppear{
                       
                    }
                    
                }
            }
            .fullScreenCover(isPresented: $isNightLinkActive, onDismiss: {self.loadState()}){
               IntroProductView(pageDisplayed: .Night)
            }
            .fullScreenCover(isPresented: $isDayLinkActive,onDismiss: {self.loadState()}){
                IntroProductView(pageDisplayed: .Day)
            }
            .fullScreenCover(isPresented: $summaryPageFromGraphic, onDismiss: {self.loadState()}){
                NavigationView {SummaryPageView(graphData: viewModel.chartData)}
            }
            
          
        }.onAppear{
            loadState()
        }
        
        
    }
    
    private func loadState(){
        viewModel.getTotalWeekElapsed()
        viewModel.getProductNameUsed()
        viewModel.checkChecklistAvailablility()
        viewModel.getGraphLineData()
        print("appear")
    }
    
}

