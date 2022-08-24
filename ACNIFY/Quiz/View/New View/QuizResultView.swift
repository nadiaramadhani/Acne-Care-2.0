//
//  QuizResultView.swift
//  ACNIFY
//
//  Created by Local Administrator on 22/08/22.
//

import SwiftUI

struct QuizResultView: View {
    @ObservedObject var viewModel: NewQuizViewModel
    @Binding var displayedPage: SkinQuizMainView.DisplayedPage
    @State var isHomePage: Bool = false
    @State var selectedIndex = 0
    
    var body: some View {
        ZStack{
            
            Image("womanOily")
                .padding(.bottom, 300)
                .ignoresSafeArea(.all)
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.white)
                    .frame(width: 390, height: 479)
                    .shadow(color: .gray, radius: 2)
                
                //
                VStack{
                    TabView(selection: $selectedIndex){
                        SkinResulView(data: NewQuizViewModel.getSkinTypeDesc(type: viewModel.getSkinType()))
                            .tag(0)
                        
                        AcneResultView(data: NewQuizViewModel.getAcneSevereDesc(type: viewModel.getAcneSeverity()))
                            .tag(1)
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                    .onAppear{
                        setupAppearance()
                    }
                    
                    VStack{
                    
                    Text("*Take your first photo to compare later")
                        .font(.system(size: 13))
                        .italic()
                    Button {
                        viewModel.createAcneLogdata()
                        displayedPage = .FirstTakePhoto
                    } label: {
                        Text("Take Photo")
                            .fontWeight(.semibold)
                    }
                    .foregroundColor(Color.white)
                    .frame(width: 325, height: 50)
                    .background(Color("yellow"))
                    .cornerRadius(12)
                    
                        
                        
                    Button {
                        viewModel.saveSkinPersona()
                        isHomePage = true
                    } label: {
                        Text("Not Now")
                            .fontWeight(.semibold)
                            .foregroundColor(Color.black)
                    }
                       
                    .cornerRadius(12)
                    .frame(width: 325, height: 50)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color("yellow"), lineWidth: 2)
                    )
                    .padding(.bottom)
                    }.opacity(selectedIndex == 1 ? 1:0)
                }
            }
            .padding(.top, 350)
        }
    }
    func setupAppearance() {
        UIPageControl.appearance().currentPageIndicatorTintColor = .orange
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
    }
}

struct SkinResulView: View {
    var data : NewQuizViewModel.SkinConditionDescription
    var body: some View {
        VStack{
            Text("Your Skin Type: \(data.name)")
                .font(.title2)
                .foregroundColor(Color("primaryGreen"))
                .bold()
            
            Text("\(data.desc)")
                .multilineTextAlignment(.center)
                .frame(width: 342, height: 176)
                .font(.body)
                .foregroundColor(Color("grayFont"))
            
            Text("\(data.source)")
                .font(.footnote)
                .foregroundColor(Color("primaryGreen"))
                .italic()
                .frame(width: 342, height: 18, alignment: .center)
            
            
        }
    }
}


struct AcneResultView: View {
    var data : NewQuizViewModel.SkinConditionDescription

    var acneSeverity: String = "Mild"
    var acneDesc: String = "Mild acne mostly whiteheads and blackheads, with a few papules and pustules"
    
    var body: some View {
        VStack{
            Text("Acne Severity: \(data.name)")
                .font(.title2)
                .foregroundColor(Color("primaryGreen"))
                .bold()
            
            
            Text("\(data.desc)")
                .multilineTextAlignment(.center)
                .foregroundColor(Color("grayFont"))
                .frame(width: 342, height: 154)
                .font(.body)
            
            Text(data.source)
                .font(.footnote)
                .foregroundColor(Color("primaryGreen"))
                .italic()
                .multilineTextAlignment(.center)
                .frame(width: 342, height: 60, alignment: .center)
                
        }
        
    }
}

struct QuizResultView_Previews: PreviewProvider {
    static var previews: some View {
        QuizResultView(viewModel: NewQuizViewModel(), displayedPage: .constant(.IntroPage))
    }
}
