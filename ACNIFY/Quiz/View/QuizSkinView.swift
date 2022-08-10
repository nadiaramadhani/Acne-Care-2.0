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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SkinTypeView(viewModel: QuizViewModel())

    }
}






//MARK: SKIN TYPE VIEW
struct SkinTypeView: View {
    @ObservedObject var viewModel: QuizViewModel
    
    init(viewModel: QuizViewModel) {
           UIPageControl.appearance().currentPageIndicatorTintColor = UIColor(Color("primaryGreen"))
           UIPageControl.appearance().pageIndicatorTintColor = UIColor(Color("primaryGreen")).withAlphaComponent(0.2)
        self.viewModel = viewModel
    }
    
    
    var body: some View {
        VStack{
            
            VStack{
                Text("Skin Quiz")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color("primaryGreen"))
                    .padding(.top, 20)
                
                Text("Question \(viewModel.selectedIndex + 1) of \(QuizViewModel.getSkinData().count)")
                    .font(.system(size: 12))
                
                
                Text("Pick one that represents your current skin condition")
                    .multilineTextAlignment(.center)
                    .font(.system(size: 18))
                    .padding(.vertical)
                
            }
            
            
            GeometryReader { g in
                QuizTabView(selectedIdx: $viewModel.selectedIndex, data: QuizViewModel.getSkinData())
            }
            
           
            Button {
                viewModel.pageDisplayed = .Acne
                viewModel.selectedSkinType = QuizViewModel.getSkinData()[viewModel.selectedIndex]
                viewModel.selectedIndex = 0
            } label: {
                Text("Choose").foregroundColor(Color.white)
                    .frame(width: 150, height: 50, alignment: .center)
            }.background(Color("primaryGreen"))
                .cornerRadius(10)
            
        }
    }
        
    }




