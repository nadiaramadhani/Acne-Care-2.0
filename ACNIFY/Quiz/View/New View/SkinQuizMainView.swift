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
            QuizResultView(viewModel: viewModel, displayedPage: $displayedPage)
        case .FirstTakePhoto:
            FirstQuizFoto(viewModel: TreatmentPhotoViewModel(acneLog: viewModel.firstAcneLog), quizViewModel:  viewModel)
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
        case FirstTakePhoto
    }
}

struct SkinQuizMainView_Previews: PreviewProvider {
    static var previews: some View {
        SkinQuizMainView()
    }
}
