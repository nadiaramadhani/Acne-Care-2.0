//
//  Rahmat6.swift
//  ACNIFY
//
//  Created by Rahmat Maftuh Ihsan on 29/06/22.
//
//
//  Rahmat6.swift
//  ACNIFY
//
//  Created by Rahmat Maftuh Ihsan on 29/06/22.
//

//Ini product pop up malam
import Foundation
import SwiftUI

struct ProductPopUpNight: View {
    
    @State var isUnderstandNight = false
    @StateObject var lnManagerNight = LocalNotificationManagerNight()
    var body: some View {
        if isUnderstandNight{
             NightChooseProduct()
                .environmentObject(lnManagerNight)
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

struct ProductPopUpNight_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
//            Color.black
//                .edgesIgnoringSafeArea(.all)
//                .opacity(0.3)
           // morningChooseProduct()
            //ProductPopUpMorning()
            
        }
       
            
    }
}

private extension ProductPopUpNight {

    
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
            self.isUnderstandNight = true
        }, label:{
            Text("Understand")
                .font(.system(size:14))
                .fontWeight(.semibold)
                .foregroundColor(.blue)
                .foregroundColor(Color("primaryGreen"))
        })
        
    }
    
    
}

private extension ProductPopUpNight {
    var background: some View {
        RoundedRectangle(cornerRadius: 10, style: .circular)
            .foregroundColor(Color("beige"))
            .shadow(color: Color("brown").opacity(0.5), radius: 3)
            .frame(width: 306, height: 351, alignment: .center)
            .shadow(color: .yellow, radius: 5)
        
    }
}

