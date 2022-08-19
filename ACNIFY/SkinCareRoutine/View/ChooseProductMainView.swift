//
//  ChooseProductMainView.swift
//  ACNIFY
//
//  Created by Rahmat Maftuh Ihsan on 19/08/22.
//

import SwiftUI

struct ChooseProductMainView: View {
   var displayedScreen: ChooseProductMainView.ShowPage

    var body: some View {
        if displayedScreen == .Morning {
            morningChooseProduct()
        }else{
            NightChooseProduct()
        }
    }
}

extension ChooseProductMainView{
    enum ShowPage{
        case Morning
        case Night
    }
}

struct ChooseProductMainView_Previews: PreviewProvider {
    static var previews: some View {
        ChooseProductMainView(displayedScreen: .Morning)
    }
}
