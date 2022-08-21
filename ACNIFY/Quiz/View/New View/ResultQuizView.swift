//
//  ResultQuizView().swift
//  ACNIFY
//
//  Created by Agus Budianto on 21/08/22.
//

import SwiftUI

struct ResultQuizView: View {
    @ObservedObject var viewModel: NewQuizViewModel
    @Binding var displayedPage: SkinQuizMainView.DisplayedPage
    
    var body: some View {
        Text(viewModel.getSkinType())
        Text(viewModel.getAcneSeverity())
        
        Button{ viewModel.saveSkinPersona()} label: {
            Text("save")
        }
    }
}

struct ResultQuizView___Previews: PreviewProvider {
    static var previews: some View {
        ResultQuizView(viewModel: NewQuizViewModel(), displayedPage: .constant(.IntroPage))
    }
}
