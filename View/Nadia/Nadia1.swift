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
                    
                    AcneCarousel(width:
                             
                                UIScreen.main.bounds.width,
                             
                                
                             page: self.$page, height: g.frame(in: .global).height)
                    
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
    @Binding var page : Int
    var body: some View {
        HStack(spacing: 10){
            ForEach(acneData){ i in
                
                AcneCard(page: self.$page, width: UIScreen.main.bounds.width, AcneData: i)
                
            }
        }
    }
}

struct AcneCard: View {
    @Binding var page: Int
    var width : CGFloat
    var AcneData: Type
    var body: some View {
        VStack{
            
            VStack{
                
                Text(self.AcneData.title)
                    .foregroundColor(Color("primaryGreen"))
                    .font(.system(size: 16))
                    .fontWeight(.bold)
                    .padding(.bottom,20)
        
                Image(self.AcneData.image)
                    .resizable()
                    .frame(width: self.width - (220), height: 165)
                    
                
                Text(self.AcneData.desc)
                    .font(.system(size: 16))
                    .padding(.vertical)
                    .frame(width: 270, height: 120, alignment: .leading)
        
            }
            .padding(.horizontal, 15)
            .padding(.vertical, 25)
            .overlay(RoundedRectangle (cornerRadius: 25)
            .stroke(Color("cream"), lineWidth: 4)
            )
            .background(Color("gray"))
            .cornerRadius(25)
          
            Spacer(minLength: 0)
        }
    //    .frame(width: 300, height: 350)
        .frame(width: self.width, height: 500)
    }
}

struct AcneCarousel: UIViewRepresentable {
    func makeCoordinator() -> Coordinator {
        return AcneCarousel.Coordinator(parent1: self)
    }

    var width: CGFloat
    @Binding var page : Int
    var height: CGFloat
    
    func makeUIView(context: Context) -> some UIView {
        
        let total = width * CGFloat (acneData.count)
        let view = UIScrollView()
        view.isPagingEnabled = true
        view.contentSize = CGSize(width: total, height: 1.0)
        view.bounces = true
        view.showsVerticalScrollIndicator = false
        view.showsHorizontalScrollIndicator = false
        view.delegate = context.coordinator
        let view1 = UIHostingController(rootView: AcneList(page: self.$page))
        view1.view.frame = CGRect(x: 0, y: 0, width: total, height: self.height)
        view1.view.backgroundColor = .clear
    
        view.addSubview(view1.view)
        return view
        
        
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    class Coordinator: NSObject, UIScrollViewDelegate{
        var parent : AcneCarousel
        init(parent1: AcneCarousel) {
            parent = parent1
        }
        func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
            
            let page = Int(scrollView.contentOffset.x / UIScreen.main.bounds.width)
            
            self.parent.page = page
            
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

