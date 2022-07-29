//
//  Rahmat8.swift
//  ACNIFY
//
//  Created by Rahmat Maftuh Ihsan on 29/06/22.
//
import SwiftUI

struct HistorySheetView: View {
    var body: some View {
        VStack {
            HStack{
                Spacer()
                Button(action: {
                    
                }, label: {
                    Text("Done")
                        .foregroundColor(Color("primaryGreen"))
                })
                .padding()
                
            }
            
            Image("Image")
                .resizable()
                .frame(width: 300, height: 400, alignment: .center)
            
            HStack {
                Text("Tue, 12 June 2022")
                    .foregroundColor(Color("primaryGreen"))
                    .font(.system(size: 15))
                .padding()
                Spacer()
            }
            
            
            
            HStack {
                Text("Product name")
                    .fontWeight(.bold)
                    .padding()
              ///  .frame(width: 100, height: 50, alignment: .leading)
                Spacer()
            }
            List{
                Text("Cetaphil facial wash")
                Text("Cetaphil toner")
                Text("Cetaphil acne spot")
                Text("Cetaphil sunscreen")
            }
            Text(" Skin Condition rate")
            Text("Better 😁")

        }
    }
}

struct HistoryData {
    var product1: String
    var product2: String
    var product3: String
    var product4: String
}

var productData = [
HistoryData(product1: "Cetaphil facial wash", product2: "Cetaphil toner", product3: "Cetaphil acne spot", product4: "Cetaphil sunscreen"),

]
struct HistorySheet_Previews: PreviewProvider {
    static var previews: some View {
        HistorySheetView()
        
    }
}
