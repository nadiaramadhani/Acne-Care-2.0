////
////  Nadia2.swift
////  ACNIFY
////
////  Created by Rahmat Maftuh Ihsan on 27/06/22.
////
//

import SwiftUI


struct BookmarkItem: Identifiable {
    let id = UUID()
    let icon: String
    let desc: String
    var items: [BookmarkItem]?
    
}

//MARK: DRY SKIN
struct DrySkinView: View {
    
    let items: [BookmarkItem] = [.causesDry, .tipsDry]
    
    var body: some View {
        
        VStack{
            ZStack{
                
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 300, height: 380)
                    .foregroundColor(Color("gray"))
                    .shadow(color: .gray, radius: 5)
                    .overlay(RoundedRectangle (cornerRadius: 25)
                        .stroke(Color("cream"), lineWidth: 3)
                    )
                
                VStack{
                    
                    Text("Dry")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .padding(.top, 15)
                        .foregroundColor(Color("primaryGreen"))
                    
                    
                    Image("skintype2")
                        .padding()
                    Text("Feels tight, scaling and flaking, feels itchy")
                        .font(.system(size: 13))
                        .frame(width: 280 , height: 100, alignment: .center)
                    
                }
                
                
            }
            List(items, children: \.items) { row in
                
                Image(row.icon)
                //.padding
                Text(row.desc)
                    .font(.system(size: 12))
            }
        }
    }
}

//MARK: NORMAL SKIN
struct NormalSkinView: View {
    
    let items: [BookmarkItem] = [.tipsNormal]
    
    var body: some View {
        
        VStack{
            ZStack{
                
                
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 300, height: 380)
                    .foregroundColor(Color("gray"))
                    .shadow(color: .gray, radius: 5)
                    .overlay(RoundedRectangle (cornerRadius: 25)
                        .stroke(Color("cream"), lineWidth: 3)
                    )
                VStack{
                    
                    Text("Normal")
                        .font(.system(size: 17))
                        .fontWeight(.bold)
                        .padding(.top, 15)
                        .foregroundColor(Color("primaryGreen"))
                    
                    Image("skintype1")
                        .padding()
                    
                    Text("No severe sensitivity (no redness), barely visible pores, hydrated ")
                        .font(.system(size: 13))
                        .frame(width: 280 , height: 100, alignment: .center)
                    
                }
                
                
            }
            
            List(items, children: \.items) { row in
                
                Image(row.icon)
                //.padding
                Text(row.desc)
                    .font(.system(size: 12))
                
            }
        }
       
        
        
    }
}

//MARK: OILY SKIN

struct OilySkinView : View{
    
    let items: [BookmarkItem] = [.causesOily,.tipsOily]
    
    var body: some View {
        
        VStack{
            ZStack{
                
                
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 300, height: 380)
                    .foregroundColor(Color("gray"))
                    .shadow(color: .gray, radius: 5)
                    .overlay(RoundedRectangle (cornerRadius: 25)
                        .stroke(Color("cream"), lineWidth: 3)
                    )
                VStack{
                    
                    Text("Oily")
                        .font(.system(size: 17))
                        .fontWeight(.bold)
                        .padding(.top, 15)
                        .foregroundColor(Color("primaryGreen"))
                    
                    Image("skintype3")
                        .padding()
                    
                    Text("Large pores, shiny appearance over the face mostly in T-Zone area")
                        .font(.system(size: 13))
                        .frame(width: 280 , height: 100, alignment: .center)
                    
                }
                
                
            }
            
            List(items, children: \.items) { row in
                
                Image(row.icon)
                //.padding
                Text(row.desc)
                    .font(.system(size: 12))
                
            }
        }
      
    }
}

//MARK: COMBINATION SKIN
struct CombinationSkinView : View {
    
    let items: [BookmarkItem] = [.causesCombi, .tipsCombi]
    
    var body: some View {
        
        VStack{
            ZStack{
                
                
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 300, height: 380)
                    .foregroundColor(Color("gray"))
                    .shadow(color: .gray, radius: 5)
                    .overlay(RoundedRectangle (cornerRadius: 25)
                        .stroke(Color("cream"), lineWidth: 3)
                    )
                VStack{
                    
                    Text("Combination")
                        .font(.system(size: 17))
                        .fontWeight(.bold)
                        .padding(.top, 15)
                        .foregroundColor(Color("primaryGreen"))
                    
                    Image("skintype4")
                        .padding()
                    
                    Text("Shiny appearance in T-Zone (forehead, nose and chin) area, cheeks tend to be dry and tight")
                        .font(.system(size: 13))
                        .frame(width: 280 , height: 100, alignment: .center)
                    
                }
                
                
            }
            
            List(items, children: \.items) { row in
                
                Image(row.icon)
                //.padding
                Text(row.desc)
                    .font(.system(size: 12))
                
            }
        }
      
    }
}
//MARK: SENSITIVE SKIN
struct SensitiveSkinView : View {
    
    let items: [BookmarkItem] = [.causesSensi, .tipsSensi]
    
    var body: some View {
        
        VStack{
            ZStack{
                
                
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 300, height: 380)
                    .foregroundColor(Color("gray"))
                    .shadow(color: .gray, radius: 5)
                    .overlay(RoundedRectangle (cornerRadius: 25)
                        .stroke(Color("cream"), lineWidth: 3)
                    )
                VStack{
                    
                    Text("Sensitive")
                        .font(.system(size: 17))
                        .fontWeight(.bold)
                        .padding(.top, 15)
                        .foregroundColor(Color("primaryGreen"))
                    
                    Image("skintype5")
                        .padding()
                    
                    Text("Easily inflammed through specific trigger (redness, itching, burning, dryness)")
                        .font(.system(size: 13))
                        .frame(width: 280 , height: 100, alignment: .center)
                    
                }
                
                
            }
            
            List(items, children: \.items) { row in
                
                Image(row.icon)
                //.padding
                Text(row.desc)
                    .font(.system(size: 12))
                
            }
        }
       
    }
}

//MARK: PREVIEW

struct DrySkinView_Previews: PreviewProvider {
    static var previews: some View {
        CombinationSkinView()
    }
}

//MARK: EXTENSION
extension BookmarkItem {
    
    
    
    //MARK: DRY SKIN
    //CAUSES DRY:
    static let genetic = BookmarkItem(icon: "genetic", desc: "Genetics")
    static let aging = BookmarkItem(icon: "hand", desc: "Aging or hormonal changes")
    static let weather = BookmarkItem(icon: "cloud", desc: "Wheather such as wind, sun, or cold")
    static let sun = BookmarkItem(icon: "sun", desc: "Ultraviolet (UV) radiation")
    static let ingredients = BookmarkItem(icon: "facewash", desc: "Ingredients in certain products from soaps, cosmetics, or skincares")
    static let medication = BookmarkItem(icon: "medication", desc: "Medications")
    
    
    //TIPS DRY:
    static let shower = BookmarkItem(icon: "shower", desc: "Take shorter showers and baths")
    static let soap = BookmarkItem(icon: "serum", desc: "Use mild and gentle soaps or skincares")
    static let moist = BookmarkItem(icon: "facewash", desc: "Use moisturizer after bathing. Reapply as needed throughout the day.")
    static let humid = BookmarkItem(icon: "wind", desc: "Use a humidifier and don’t let indoor temperatures")
    
    //: ITEMS DRY:
    static let causesDry = BookmarkItem(icon: "", desc: "Causes", items: [BookmarkItem.genetic, BookmarkItem.aging, BookmarkItem.weather, BookmarkItem.sun, BookmarkItem.ingredients, BookmarkItem.medication])
    
    static let tipsDry = BookmarkItem(icon: "", desc: "Tips", items: [BookmarkItem.shower, BookmarkItem.soap, BookmarkItem.moist, BookmarkItem.humid])
    
    //MARK: NORMAL SKIN
    //CAUSES NORMAL:
    
    
    //TIPS NORMAL:
    static let sunscreen = BookmarkItem(icon: "facewash", desc: "Apply sunscreen before you go outdoors")
    static let water = BookmarkItem(icon: "face", desc: "Drink plenty of water and use gentle moisturizers, lotions or cream")
    static let scrub = BookmarkItem(icon: "cream", desc: "Resist the urge to scrub your skin clean. Scrubbing irritates the skin which can lead skin condition worsen")
    static let wash = BookmarkItem(icon: "soap", desc: "Gently wash face when waking, before bed and after sweating")
    static let cream = BookmarkItem(icon: "serum", desc: "Better to use cream or lotion cleansers for normal skin")
    static let sleep = BookmarkItem(icon: "sleep", desc: "Get enough sleep")
    
    
    //MARK NORMAL
    static let tipsNormal = BookmarkItem(icon: "", desc: "Tips", items: [BookmarkItem.sunscreen, BookmarkItem.water, BookmarkItem.scrub, BookmarkItem.wash, BookmarkItem.cream, BookmarkItem.sleep])
    
    
    
    //MARK: OILY SKIN
    
    //CAUSES OILY:
    static let humidity = BookmarkItem(icon: "cloud", desc: "Humidity")
    
    //TIPS OILY
    static let touch = BookmarkItem(icon: "hand", desc: "Do not touch your face throughout the day to avoid oil, dirt, bacteria from hands to your face")
    static let oilFree = BookmarkItem(icon: "serum", desc: "Choose oil-free, water-based makeup")
    static let makeup = BookmarkItem(icon: "makeup", desc: "Do not sleep in your makeup")
    
    //MARK: ITEM OILY
    static let causesOily = BookmarkItem(icon: "", desc: "Causes", items: [BookmarkItem.genetic, BookmarkItem.aging, BookmarkItem.humidity])
    static let tipsOily = BookmarkItem(icon: "", desc: "Tips", items: [BookmarkItem.sunscreen, BookmarkItem.touch, BookmarkItem.scrub, BookmarkItem.wash, BookmarkItem.oilFree, BookmarkItem.makeup])
    
    
        //MARK: COMBI SKIN
    //CAUSES Combi: GEN,
    static let environment = BookmarkItem(icon: "earth", desc: "Environment")
    
    //TIPS SENSISTIVE
    static let oilAbsorb = BookmarkItem(icon: "serum", desc: "Use oil-absorbing products or lighter-weight gels and liquids for T-Zone area")
    
    static let creamslotion = BookmarkItem(icon: "cream", desc: "Use creams and lotions for drier parts of the face (moisturizing)")
    
    static let fragrance = BookmarkItem(icon: "serum", desc: "Avoid products that incorporate excessive fragrance")
    
    static let clogPores = BookmarkItem(icon: "facewash", desc: "Avoid products that clog the pores as comedogenic cosmetics as cocoa butter, lanolin, coconut oil, and wheat germ oil")
    
    
    // ITEMS COMBI: 
    
    static let causesCombi = BookmarkItem(icon: "", desc: "Causes", items: [BookmarkItem.genetic, BookmarkItem.aging, BookmarkItem.environment])
    
    static let tipsCombi = BookmarkItem(icon: "", desc: "Tips", items: [BookmarkItem.sunscreen, BookmarkItem.oilAbsorb, BookmarkItem.creamslotion, BookmarkItem.wash, BookmarkItem.fragrance, BookmarkItem.clogPores])
    
    //MARK: SENSITIVE SKIN
    //CAUSES
    static let highSensi = BookmarkItem(icon: "genetic", desc: "High sensitivity: associated with strong psychological component, such as stress")
    static let environmentSensi = BookmarkItem(icon: "earth", desc: "Environmental sensitivity: primary environmental factors ")
    static let cosmeticSensi = BookmarkItem(icon: "brush", desc: "Cosmetic sensitivity: triggered by certain ingredients that reacts to the skin")
    
    //TIPS:
    static let oralMed = BookmarkItem(icon: "serum", desc: "Take oral medications as antihistamine to reduce and help with some allergic reactions")
    static let topical = BookmarkItem(icon: "cream", desc: "Take topical medications to relieve inflammation, as steroid creams* or analgesic creams* (*requires doctor prescription)")
    static let detergents = BookmarkItem(icon: "serum", desc: "Avoid harsh fragrance, detergents, or other chemicals")
    static let hypoallergenic = BookmarkItem(icon: "facewash", desc: "Using fragrance-free, hypoallergenic products")
    static let testing = BookmarkItem(icon: "soap", desc: "Testing new products on a small area of skin before applying them to more extensive areas")
    
    static let causesSensi = BookmarkItem(icon: "", desc: "", items: [BookmarkItem.highSensi, BookmarkItem.environmentSensi, BookmarkItem.cosmeticSensi])
    static let tipsSensi = BookmarkItem(icon: "", desc: "", items: [BookmarkItem.sunscreen, BookmarkItem.oralMed, BookmarkItem.topical, BookmarkItem.detergents, BookmarkItem.hypoallergenic, BookmarkItem.testing])

}
