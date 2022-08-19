//
//  SwiftUIView.swift
//  ACNIFY
//
//  Created by Local Administrator on 19/08/22.
//

import SwiftUI

struct SkinQuizView: View {
    var body: some View {
        ZStack{
            ZStack{
            Color("tosca")
                .ignoresSafeArea()
            
                VStack{
                    Text("Question of 5")
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
                        Text("What do your pores looks like?")
                    
                    HStack{
                        VStack{
                            
                        }
                    }
                    
                    Button {

                    } label: {
                        Text("Next")
                            .fontWeight(.semibold)
                    }
                    .foregroundColor(Color.white)
                    .frame(width: 153, height: 50)
                    .background(Color("yellow"))
                    .cornerRadius(12)

                    
                }
            }
           
            
        }
        
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SkinQuizView()
    }
}
