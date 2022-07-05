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
    @FetchRequest(sortDescriptors: []) var skins: FetchedResults<SkinEntity>
    @State private var mainPageView : Bool = false
    @State private var testAgain : Bool = false
    @State private var selected = 1
    @State private var data = 0
    var body: some View {
        if mainPageView {
            MainPageView()
        } else if testAgain {
            SkinType()
        } else {
        
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
                        if data == 0 {
                            OilySkinView()
                            
                        } else if
                                data == 1 {
                            NormalSkinView()
                            }
                        
                    } else if selected == 2 {
                        PapulesView()
                    }
                
                Button(action: {
                    testAgain.self = true
                }, label: {
                    Text("Test again")
                        .frame(width: 150, height: 40, alignment: .center)
                        .foregroundColor(Color.white)
                        .background(Color("primaryGreen"))
                        .cornerRadius(10)
                        .padding()
                })
               
            } .navigationBarTitle("Results")
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarItems(trailing:
                                            Button(action: {
                        mainPageView = true
                        
                    }) {
                        Text("Done")
                        //.fontWeight(.bold)
                            .foregroundColor(Color("primaryGreen"))
                    }
                    )
        }
        }
        
    }
}




struct SkinResultView_Previews: PreviewProvider {
    static var previews: some View {
        SkinResultView()
    }
}
