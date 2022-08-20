//
//  SecondQuizView.swift
//  ACNIFY
//
//  Created by Local Administrator on 19/08/22.
//

import SwiftUI

struct SecondQuizView: View {
    @State var progressValue: Float = 0.4

        var body: some View {
            ZStack{
                ZStack{
                    Color("tosca")
                        .ignoresSafeArea()
                    
                    VStack{
                    
                        ProgressBar(value: $progressValue)
                            .padding(.top, 30)
                            .padding(.horizontal)
                        Text("Question 2 of 5")
                            .padding(.bottom, 750)
                        
                    }
                }
                ZStack{
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(.white)
                        .frame(width: 390, height: 732)
                        .padding(.top, 100)
                    VStack{
                        Image("poresQuiz")
                            .padding()
                        Text("Does your face looks shiny?")
                            .padding()
                        HStack{
                            VStack{
                                Image("shiny")
                                Text("Yes")
                            }
                            .padding(.horizontal)
                            VStack{
                                Image("notShiny")
                                Text("Small")
                            }.padding(.horizontal)
                        }
                        
    //                    Button {
    //                        addProgress()
    //                    } label: {
    //                        Text("Next")
    //                            .fontWeight(.semibold)
    //                    }
    //                    .foregroundColor(Color.white)
    //                    .frame(width: 153, height: 50)
    //                    .background(Color("yellow"))
    //                    .cornerRadius(12)
                        
                        NavigationLink {
                        
                        } label: {
                            Text("Next")
                                .fontWeight(.semibold)
                        }
                        .foregroundColor(Color.white)
                        .frame(width: 153, height: 50)
                        .background(Color("tosca"))
                        .cornerRadius(12)

                        
                    }
                }
                
                
            }.navigationBarHidden(true)
            
        }
       
}

struct SecondQuizView_Previews: PreviewProvider {
    static var previews: some View {
        SecondQuizView()
    }
}
