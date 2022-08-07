//
//  QuizMainView.swift
//  ACNIFY
//
//  Created by Agus Budianto on 07/08/22.
//

import SwiftUI

struct QuizMainView: View {
    @ObservedObject var viewModel = QuizViewModel()
    var body: some View {
        switch viewModel.pageDisplayed {
        case .Acne :
            AcneTypeView(viewModel: viewModel)
        case .Skin:
            SkinTypeView(viewModel: viewModel)
        }
    }
}


extension QuizMainView{
    enum QuizType{
        case Acne
        case Skin
    }
}

struct QuizMainView_Previews: PreviewProvider {
    static var previews: some View {
        QuizMainView()
    }
}
