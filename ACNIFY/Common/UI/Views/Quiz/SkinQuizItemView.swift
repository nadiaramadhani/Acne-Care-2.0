//
//  QuizItemView.swift
//  ACNIFY
//
//  Created by Local Administrator on 20/08/22.
//

import SwiftUI

struct SkinQuizItemView: View {
    var data: SkinQuizItemView.QuizQuestion?
    
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
                
                ForEach(data?.answerList ?? []) { answer in
                    VStack{
                        Image(answer.image)
                        Text(answer.answer)
                            .font(.system(size: 15))
                            .fontWeight(.semibold)
                            .frame(width: 135, height: 40)
                            .multilineTextAlignment(.leading)
                        
                    }
                    .padding(.horizontal)
                }
            }
        }
        .padding(.bottom, 100)
    
    }
}

extension SkinQuizItemView{
    struct QuizQuestion : Identifiable {
        var id = UUID.init()
        var location: String? = ""
        var image: String? = ""
        var question: String = ""
        var answerList : [QuizQuestionAnswer] = [QuizQuestionAnswer]()
    }
    
    struct QuizQuestionAnswer : Identifiable {
        var id = UUID.init()
        var image: String = ""
        var answer: String = ""
    }
    
    static func getQuestionList() -> [SkinQuizItemView.QuizQuestion] {
        var q1 = QuizQuestion(image: "PoreQuiz", question: "How do your pores look?")
        let q1a1 = QuizQuestionAnswer(image:"largePores", answer: "Large")
        let q1a2 = QuizQuestionAnswer(image:"smallPores", answer: "Small")
        
        var q2 = QuizQuestion( image: "DryQuiz", question: "Does your skin feel tight?")
        let q2a1 = QuizQuestionAnswer(image: "tight", answer: "Yes")
        let q2a2 = QuizQuestionAnswer(image: "notTight", answer: "No")
        
        var q3 = QuizQuestion( image: "OilyQuiz", question: "Does your face look shiny?")
        let q3a1 = QuizQuestionAnswer(image: "shiny", answer: "Yes")
        let q3a2 = QuizQuestionAnswer(image: "notShiny", answer: "No")
        
        var q4 = QuizQuestion(image: "CombiQuiz", question: "Does your face feel oily on certain area?")
        let q4a1 = QuizQuestionAnswer(image: "combi", answer: "Yes")
        let q4a2 = QuizQuestionAnswer(image: "notCombi", answer: "No, it's all over my face")
        
        q1.answerList.append(q1a1)
        q1.answerList.append(q1a2)
        q2.answerList.append(q2a1)
        q2.answerList.append(q2a2)
        q3.answerList.append(q3a1)
        q3.answerList.append(q3a2)
        q4.answerList.append(q4a1)
        q4.answerList.append(q4a2)

        
        return [
            q1, q2, q3, q4
        ]
        
        
    }
}

struct QuizItemView_Previews: PreviewProvider {
    
    static var previews: some View {
        SkinQuizItemView()
    }
}
