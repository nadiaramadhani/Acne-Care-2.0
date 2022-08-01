//
//  CustomPopUp.swift
//  ACNIFY
//
//  Created by Local Administrator on 26/06/22.
//

import SwiftUI

struct CustomPopUp: View {
    var body: some View {
        ZStack {
           
            VStack(spacing: .zero) {
                HStack{
                    Spacer()
                    
                    xbutton
                        .padding()
                }
                fact
                icon
                title
                content
                description
            }
            .padding()
            .multilineTextAlignment(.center)
            .background(background)
            
            
            
        }
        
    }
}

struct CustomPopUp_Previews: PreviewProvider {
    static var previews: some View {
        CustomPopUp()
    }
}

private extension CustomPopUp {
    var xbutton: some View {
        Image(systemName: "xmark")
            .onTapGesture {
                print("tapped")
//                perform action: MainPageView()
                
            }
        
    }
    
    var fact : some View {
        Text("FUNFACT!")
            .foregroundColor(Color("primaryGreen"))
            .font(.title)
            .fontWeight(.bold)
            .padding()
        
    }
    
    var icon: some View {
        Image("overwash")
        
    }
    var title: some View {
        Text("Dont Overwash")
            .font(.system(size: 20))
            .fontWeight(.bold)
            .foregroundColor(Color("brown"))
            .padding()
        
    }
    var content: some View {
        Text("This refers to damaging your skin barrier, the network of skin cells and fats in the outer skin layer that protects your skin from the environment")
            .padding(.bottom, 20)
            .frame(width: 320, alignment: .center)
    }
    var description: some View {
        Text("Here’s a fact because you finish the skincare time, enjoy!")
            .font(.system(size: 12))
            .padding(.bottom, 20)
        
    }
    var buttonFinish: some View{
        Button(action: {
        
        //   TestHomeView()
            
        }) {
            Text("Finish")
               
        }
        .frame(width: 150, height: 50)
        .background(Color("primaryGreen"))
        .foregroundColor(.white)
        .cornerRadius(10)
        .padding(.top, 100)
        
    }
    
    
}

private extension CustomPopUp {
    var background: some View {
        RoundedRectangle(cornerRadius: 10, style: .circular)
            .foregroundColor(Color("beige"))
            .shadow(color: Color("brown").opacity(0.5), radius: 3)
            .frame(width: 350, height: 500, alignment: .center)
    }
}
