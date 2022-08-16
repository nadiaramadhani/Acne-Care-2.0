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
    var body: some View {
        
        ZStack {
//            Circle()
//                .frame(width: 885, height: 885)
//                .foregroundColor(Color("secondaryYellow3rd"))
//                .position(x: 247, y: 709)
//
//
            VStack{
            Image("Oval2")
                    .ignoresSafeArea()

            Spacer()
        
            }
            VStack{
                HStack{
                    Text("Welcome Afita!")
                        .font(.title3)
                        .fontWeight(.bold)
                        .italic()
                        .padding(.leading)
                        .foregroundColor(Color("primaryGreen"))
                    Spacer()
                    
                }
                HStack{
                    
                    Text("It's been 3 weeks keep going!")
                        .padding(.leading)
                    Spacer()
                        
                }
                .padding(.bottom)
                
                VStack {
                    
                    Text("Today's Routine")
                        .font(.system(size: 17))
                        .fontWeight(.bold)
                        .padding(.trailing, 200)
                    Text("Monday, 15 August")
                        .padding(.trailing, 185)
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
                            Button {
                                
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
                                Text("Facewash")
                                    .font(.system(size: 17))
                                    .padding(.leading, 35)

                                Text("Moisturizer")
                                    .font(.system(size: 17))
                                    .padding(.leading, 35)

                                Text("Acne Treatment")
                                    .font(.system(size: 17))
                                    .padding(.leading, 30)
                                
                                
                            }
                            .foregroundColor(Color.white)
                            Button {
                                
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
                            
                        }
                    }
                    
                }
                Spacer()
                
            }
        }
    
            
        
    }
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}
