//
//  SkinTypeView.swift
//  ACNIFY
//
//  Created by Local Administrator on 25/06/22.
//
//
//  ContentView.swift
//  Carousel test
//
//  Created by Local Administrator on 24/06/22.
//

import SwiftUI


struct AcneTypeView_Previews: PreviewProvider {
    static var previews: some View {
        AcneTypeView(viewModel: QuizViewModel())
        
    }
}

struct AcneTypeView: View {
    @AppStorage("first_quiz") var firstTimeQuiz: Bool = true
    @ObservedObject var viewModel: QuizViewModel
    @Environment(\.presentationMode) var presentation
    
    init(viewModel: QuizViewModel) {
           UIPageControl.appearance().currentPageIndicatorTintColor = UIColor(Color("primaryGreen"))
           UIPageControl.appearance().pageIndicatorTintColor = UIColor(Color("primaryGreen")).withAlphaComponent(0.2)
        
            self.viewModel = viewModel
    }
    


    var body: some View {
            VStack{
              
                    VStack{
                        
                        Text("Acne Quiz")
                             .font(.title)
                             .fontWeight(.bold)
                             .foregroundColor(Color("primaryGreen"))
                             .padding(.top, 20)
                         
                         Text("Question 2 of 2")
                             .font(.system(size: 12))
//                             .padding(.top, 10)
                           
                         
                         Text("Pick one that represents your current acne condition")
                            .multilineTextAlignment(.center)
                             .font(.system(size: 18))
                             .padding(.vertical)
                        
                    }
                
                
                GeometryReader { _ in
                    QuizTabView(selectedIdx: $viewModel.selectedIndex, data: viewModel.getAcneData())
                }
                
                
                Button {

                    if firstTimeQuiz{
                        UserDefaults.standard.set(false, forKey: "first_quiz")

                    }else{
                        self.presentation.wrappedValue.dismiss()
                    }
                    
                } label: {
                    Text("Choose").foregroundColor(Color.white)
                        .frame(width: 150, height: 50, alignment: .center)
                }.background(Color("primaryGreen"))
                    .cornerRadius(10)

                    
                Spacer()

            }
    }
}

struct QuizTabView: View {
    @Binding var selectedIdx: Int
    var data : [QuizViewModel.QuizQuestion]
    
    var body: some View {
        TabView(selection: $selectedIdx){
            ForEach(0..<data.count){ i in
                VStack{
                    QuizCardView(width: UIScreen.main.bounds.width - 100, height: (UIScreen.main.bounds.height / 2), AcneData: data[i])
                    Spacer()
                }.tag(i)
            }
            
        } .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
    }
}




struct AcneType : Identifiable {
    var id: Int
    var image : String
    var title: String
    var desc: String
    
}



