//
//  SkinResultView.swift
//  ACNIFY
//
//  Created by Local Administrator on 25/06/22.
//

import SwiftUI

//
//enum Segmented {
//
//    case 0:
//    return SkinView()
//    case 1:
//    return AcneView()
//}
struct SkinResultView: View {
    @State private var selected = 1
    @Environment(\.presentationMode) var presentation
    
    @ObservedObject var viewModel = QuizResultViewModel()

    var body: some View {
            NavigationView{
                VStack {
                    
                    Picker("Skin", selection: $selected){
                        Text("Skin")
                            .tag(1)
                        Text("Acne")
                            .tag(2)
                    }
                    .pickerStyle(.segmented)
                    .padding()
                    
                    
                    
                    if selected == 1 {
                        if let skinType = viewModel.skinType {
                            SkinCardView(skinType: skinType)
                        }
                    } else if selected == 2 {
                        if let acneType = viewModel.acneType {
                            AcneCardView(acneType: acneType)
                        }
                    }
                    
                    NavigationLink(destination: QuizMainView().navigationBarHidden(true)){
                        
                        Text("Test again")
                            .frame(width: 150, height: 40, alignment: .center)
                            .foregroundColor(Color.white)
                            .background(Color("primaryGreen"))
                            .cornerRadius(10)
                            .padding()
                        
                    }
                    
                    
                } .navigationBarTitle("Results")
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarItems(trailing:
                                            Button(action: {
                        self.presentation.wrappedValue.dismiss()
                    }) {
                        Text("Done")
                        //.fontWeight(.bold)
                            .foregroundColor(Color("primaryGreen"))
                    }
                    )
            }
        }
        
    }





struct SkinResultView_Previews: PreviewProvider {
    static var previews: some View {
        SkinResultView()
    }
}
