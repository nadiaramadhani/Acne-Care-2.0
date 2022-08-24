//
//  AcneQuizItem.swift
//  ACNIFY
//
//  Created by Local Administrator on 20/08/22.
//

import SwiftUI

struct AcneQuizItemView: View {
    var acneData: AcneQuizItemView.AcneLocation?
    @State var selectedIndex:Int = 0
    @Binding var selectedAcne: [String:NewQuizViewModel.AcneType]
    
    var body: some View {
        ScrollView{
            HStack{
                Spacer()
                VStack{
//                Text(acneData?.location ?? "Forehead")
//                    .font(.system(size: 17))
//                    .fontWeight(.semibold)
//                    .foregroundColor(Color("primaryGreen"))
//                    .padding(.top, 36)
//                    Text("What is the most dominant pimple on your \(acneData?.location ?? "forehead")?")
//
//
                    Text("What is the most dominant acne on your \(Text(acneData?.location ?? "forehead").foregroundColor(Color("primaryGreen")).italic()) ?")
                    
                    .font(.system(size: 20))
                    .fontWeight(.semibold)
                    .foregroundColor(Color("quizFont"))
                    .frame(width: 300, height: 48)
                    .padding(.bottom)
                    .multilineTextAlignment(.center)
                
                HStack{
                    VStack{
                        Image("whitehead")
                            .overlay(RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.orange, lineWidth: 4)
                                .opacity(0 == selectedIndex ? 1 : 0))
                            .onTapGesture {
                                selectedIndex = 0
                                selectedAcne[acneData?.location ?? "Forehead"] = .Comedones
                            }
                        Text("Whitehead")
                            .fontWeight(.semibold)

                    }
                    VStack{
                        Image("blackhead")
                            .overlay(RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.orange, lineWidth: 4)
                                .opacity(1 == selectedIndex ? 1 : 0))
                            .onTapGesture {
                                selectedIndex = 1
                                selectedAcne[acneData?.location ?? "Forehead"] = .Comedones
                            }
                        Text("Blackhead")
                            .fontWeight(.semibold)

                    }
                }
                .font(.system(size: 15))
                HStack{
                    VStack{
                        Image("papule")
                            .overlay(RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.orange, lineWidth: 4)
                                .opacity(2 == selectedIndex ? 1 : 0))
                            .onTapGesture {
                                selectedIndex = 2
                                selectedAcne[acneData?.location ?? "Forehead"] = .Papule
                            }
                        Text("Papule")
                            .fontWeight(.semibold)

                    }
                    VStack{
                        Image("pustule")
                            .overlay(RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.orange, lineWidth: 4)
                                .opacity(3 == selectedIndex ? 1 : 0))
                            .onTapGesture {
                                selectedIndex = 3
                                selectedAcne[acneData?.location ?? "Forehead"] = .Pustule
                            }
                        Text("Pustule")
                            .fontWeight(.semibold)

                    }
                }
                .font(.system(size: 15))

                HStack{
                    VStack{
                        Image("nodules")
                            .overlay(RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.orange, lineWidth: 4)
                                .opacity(4 == selectedIndex ? 1 : 0))
                            .onTapGesture {
                                selectedIndex = 4
                                selectedAcne[acneData?.location ?? "Forehead"] = .Nodule
                            }
                        Text("Nodule")
                            .fontWeight(.semibold)

                    }
                    VStack{
                        Image("cyst")
                            .overlay(RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.orange, lineWidth: 4)
                                .opacity(5 == selectedIndex ? 1 : 0))
                            .onTapGesture {
                                selectedIndex = 5
                                selectedAcne[acneData?.location ?? "Forehead"] = .Nodule
                            }
                        Text("Cyst")
                            .fontWeight(.semibold)

                    }
                }
                .font(.system(size: 15))

                HStack{
                    VStack{
                        Image("none")
                            .overlay(RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.orange, lineWidth: 4)
                                .opacity(6 == selectedIndex ? 1 : 0))
                            .onTapGesture {
                                selectedIndex = 6
                                selectedAcne[acneData?.location ?? "Forehead"] = .NoLesion
                            }
                        Text("None")
                            .fontWeight(.semibold)

                    }
                    .padding(.trailing, 140)
                }
                .font(.system(size: 15))

            }
                Spacer()
            }
        }.onAppear{
            selectedAcne[acneData?.location ?? "Forehead"] = .Comedones
        }
    }
}

extension AcneQuizItemView {
    struct AcneLocation: Identifiable{
        var id = UUID()
        var location: String = ""
    }
    
    static func getAcneLocation() -> [AcneQuizItemView.AcneLocation] {
        let loc1 = AcneLocation( location: NewQuizViewModel.Forehead)
        let loc2 = AcneLocation(location: NewQuizViewModel.RightCheek)
        let loc3 = AcneLocation( location: NewQuizViewModel.LeftCheek)
        let loc4 = AcneLocation(location: NewQuizViewModel.Nose)
        let loc5 = AcneLocation(location: NewQuizViewModel.Chin)
        
        
        return [loc1, loc2, loc3, loc4, loc5]
    
    }
    
    
}

struct AcneQuizItem_Previews: PreviewProvider {
    static var previews: some View {
        AcneQuizItemView(selectedAcne: .constant([String:NewQuizViewModel.AcneType]()))
    }
}
