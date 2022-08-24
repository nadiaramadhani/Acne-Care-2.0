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
                .frame(width: 350, height: 48)
                .multilineTextAlignment(.leading)
                .padding(.trailing,30)
            
            Text("""
Worry no more! We will be with you to accompany your acne healing process.

Everything needs action, perseverance, and consistency to bear the prize, my friend.

Acne healing will take two to six months.
""")
            .frame(width: 320, height: 240)
            .font(.body)
            .foregroundColor(Color("grayFont"))
            .multilineTextAlignment(.leading)
            
            
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
            .padding(.top)

            Spacer()
            
        }
        
    }
}

struct IntroQuizView_Previews: PreviewProvider {
    static var previews: some View {
        IntroQuizView(displayedPage: .constant(.IntroPage))
    }
}
