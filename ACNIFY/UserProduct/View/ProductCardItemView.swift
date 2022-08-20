//
//  ProductCardItemView.swift
//  ACNIFY
//
//  Created by Agus Budianto on 20/08/22.
//

import SwiftUI

struct ProductCardItemView: View {
    @Binding var isChecked: Bool
    var productDetail: UserProductDetail
    var product: UserProduct
    
    var body: some View {
        ZStack{
            Rectangle()
                .fill(Color.white)
                .frame(width: 355, height: 115)
                .cornerRadius(12)
                .padding(5)
                .shadow(radius: 5)
            
            HStack{
                Image(productDetail.getImageName(routineType: product.routineType ?? ""))
                    .frame(width:40, height: 90)
                    .padding()
                
                VStack(alignment: .leading){
                    Text(productDetail.title)
                        .font(.system(size:16))
                        .fontWeight(.semibold)
                        .foregroundColor(Color("primaryGreen"))
                    
                    
                    Text(productDetail.description)
                    
                        .font(.system(size:14))
                        .fontWeight(.light)
                        .multilineTextAlignment(.leading)
                        .frame(width: 215,alignment: .leading)
                    
                    
                    Spacer()
                        .frame(height:20)
                    
                    
                    if !product.isLocked() {
                        Button("Add your product") {
                            
                        }
                        .font(.system(size:12))
                        .foregroundColor(Color("primaryGreen"))
                    }else{
                        Text("\(product.dayCountToUnlocked() ?? 0) days To unlock").font(.system(size:12))
                            .foregroundColor(Color("primaryGreen"))
                    }
                   
                }
                if !product.isLocked() {
                Toggle("",isOn: $isChecked)
                    .labelsHidden()
                    .toggleStyle(ToogleCheckBoxStyle())
                    .font(.largeTitle)
                    
                }
                
            }
        }
        .opacity(product.isLocked() ? 0.6 : 1)
    }
}


struct ToogleCheckBoxStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View{
        Button {
            configuration.isOn.toggle()
        } label: {
            Image(systemName: configuration.isOn ? "checkmark.square": "square")
        }
        .tint(Color("primaryGreen"))
        
    }
}
