//
//  QuizCardView.swift
//  ACNIFY
//
//  Created by Agus Budianto on 07/08/22.
//

import SwiftUI

struct QuizCardView: View {
    var width : CGFloat
    var height : CGFloat
    
    var AcneData: QuizViewModel.QuizQuestion
    var body: some View {
            
            VStack{
                
                Text(self.AcneData.title)
                    .foregroundColor(Color("primaryGreen"))
                    .font(.system(size: 16))
                    .fontWeight(.bold)
                    .padding(.bottom,20)
        
                Spacer()
                Image(self.AcneData.image)
                    .resizable()
                    .frame(width: self.width - (140), height: self.width - (140))
                    
                Spacer()
                
                Text(self.AcneData.desc)
                    .font(.system(size: 16))
                    .padding(.vertical)
                    .frame(width: 270, height: 120, alignment: .leading)
        
            }
            .frame(width: self.width, height: self.height)
            .padding(.horizontal, 15)
            .padding(.vertical, 25)
            .overlay(RoundedRectangle (cornerRadius: 25)
            .stroke(Color("cream"), lineWidth: 4)
            )
            .background(Color("gray"))
            .cornerRadius(25)
          
        Spacer()
        }
}



struct QuizCardView_Previews: PreviewProvider {
    static var previews: some View {
        QuizCardView(width: 300, height: 300, AcneData: QuizViewModel.QuizQuestion(id: 5, image: "Cysts", title: "Cysts", desc: "Easily inflammed through specific trigger (redness, itching, burning, dryness)"))
    }
}
