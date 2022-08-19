//
//  IntroProductMorning.swift
//  ACNIFY
//
//  Created by Rahmat Maftuh Ihsan on 19/08/22.
//

import SwiftUI

struct IntroProductView: View {
    
    @State private var isCancel = false
    @State private var isReadyMorning = false
    @Binding var isIntroPresented: Bool
    var displayedChooseProduct: ChooseProductMainView.ShowPage
    
    var body: some View {
        if !isIntroPresented{
            ChooseProductMainView(displayedScreen: displayedChooseProduct)
        }else{
            //        if isCancel{
            //            HomePageView()
            //        }else if isReadyMorning{
            //            morningChooseProduct()
            //        }else{
            VStack{
                Button(
                    action: {
                        self.isCancel = true
                    }, label: {
                        Image(systemName: "xmark")
                            .font(.system(size:24).weight(.bold))
                            .foregroundColor(Color ("primaryGreen"))
                            .padding(.leading,306)
                        //                            .frame(width: 306)
                        
                    }
                )
                
                Spacer()
                ZStack{
                    Image("OvalBridge")
                    
                    Image("ManBridge")
                    
                }
                
                Text("Select your routine’s product")
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                    .padding(.trailing,29)
                
                
                
                Text("We want to help you cure your acne. Pilih produk yang masuk dalam routine mu saat ini, kami anjurkan untuk menggunakan satu produk terlebih dahulu untuk mengetahui apakah produk yang kamu gunakan cocok dan tidak memperparah jerawat kamu")
                    .padding(.trailing)
                    .frame(width: 306, height: 200)
                
                Spacer()
                Button(action: {
                    self.isIntroPresented = false
                },
                       label: {
                    Text("Ready")
                        .font(.system(size:13))
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 153, height: 50)
                        .background(
                            Color("kuningTerang")
                                .cornerRadius(10)
                                .shadow(radius: 5))
                    
                    
                })
                Spacer()
                
            }
    }
}
}
//}

struct IntroProductMorning_Previews: PreviewProvider {
    static var previews: some View {
        IntroProductView(isIntroPresented: .constant(false), displayedChooseProduct: .Morning)
    }
}
