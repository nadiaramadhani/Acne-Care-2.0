//
//  CustomAlertMorningProduct.swift
//  ACNIFY
//
//  Created by Rahmat Maftuh Ihsan on 18/08/22.
//

import SwiftUI

struct CustomAlertMorningProduct: View {
    
//    @Binding var showAlert: Bool
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 10, style: .circular)
                .foregroundColor(Color("white"))
                .frame(width: 306, height: 384, alignment: .center)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color("cream"),lineWidth: 3))
            
            VStack{
                Image("CarefulSign")
                
                Text("Suncreen dapat menyumbat pori2")
                
                Text("Kamu yakin untuk membuka sunscreen?")
                
                Button(action: {},
                       label: {
                    Text ("Yakin?") })
//
            }
        }
        
        
        
    }
}

struct CustomAlertMorningProduct_Previews: PreviewProvider {
    static var previews: some View {
        CustomAlertMorningProduct()
    }
}
