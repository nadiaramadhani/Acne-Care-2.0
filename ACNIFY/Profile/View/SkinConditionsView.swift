//
//  SkinConditionsView.swift
//  ACNIFY
//
//  Created by Rahmat Maftuh Ihsan on 22/08/22.
//

import SwiftUI

struct SkintypeCauses: Identifiable {
    let id = UUID()
    let name: String
    let icon: String
    var items: [SkintypeCauses]?
    
}

struct SkinConditionsView: View {
    
    let items: [SkintypeCauses] = [.example1, .example2]
    var body: some View {
   //     NavigationView{
            VStack{
                //MARK: Skin Type Section
                HStack{
                    Text("Skin Type: Oily")
                        .font(.system(size: 17))
                        .fontWeight(.semibold)
                        .foregroundColor(Color("primaryGreen"))
                        .padding()
                    
                    Spacer()
                    
                }
                List(items, children: \.items) { row in
                    Image(systemName: row.icon)
                    Text(row.name)
         //           Spacer()
                }

                
                //MARK: Acne Severity Section
              //  Section{
                    Text("Acne Severity: Moderate")
                        .font(.system(size: 17))
                        .fontWeight(.semibold)
                        .foregroundColor(Color("primaryGreen"))
         //       }
                .padding(.trailing, 160)
                
                
                List(items, children: \.items){ row in
                    Image(systemName: row.icon)
                    Text(row.name)
                    Spacer()
                }
                
                Text("Source: dr. Nadia Agus Agung")
                    .font(.system(size:13))
                    .italic()
                    .foregroundColor(Color("primaryGreen"))

//                Button(action: {
//
//                }, label: {
//                    Text("Test Again")
//                        .foregroundColor(Color.white)
//                        .frame(width: 325, height: 50)
//                        .background(Color("yellow"))
//                        .cornerRadius(12)
//                })
                
                NavigationLink(destination: ProfileView(), label: {
                    Text("Test Again")
                        .foregroundColor(Color.white)
                        .frame(width: 325, height: 50)
                        .background(Color("yellow"))
                        .cornerRadius(12)
                })
                
                
                
            }
            .navigationBarHidden(true)
            
   //     }
        
        
    }
}

struct SkinConditionsView_Previews: PreviewProvider {
    static var previews: some View {
        SkinConditionsView()
    }
}
//
//extension SkintypeCauses{
//    //
//    static let oily9 = SkintypeCauses(name:"Skin Oily 1", icon:"Day")
//    static let dry9 = SkintypeCauses(name:"Skin Dry 1", icon: "Day")
//
//
//    //example groups
//    static let example1 = SkintypeCauses(name: "Favorites", icon:"dayAcneTreatment", items: [SkintypeCauses.oily9, SkintypeCauses.dry9])
//    static let example2 = SkintypeCauses(name: "Not  Favorites", icon:"dayAcneTreatment", items: [SkintypeCauses.oily9, SkintypeCauses.dry9])
//
//}

extension SkintypeCauses {
// some example websites
    static let apple = SkintypeCauses(name: "Apple", icon: "1.circle")
    static let bbc = SkintypeCauses(name: "BBC", icon:"square.and.pencil")
    static let swift = SkintypeCauses(name:"Swift", icon:"bolt.fill")
    static let twitter = SkintypeCauses(name:"Twitter", icon: "mic")
// some example groups
    static let example1 = SkintypeCauses(name:"Favorites", icon:"star", items: [SkintypeCauses.apple, SkintypeCauses.bbc, SkintypeCauses.swift, SkintypeCauses.twitter])
    static let example2 = SkintypeCauses (name:"Recent", icon: "timer", items:[SkintypeCauses.apple, SkintypeCauses.bbc, SkintypeCauses.swift, SkintypeCauses.twitter])
    static let example3 = SkintypeCauses(name: "Recommended", icon: "hand.thumbsup", items:[SkintypeCauses.apple, SkintypeCauses.bbc, SkintypeCauses.swift, SkintypeCauses.twitter])
    static let example4 = SkintypeCauses(name: "Bad", icon: "hand.thumbsup", items:[SkintypeCauses.apple, SkintypeCauses.bbc, SkintypeCauses.swift, SkintypeCauses.twitter])
}
