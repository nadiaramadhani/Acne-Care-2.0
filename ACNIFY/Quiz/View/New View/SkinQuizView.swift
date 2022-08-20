//
//  SwiftUIView.swift
//  ACNIFY
//
//  Created by Local Administrator on 19/08/22.
//

import SwiftUI


struct skinQuizModel {
    var id = UUID()
    var number: Int
    var ilustration: String
    var question: String
    var imageOne: String
    var imageTwo: String
}

struct SkinQuizView: View {
    @State var progressValue: Float = 0.11
    @State var questionState: Int = 1
    var body: some View {
        NavigationView{
            ZStack{
                ZStack{
                    Color("tosca")
                        .ignoresSafeArea()
                    
                    VStack(alignment: .leading){
                        
                        Text("Question \(questionState) of 9")
                            .font(.system(size: 15))
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .padding(.top, 40)
                            .padding(.horizontal)
                        ProgressBar(value: $progressValue)
                            .padding(.bottom, 750)
                            .padding(.horizontal)
                        
                    }
                }
                ZStack{
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(.white)
                        .frame(width: 390, height: 732)
                        .padding(.top, 100)
                    VStack{
                        switch questionState {
                        case 1:
                            questionOne
                        case 2 :
                            questionTwo
                        case 3:
                            questionThree
                        case 4:
                            questionFour
                        case 5:
                            questionFive
                        case 6:
                            questionSix
                        case 7:
                            questionSeven
                        case 8:
                            questionEight
                        case 9:
                            questionNine

                        default:
                            questionFive
                        
                        }
                            
                        
                        if questionState == 9 {
                            NavigationLink {
                                HomePageView()
                            } label: {
                                Text("Next")
                                    .fontWeight(.semibold)
                            }
                            .foregroundColor(Color.white)
                            .frame(width: 153, height: 50)
                            .background(Color("yellow"))
                            .cornerRadius(12)
                            .padding(.bottom, 60)
                            .padding(.top)
                        } else {
                        Button {
                            addProgress()
                            handleNexButton()
                           
                        } label: {
                            Text("Next")
                                .fontWeight(.semibold)
                        }
                        .foregroundColor(Color.white)
                        .frame(width: 153, height: 50)
                        .background(Color("yellow"))
                        .cornerRadius(12)
                        .padding(.bottom, 60)
                        .padding(.top)
                        }
                        
                        
                    }.frame(height: 732)
                        .padding(.top, 112)
                }
                
                
            }
            
            .navigationBarHidden(true)
        }
    }
    func addProgress() {
        self.progressValue += 0.11
    }
    
    
    func handleNexButton() {
        questionState += 1
    }
    private var questionOne: some View {
        SkinQuizItemView(data: SkinQuizItemView.getQuestionList().first!)
    }
    
    private var questionTwo: some View {
        SkinQuizItemView(data: SkinQuizItemView.getQuestionList()[1])
    }
    private var questionThree: some View {
        SkinQuizItemView(data: SkinQuizItemView.getQuestionList()[2])
    }
    private var questionFour: some View {
        SkinQuizItemView(data: SkinQuizItemView.getQuestionList()[3])
    }
    
    private var questionFive: some View {
        AcneQuizItemView(acneData: AcneQuizItemView.getAcneLocation()[0])
    }
    private var questionSix: some View {
        AcneQuizItemView(acneData: AcneQuizItemView.getAcneLocation()[1])
    }
    private var questionSeven: some View {
        AcneQuizItemView(acneData: AcneQuizItemView.getAcneLocation()[2])
    }
    private var questionEight: some View {
        AcneQuizItemView(acneData: AcneQuizItemView.getAcneLocation()[3])
    }
    private var questionNine: some View {
        AcneQuizItemView(acneData: AcneQuizItemView.getAcneLocation()[4])
    }

}


extension SkinQuizView {
   
}

struct ProgressBar: View {
    @Binding var value: Float
    
    var body: some View{
        GeometryReader{ geometry in
            ZStack(alignment: .leading){
                Rectangle().frame(width: geometry.size.width , height: geometry.size.height / 2)
                    .opacity(0.5)
                    .foregroundColor(Color(UIColor.systemGray))
                
                Rectangle().frame(width: min(CGFloat(self.value + 0.01)*geometry.size.width, geometry.size.width), height: geometry.size.height / 2)
                    .foregroundColor(Color(UIColor.white))
                    .animation(.linear)
                    .cornerRadius(45)
            }.cornerRadius(45)
            
        }
    }
    
}
struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SkinQuizView()
    }
}
