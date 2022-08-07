//
//  SkinTypeView.swift
//  ACNIFY
//
//  Created by Local Administrator on 25/06/22.
//
//
//  ContentView.swift
//  Carousel test
//
//  Created by Local Administrator on 24/06/22.
//

import SwiftUI

struct AcneTypeView1: View {
    var body: some View {
        AcneTypeView()
    }
}

struct AcneTypeView_Previews: PreviewProvider {
    static var previews: some View {
        AcneTypeView()
        
    }
}

struct AcneTypeView: View {
    
    @State var page = 0
    @State var skinResultView : Bool = false

    var body: some View {
        
        if skinResultView {
            SkinResultView()
        } else {
//            Color.white.edgesIgnoringSafeArea(.all)
            VStack{
              
                    VStack{
                        
                        Text("Acne Quiz")
                             .font(.title)
                             .fontWeight(.bold)
                             .foregroundColor(Color("primaryGreen"))
                             .padding(.top, 20)
                         
                         Text("Question 2 of 2")
                             .font(.system(size: 12))
//                             .padding(.top, 10)
                           
                         
                         Text("Pick one that represents your current acne condition")
                            .multilineTextAlignment(.center)
                             .font(.system(size: 18))
                             .padding(.vertical)
                        
                    }
                
                
                GeometryReader { g in
                    
                   AcneList()
                    
                }
                
                PageControl(page: self.$page)
                
                Button {
                 //
                    skinResultView = true
                    
                    
                    //print("tapped")
                } label: {
                    Text("Choose").foregroundColor(Color.white)
                        .frame(width: 150, height: 50, alignment: .center)
                }.background(Color("primaryGreen"))
                    .cornerRadius(10)

                    
                Spacer()
                
            }
        }
    }
}

struct AcneList: View {
    var body: some View {
        HStack(spacing: 10){
            ForEach(acneData){ i in
                QuizCardView(width: UIScreen.main.bounds.width, AcneData: i)
            }
        }
    }
}




struct AcneType : Identifiable {
    var id: Int
    var image : String
    var title: String
    var desc: String
    
}

var acneData = [

Type(id: 0, image: "Papules", title: "Papules", desc: "Small, inflamed lesions presenting as pink, tender"),
Type(id: 1, image: "Blackhead", title: "Blackhead", desc: "There is small black or yellowish bumps that develop on the skin"),
Type(id: 2, image: "Whitehead", title: "Whitehead", desc: "There is small lightning yellowish bumps that develop on the skin but firmer and will not be empty when squeezed"),
Type(id: 3, image: "Pustules", title: "Pustules", desc: "Small, inflamed, tender, usually red at the base, have a white tip in the centre, caused by a build-up of pustules"),
Type(id: 4, image: "Nodules", title: "Nodules", desc: "Relatively large, spherical, painful lesions located deeper in the skin surface"),
Type(id: 5, image: "Cysts", title: "Cysts", desc: "Easily inflammed through specific trigger (redness, itching, burning, dryness)")
]

