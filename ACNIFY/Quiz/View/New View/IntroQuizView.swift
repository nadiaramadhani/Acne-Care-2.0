//
//  IntroQuizView.swift
//  ACNIFY
//
//  Created by Local Administrator on 19/08/22.
//

import SwiftUI

struct IntroQuizView: View {
    @Binding var displayedPage: SkinQuizMainView.DisplayedPage
    var body: some View {
        
        VStack{
            Image(systemName: "multiply")
                .resizable()
                .frame(width: 22, height: 22)
                .padding(.leading, 300)
                .onTapGesture {
                    SkinPersonaDefaultRepository.shared.isFirstUserQuiz.toggle()
                }
            
            Spacer()
            Image("introQuiz")
                .padding()
            Text("Let us know more about your skin condition!")
                .font(.system(size: 20))
                .fontWeight(.bold)
            Text("""
Worry no more beautiful! We will be with you to accompany your acne healing process
Only instant ramen noodles have immediate results. Everything needs action, perseverance, and consistency to bear the prize, my friend.
Acne healing will take two to six months.
""")
            .frame(width: 305, height: 208)
            .font(.body)
            .foregroundColor(Color("grayFont"))
            
            .padding()
            
            Button {
                displayedPage = .QuizPage
            } label: {
                Text("Ready")
                    .font(.system(size: 13))
                    .fontWeight(.semibold)
            }
            .foregroundColor(Color.white)
            .frame(width: 153, height: 50)
            .background(Color("yellow"))
            .cornerRadius(12)

            Spacer()
            
        }
        
    }
}

struct IntroQuizView_Previews: PreviewProvider {
    static var previews: some View {
        IntroQuizView(displayedPage: .constant(.IntroPage))
    }
}
