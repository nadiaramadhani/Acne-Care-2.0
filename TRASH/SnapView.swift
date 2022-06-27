////
////  SnapView.swift
////  ACNIFY
////
////  Created by Local Administrator on 24/06/22.
////
//
//import SwiftUI
//
//
//struct SnapView: View {
//    @State var currentIndex: Int = 0
//    @State var cards: [Card] = []
//    @State var currentTab = "SlideShow"
//    var data : Type
//    
//    @Namespace var animation
//    
//    //let cards = [
//    //Card(cardImage: "skintype1", cardTitle: "Dry", cardDesc: "Dyring"),
//    //Card(cardImage: "skintype2", cardTitle: "Oily", cardDesc: "Dyring"),
//    //Card(cardImage: "skintype3", cardTitle: "Oil", cardDesc: "Dyring"),
//    //Card(cardImage: "skintype4", cardTitle: "Sensi", cardDesc: "Dyring"),
//    //Card(cardImage: "skintype5", cardTitle: "Combi", cardDesc: "Dyring"),
//    //
//    //]
//    
//    var body: some View {
//        VStack{
//            
//            Spacer()
//            
//            VStack{
//                
//                Text("Skin Quiz")
//                    .font(.title)
//                    .fontWeight(.bold)
//                    .foregroundColor(Color("primaryGreen"))
//                
//                Text("Question 1 of 2")
//                    .font(.title2)
//                
//                SnapCarousel( index: $currentIndex, items: data) {
//                    i in
//                    GeometryReader{ proxy in
//                        //let size = proxy.size
//                        VStack{
//                            //
//                            //                        ForEach(0..<5) { value in
//                            //                            Text(cards[value].cardTitle)
//                            //
//                            //                        }
//                            Text("Dry")
//                                .foregroundColor(Color("primaryGreen"))
//                                .font(.title)
//                                .fontWeight(.bold)
//                                .padding()
//                            
//                            Spacer(minLength: 10)
//                            
//                            
//                            Image(data.image)
//                                .resizable()
//                                .aspectRatio(contentMode: .fill)
//                                .frame(width: 200, height: 200)
//                            
//                            
//                            Spacer(minLength: 10)
//                            
//                            Text("No severe sensitivity, barely visible pores, hydrated")
//                                .padding()
//                            
//                            
//                        }.frame(width: 300, height: 450)
//                            .background(Color("grayPalette"))
//                            .cornerRadius(12)
//                        
//                        
//                    }
//                }.padding(.vertical, 40)
//                HStack(spacing: 10){
//                    
//                    ForEach(cards.indices, id: \.self) { index in
//                        Circle()
//                            .fill(Color.black.opacity(currentIndex == index ? 1 : 0.1))
//                            .frame(width: 10, height: 10)
//                            .scaleEffect(currentIndex == index ? 1.4 : 1)
//                            .animation(.spring(), value: currentIndex == index)
//                    }
//                }
//                .padding(.bottom, 40)
//            }.frame(maxHeight: .infinity, alignment:  .top)
////                .onAppear{
////                    for index in 1...5 {
////                        cards.append(Card(cardImage: "skintype\(index)"))
////
////                    }
////                }
//            
//            
//        }.navigationBarTitle("Skin Quiz")
//            .navigationBarTitleDisplayMode(.large)
//        
//        
//    }
//    
//}
//struct SnapView_Previews: PreviewProvider {
//    static var previews: some View {
//        SnapView()
//    }
//}
//
