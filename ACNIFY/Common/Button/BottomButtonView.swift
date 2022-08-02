//
//  BottomButtonView.swift
//  ACNIFY
//
//  Created by Agus Budianto on 02/08/22.
//

import SwiftUI

struct BottomButtonView: View {
    var buttonText: String
    var body: some View {
        Text(buttonText)
        .font(.headline)
        .foregroundColor(.white)
        .frame(width: 350, height:50 )
        //            .frame(maxWidth: .infinity)
        .background(Color("primaryGreen"))
        .cornerRadius(10)
        .padding()
    }
}

struct BottomButtonView_Previews: PreviewProvider {
    static var previews: some View {
        BottomButtonView(buttonText: "Test")
    }
}
