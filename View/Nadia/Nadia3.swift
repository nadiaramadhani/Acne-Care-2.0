//
//  Nadia3.swift
//  ACNIFY
//
//  Created by Rahmat Maftuh Ihsan on 27/06/22.
//
import SwiftUI


struct BookmarkAcne: Identifiable {
    let id = UUID()
    let icon: String
    let desc: String
    var items: [BookmarkAcne]?
    
}



struct PapulesView_Previews: PreviewProvider {
    static var previews: some View {
        CystsView()
    }
}


// MARK: PAPULES VIEW
struct PapulesView: View {
    
    let items: [BookmarkAcne] = [.tipsPapules, .toAvoidAcne, .ingredientsAcne]
    
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
                    
                    Text("Papules")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .padding(.top, 15)
                        .foregroundColor(Color("primaryGreen"))
                    
                    
                    Image("Papules")
                        .padding()
                    Text("Small, inflamed lesions presenting as pink, tender")
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
//MARK: BLACKHEAD VIEW
struct BlackheadView : View {
    
    let items: [BookmarkAcne] = [.tipsBlackhead, .toAvoidAcne, .ingredientsAcne]
    
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
                    
                    Text("Blackhead")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .padding(.top, 15)
                        .foregroundColor(Color("primaryGreen"))
                    
                    
                    Image("Blackhead")
                        .padding()
                    Text("There is small black or yellowish bumps that develop on the skin")
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

//MARK: WHITEHEAD VIEW
struct WhiteheadView: View {
    
    let items: [BookmarkAcne] = [.tipsWhitehead, .toAvoidAcne, .ingredientsAcne]
    
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
                    
                    Text("Whitehead")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .padding(.top, 15)
                        .foregroundColor(Color("primaryGreen"))
                    
                    
                    Image("Whitehead")
                        .padding()
                    Text("There is small lightning yellowish bumps that develop on the skin but firmer and will not be empty when squeezed")
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

//MARK: PUSTULES VIEW
struct PustulesView: View {
    
    let items: [BookmarkAcne] = [.tipsPustules, .toAvoidAcne, .ingredientsAcne]
    
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
                    
                    Text("Pustules")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .padding(.top, 15)
                        .foregroundColor(Color("primaryGreen"))
                    
                    
                    Image("Pustules")
                        .padding()
                    Text("Small, inflamed, tender, usually red at the base, have a white tip in the centre, caused by a build-up of pustule")
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


//MARK: NODULES VIEW
struct NodulesView : View {
    
    let items: [BookmarkAcne] = [.tipsNodules, .toAvoidAcne, .ingredientsAcne]
    
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
                    
                    Text("Nodules")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .padding(.top, 15)
                        .foregroundColor(Color("primaryGreen"))
                    
                    
                    Image("Nodules")
                        .padding()
                    Text("Relatively large, spherical, painful lesions located deeper in the skin surface")
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


//MARK: CYSTS VIEW

struct CystsView: View {
    
    let items: [BookmarkAcne] = [.tipsCysts, .toAvoidAcne, .ingredientsAcne]
    
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
                    
                    Text("Nodules")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .padding(.top, 15)
                        .foregroundColor(Color("primaryGreen"))
                    
                    
                    Image("Nodules")
                        .padding()
                    Text("Relatively large, spherical, painful lesions located deeper in the skin surface")
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
extension BookmarkAcne {
    
    
    
    //MARK: PAPULES
    //TIPS PAPULES
    static let irritation = BookmarkAcne(icon: "cute", desc: "Avoid irritation area")
    static let gentle = BookmarkAcne(icon: "hand2", desc: "Do not scrub the skin and be gentle when cleansing the face skin")
    static let water = BookmarkAcne(icon: "water", desc: "Use warm water while cleansing")
    static let sun = BookmarkAcne(icon: "sun", desc: "Ultraviolet (UV) radiation")
    static let infected = BookmarkAcne(icon: "brush2", desc: "Avoid using make up in the infected area (papules acne)")
    static let salicylic = BookmarkAcne(icon: "medication", desc: "Wash your face with a salicylic acid or benzoyl peroxide cleanser")
    static let warning = BookmarkAcne(icon: "warning", desc: "If you have any doubts or need further consultation, reach your doctor or dermatologist.")
    
    
    //MARK: BLACKHEAD
    //TIPS BLACKEAD:
    static let manual = BookmarkAcne(icon: "hand2", desc: "Manual extraction — but to do this you have to seek health professionals")
    static let retinol = BookmarkAcne(icon: "serum", desc: "Use retinol to increase skin cell turnover ")
    
    //MARK: WHITEHEAD
    static let oil = BookmarkAcne(icon: "serum", desc: " Use additional oil-free non-comedogenic products as aloevera, vitamin C and glycerin")
    
    
    //MARK: PUSTULES
    static let topical = BookmarkAcne(icon: "medication", desc: "Use oral or topical antibiotics can be used by dermatologist prescription, as clindamycin(topical) and mocycline(oral) for severe cases")
    static let benzoyl = BookmarkAcne(icon: "facewash", desc: "Use benzoyl peroxide or sulfur-based face wash to decrease inflammation")
    
    //MARK: NODULES
    static let antibiotic = BookmarkAcne(icon: "medication", desc: "Use oral antibiotics can be used according to dermatologist prescription, as mocycline(oral)")
    static let retinoid = BookmarkAcne(icon: "suntik", desc: "Use retinoids through oral or injections directly to the nodule. This way needs to be consulted with dermatology")
    //MARK: CYSTS
    static let surgical = BookmarkAcne(icon: "surgical", desc: "Surgical removal by health professional")
    static let aspirate = BookmarkAcne(icon: "water", desc: "Aspirate the cysts by health professional")
    static let stay = BookmarkAcne(icon: "stay", desc: "Stay out the sun and away from tanning bed")
    static let dont = BookmarkAcne(icon: "hand2", desc: "Do not scrub the skin or use irritating products")
    
    //MARK: THINGS TO AVOID
    static let scrubing = BookmarkAcne(icon: "cream", desc: "Do not use scrubbing material. It may cause acne sores to rupture")
    static let pop = BookmarkAcne(icon: "face", desc: "Do not pop the acne, specific for the cysts or nodules. It may take longer to heal and cause scarring")
    static let touch = BookmarkAcne(icon: "face", desc: "Do not pop the pimples located in “the triangle of death” — the area between eyebrows to corners of mouth. It is one place where you should never pop a pimple, as it can lead to an infection in your brain.")
    static let cover = BookmarkAcne(icon: "makeup2", desc: "Do not cover pimples with make up, such as eye concealer. It is good to avoid make up containing sillicone or mica")
    static let workout = BookmarkAcne(icon: "facewash", desc: "Do not forget to wash face post-workout. Not washing face immadiately after workout can lead to bacteria buildup")
    static let overwash = BookmarkAcne(icon: "face2", desc: "Do not over-washing face. Over washing can lead your skin getting drier and taking off the surface oil that may lead bacteria can get in  ")
    static let pilowcase = BookmarkAcne(icon: "pillow", desc: "Do not sleep on a dirty pillowcase. Keep the face hygiene. Routinely replace your pillowcase to decrease bacteria infection")
    static let washclothes = BookmarkAcne(icon: "handuk", desc: "Do not re-use washclothes. Never changing the washclothes can lead to breakouts. Keep your face hygiene")
    
    //MARK: INGREDIENTS TO AVOID
    static let heavy = BookmarkAcne(icon: "cocoa", desc: "Avoid heavy, greasy products as cocoa butter, mineral oil or cold cream")
    
    static let alcohol = BookmarkAcne(icon: "alcohol", desc: "    Alcohol should not be used in treating acnes for people with skin condition dry. It could to the loss of oil surface skin")
    static let sodium = BookmarkAcne(icon: "alcohol", desc: "Sodium Lauryl Sulfate can disturb the lipid or oil composition of the skin. Warned for the dry skin condition")
    static let lanolin = BookmarkAcne(icon: "alcohol", desc: "Lanolin is an occlusive agent and may lead to allergics")
    static let isopropil = BookmarkAcne(icon: "alcohol", desc: "Isopropyl myristate has comedogenicity power that leads the acne breakouts or getting severe")
    
    //MARK: ACNE
    static let toAvoidAcne = BookmarkAcne(icon: "", desc: "Things to avoid", items: [BookmarkAcne.scrubing, BookmarkAcne.pop, BookmarkAcne.touch, BookmarkAcne.cover, BookmarkAcne.workout, BookmarkAcne.overwash, BookmarkAcne.pilowcase, BookmarkAcne.washclothes])
    static let ingredientsAcne = BookmarkAcne(icon: "", desc: "Ingredients to avoid", items: [BookmarkAcne.heavy, BookmarkAcne.alcohol, BookmarkAcne.sodium, BookmarkAcne.lanolin, BookmarkAcne.isopropil])
    //MARK: TIPS
    static let tipsPapules = BookmarkAcne(icon: "", desc: "Tips", items: [BookmarkAcne.irritation, BookmarkAcne.gentle, BookmarkAcne.water, BookmarkAcne.infected, BookmarkAcne.warning])
    static let tipsBlackhead = BookmarkAcne(icon: "", desc: "Tips", items: [BookmarkAcne.manual, BookmarkAcne.retinol, BookmarkAcne.salicylic, BookmarkAcne.warning])
    static let tipsWhitehead = BookmarkAcne(icon: "", desc: "Tips", items: [BookmarkAcne.oil, BookmarkAcne.manual, BookmarkAcne.salicylic, BookmarkAcne.warning])
    static let tipsPustules = BookmarkAcne(icon: "", desc: "Tips", items: [BookmarkAcne.topical, BookmarkAcne.benzoyl, BookmarkAcne.warning])
    static let tipsNodules = BookmarkAcne(icon: "", desc: "Tips", items: [BookmarkAcne.antibiotic, BookmarkAcne.benzoyl, BookmarkAcne.retinoid, BookmarkAcne.warning])
    static let tipsCysts = BookmarkAcne(icon: "", desc: "Tips", items: [BookmarkAcne.irritation, BookmarkAcne.surgical, BookmarkAcne.aspirate, BookmarkAcne.stay, BookmarkAcne.dont, BookmarkAcne.warning])}

