//
//  SkinQuizMainView.swift
//  ACNIFY
//
//  Created by Agus Budianto on 21/08/22.
//

import SwiftUI

struct SkinQuizMainView: View {
    @State var displayedPage: SkinQuizMainView.DisplayedPage = .IntroPage
    @ObservedObject var viewModel =  NewQuizViewModel()
    
    var body: some View {
        switch displayedPage{
        case .QuizPage:
            SkinQuizView(viewModel: viewModel, displayedPage: $displayedPage)
        case .ResultPage:
            ResultQuizView(viewModel: viewModel, displayedPage: $displayedPage)
        default:
            IntroQuizView(displayedPage: $displayedPage)
        }
    }
}

extension SkinQuizMainView{
    enum DisplayedPage{
        case IntroPage
        case QuizPage
        case ResultPage
    }
}

struct SkinQuizMainView_Previews: PreviewProvider {
    static var previews: some View {
        SkinQuizMainView()
    }
}
