//
//  Rahmat4.swift
//  ACNIFY
//
//  Created by Rahmat Maftuh Ihsan on 27/06/22.
//


//Ini pop up ketika di awal mau masuk ke milih produk pagi

import SwiftUI

struct ProductPopUpMorning: View {
    
    @State var isUnderstandMorning = false
    @StateObject var lnManagerMorning = LocalNotificationManagerMorning()
    var body: some View {
        if isUnderstandMorning{
            morningChooseProduct()
                .environmentObject(lnManagerMorning)
        }else{
        ZStack{
            Color.black
                .edgesIgnoringSafeArea(.all)
                .opacity(0.3)
            VStack(spacing: .zero){
                
                icon
                content
                content2
                encourage
                buttonUnderstand
                
            }
            
            .padding()
            .multilineTextAlignment(.center)
            .background(background)
        
        }
        }
    }
}

struct ProductPopUp_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
//            Color.black
//                .edgesIgnoringSafeArea(.all)
//                .opacity(0.3)
            morningChooseProduct()
            ProductPopUpMorning()
            
        }
       
            
    }
}

private extension ProductPopUpMorning {

    
    var icon: some View {
        Image("girlsProductPopUp")
            .padding(.bottom, 12)
        
    }

    var content: some View {
        Text("We want to help you cure your acne. Your face is compassionate now, we advise you to use only primary skincare for now which consists of : ")
            .font(.system(size: 12))
            .fontWeight(.light)
           // .padding(.bottom, 20)
            .frame(width: 282, alignment: .center)
    }
    var content2: some View {
        Text("Facial Wash, Moisturizer, Acne Treatment, and Sunscreen. ")
            .font(.system(size: 12))
            .fontWeight(.semibold)
            .foregroundColor(Color("primaryGreen"))
            .padding(.bottom, 20)
            .frame(width: 282, alignment: .center)
    }
    
    var encourage: some View {
        Text("You can add more if all the products that you use work well on your skin. ")
            .font(.system(size: 12))
            .fontWeight(.light)
           .padding(.bottom, 20)
            .frame(width: 282, alignment: .center)
    }
        
    var buttonUnderstand: some View{
//        Text("Understand")
//            .font(.system(size:14))
//            .fontWeight(.semibold)
//            .foregroundColor(.blue)
//            .foregroundColor(Color("primaryGreen"))
//            .onTapGesture{
//              //  morningChooseProduct()
//            }
        Button(action: {
            self.isUnderstandMorning = true
        }, label:{
            Text("Understand")
                .font(.system(size:14))
                .fontWeight(.semibold)
                .foregroundColor(.blue)
                .foregroundColor(Color("primaryGreen"))
        })
        
    }
    
    
}

private extension ProductPopUpMorning {
    var background: some View {
        RoundedRectangle(cornerRadius: 10, style: .circular)
            .foregroundColor(Color("beige"))
            .shadow(color: Color("brown").opacity(0.5), radius: 3)
            .frame(width: 306, height: 351, alignment: .center)
            .shadow(color: .yellow, radius: 5)
        
    }
}

