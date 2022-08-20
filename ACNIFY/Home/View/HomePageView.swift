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
    
    @ObservedObject var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationView{
            ZStack {
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
                            
                            NavigationLink(destination: IntroProductView(pageDisplayed: .Day)
                                .navigationBarHidden(true)){
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
                                                viewModel.doDayChecklist()
                                            } label: {
                                                Text("Done")
                                                    .font(.system(size: 13))
                                                    .fontWeight(.semibold)
                                            }
                                            .foregroundColor(Color.white)
                                            .frame(width: 80, height: 41)
                                            .background(Color("yellow"))
                                            .cornerRadius(12)
                                            .padding(.leading, 60)
                                            .opacity(viewModel.dayLog == nil ? 1 : 0.6)
                                            
                                            
                                            
                                            
                                        }
                                    }
                                }.buttonStyle(.plain)
                            
                            
                            
                            
                            NavigationLink(
                                destination: IntroProductView(pageDisplayed: .Night)
                                    .navigationBarHidden(true)
                            ){
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
                                            viewModel.doNightChecklist()
                                            self.nightViewCheck = true
                                        } label: {
                                            Text("Done")
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
                                                print(viewModel.nightLog?.image)
                                            }), secondaryButton: .default(Text("Take Photos"), action:{
                                                self.TakePhotosonAlert = true
                                            }))
                                        })
                                    }
                                }
                            }
                            
                            
                            
                        }
                    }
                    Spacer()
                    
                }
                
            }
            .navigationBarHidden(true)
            .onAppear{
                viewModel.getTotalWeekElapsed()
            }
        }
    }
}


//    }


struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}
