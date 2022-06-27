////
////  CardModel.swift
////  ACNIFY
////
////  Created by Local Administrator on 23/06/22.
////
//
//import SwiftUI
//
//struct CardComponents {
//    var id: Int
//    let cardImage: String
//    let cardTitle: String
//    let cardDescription: String
//    
//}
//
//struct CardElement: View {
//
//    let cards : [CardComponents] = [
//        CardComponents(id:0, cardImage: "skintype1", cardTitle: "This is dry skin", cardDescription: "You should moisturize more"),
//        CardComponents(id: 1, cardImage: "skintype2", cardTitle: "This is oily skin", cardDescription: "You should oil more"),
//        CardComponents(id: 2, cardImage: "skintype3", cardTitle: "This is normal skin", cardDescription: "You should normal more"),
//        CardComponents(id: 3, cardImage: "skintype4", cardTitle: "This is combination skin", cardDescription: "You should combine more"),
//    ]
//    
//    
//    var body: some View{
//    
//        NavigationView {
//            
//            ScrollView {
//                HStack{
//                    ForEach(cards.identified(by: \(cardImage))) { card in
//                        CardView(cardCo: card)
//                        
//                        
//                    }
//                }
//            }
////            ScrollView {
////                HStack{
////                    ForEach(cards._identified(by: \.id)) { image in
////                        CardView(cardCo: cards)
////                    }
////
////
////                    }
////
////            }.padding(20)
////
//            
//        }.navigationBarTitle(Text("Skin Type"))
//        
//        
//    
//    }
//}
//
//struct CardView: View {
//    
//   let cardCo : CardComponents
//
//    var body: some View {
//        VStack {
//            Image("skintype1")
//            Text("Good")
//        }
////            VStack{
////                Image("skintype1")
////
////              //  Image(cardCo.cardImage)
////                    .frame(width: 300, height: 400)
////                    .background(.blue)
////                    .cornerRadius(20)
////                .shadow(color: .cyan, radius: 20)
////
////
////
////                //Text(cardCo.cardTitle)
////                Text("Kulit kering")
////                        .font(.headline)
////                        .fontWeight(.bold)
////
//                }
//            }
//
//
//
//
//
//
//
//struct cardViewHead_Previews: PreviewProvider {
//    static var previews: some View {
//        CardElement()
//    }
//}
