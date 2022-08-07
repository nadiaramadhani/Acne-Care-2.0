//
//  QuizCardView.swift
//  ACNIFY
//
//  Created by Agus Budianto on 07/08/22.
//

import SwiftUI

struct QuizCardView: View {
    var width : CGFloat
    var AcneData: Type
    var body: some View {
        VStack{
            
            VStack{
                
                Text(self.AcneData.title)
                    .foregroundColor(Color("primaryGreen"))
                    .font(.system(size: 16))
                    .fontWeight(.bold)
                    .padding(.bottom,20)
        
                Image(self.AcneData.image)
                    .resizable()
                    .frame(width: self.width - (220), height: 165)
                    
                
                Text(self.AcneData.desc)
                    .font(.system(size: 16))
                    .padding(.vertical)
                    .frame(width: 270, height: 120, alignment: .leading)
        
            }
            .padding(.horizontal, 15)
            .padding(.vertical, 25)
            .overlay(RoundedRectangle (cornerRadius: 25)
            .stroke(Color("cream"), lineWidth: 4)
            )
            .background(Color("gray"))
            .cornerRadius(25)
          
            Spacer(minLength: 0)
        }
    //    .frame(width: 300, height: 350)
        .frame(width: self.width, height: 500)
    }
}



struct QuizCardView_Previews: PreviewProvider {
    static var previews: some View {
        QuizCardView(width: 400, AcneData: Type(id: 5, image: "Cysts", title: "Cysts", desc: "Easily inflammed through specific trigger (redness, itching, burning, dryness)"))
    }
}
