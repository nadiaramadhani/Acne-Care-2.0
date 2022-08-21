//
//  QuizItemView.swift
//  ACNIFY
//
//  Created by Local Administrator on 20/08/22.
//

import SwiftUI

struct SkinQuizItemView: View {
    var data: NewQuizViewModel.QuizQuestion?
    @Binding var selectedAnswer: String
    @State var selectedIndex = 0
    
    
    var body: some View {
        VStack{
            Image(data?.image ?? "PoreQuiz")
                .padding()
            Text(data?.question ?? "How do your pores look?")
                .font(.system(size: 20))
                .fontWeight(.semibold)
                .foregroundColor(Color("quizFont"))
                .padding()
            HStack{
                if let answers = data?.answerList {
                    ForEach(0..<answers.count, id: \.self){ index in
                        let answer = answers[index]
                        VStack{
                            Image(answer.image)
                                .overlay(RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.orange, lineWidth: 4)
                                    .opacity(index == selectedIndex ? 1 : 0))
                            
                            Text(answer.answer)
                                .font(.system(size: 15))
                                .fontWeight(.semibold)
                                .frame(width: 135, height: 40)
                                .multilineTextAlignment(.leading)
                            
                        }
                        .padding(.horizontal)
                        .onTapGesture {
                            selectedIndex = index
                            selectedAnswer = answers[index].answer
                        }
                    }
                }
            }
        }
        .padding(.bottom, 100)
        
    }
}



struct QuizItemView_Previews: PreviewProvider {
    
    static var previews: some View {
        SkinQuizItemView(selectedAnswer: .constant(""))
    }
}
