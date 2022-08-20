//
//  AcneQuizItem.swift
//  ACNIFY
//
//  Created by Local Administrator on 20/08/22.
//

import SwiftUI

struct AcneQuizItemView: View {
    var acneData: AcneQuizItemView.AcneLocation?
    var body: some View {
        ScrollView{
            VStack{
                Text(acneData?.location ?? "Forehead")
                    .font(.system(size: 17))
                    .fontWeight(.semibold)
                    .foregroundColor(Color("primaryGreen"))
                    .padding(.top, 36)
                Text("What type of acne that exist or most dominant in this area?")
                    .font(.system(size: 20))
                    .fontWeight(.semibold)
                    .foregroundColor(Color("quizFont"))
                    .frame(width: 300, height: 48)
                    .padding(.bottom)
                
                HStack{
                    VStack{
                        Image("whitehead")
                        Text("Whitehead")
                            .fontWeight(.semibold)

                    }
                    VStack{
                        Image("blackhead")
                        Text("Blackhead")
                            .fontWeight(.semibold)

                    }
                }
                .font(.system(size: 15))
                HStack{
                    VStack{
                        Image("papules")
                        Text("Papule")
                            .fontWeight(.semibold)

                    }
                    VStack{
                        Image("pustules")
                        Text("Pustule")
                            .fontWeight(.semibold)

                    }
                }
                .font(.system(size: 15))

                HStack{
                    VStack{
                        Image("nodules")
                        Text("Nodule")
                            .fontWeight(.semibold)

                    }
                    VStack{
                        Image("cysts")
                        Text("Cyst")
                            .fontWeight(.semibold)

                    }
                }
                .font(.system(size: 15))

                HStack{
                    VStack{
                        Image("none")
                        Text("None")
                            .fontWeight(.semibold)

                    }
                    .padding(.trailing, 140)
                }
                .font(.system(size: 15))

            }
        }
    }
}

extension AcneQuizItemView {
    struct AcneLocation: Identifiable{
        var id = UUID()
        var location: String = ""
    }
    
    static func getAcneLocation() -> [AcneQuizItemView.AcneLocation] {
        let loc1 = AcneLocation( location: "Forehead")
        let loc2 = AcneLocation(location: "Right cheek")
        let loc3 = AcneLocation( location: "Left cheek")
        let loc4 = AcneLocation(location: "Nose")
        let loc5 = AcneLocation(location: "Chin")
        
        
        return [loc1, loc2, loc3, loc4, loc5]
    
    }
    
    
}

struct AcneQuizItem_Previews: PreviewProvider {
    static var previews: some View {
        AcneQuizItemView()
    }
}
