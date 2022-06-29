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
    var body: some View {
//            Color.white.edgesIgnoringSafeArea(.all)
            VStack{
              
                    VStack{
                        
                        Text("Skin Quiz")
                             .font(.title)
                             .fontWeight(.bold)
                             .foregroundColor(Color("primaryGreen"))
                             .padding(.top, 20)
                         
                         Text("Question 1 of 2")
                             .font(.system(size: 12))
//                             .padding(.top, 10)
                           
                         
                         Text("Pick one that represents your current skin condition")
                            .multilineTextAlignment(.center)
                             .font(.system(size: 18))
                             .padding(.vertical)
                        
                    }
                
                
                GeometryReader {g in
                    
                    Carousel(width:
                             
                                UIScreen.main.bounds.width,
                             
                                
                             page: self.$page, height: g.frame(in: .global).height)
                    
                }
                
                PageControl(page: self.$page)
                Button {
                    print("tapped")
                } label: {
                    Text("Choose").foregroundColor(Color.white)
                        .frame(width: 150, height: 50, alignment: .center)
                }.background(Color("primaryGreen"))
                    .cornerRadius(10)

                    
                Spacer()
                
            }
//            .padding(.vertical)
        
    }
}

struct AcneList: View {
    @Binding var page : Int
    var body: some View {
        HStack(spacing: 10){
            ForEach(data){ i in
                
                Card(page: self.$page, width: UIScreen.main.bounds.width, data: i)
                
            }
        }
    }
}

struct AcneCard: View {
    @Binding var page: Int
    var width : CGFloat
   
    var data: Type
    var body: some View {
        VStack{
            
            VStack{
                
                Text(self.data.title)
                    .foregroundColor(Color("primaryGreen"))
                    .font(.system(size: 16))
                    .fontWeight(.bold)
                    .padding(.bottom,20)
        
                Image(self.data.image)
                    .resizable()
                    .frame(width: self.width - (150), height: 230)
                    
                
                Text(self.data.desc)
                    .font(.system(size: 16))
                    .padding(.vertical)
                    .frame(width: 270, alignment: .leading)
//                Button(action: {
//
//                }) {
//                    Text("Real image")
//                        .font(.system(size: 14))
//                }
                
        
            }
            .padding(.horizontal, 15)
            .padding(.vertical, 25)
            .overlay(RoundedRectangle (cornerRadius: 25)
            .stroke(Color("cream"), lineWidth: 4)
            )
            .background(Color("gray"))
            .cornerRadius(25)
            //.padding(.vertical, self.page == data.id ? 0 : 25)
            
            
           // .padding(.top, 25)
            Spacer(minLength: 0)
        }
    //    .frame(width: 300, height: 350)
        .frame(width: self.width)
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
        
        let total = width * CGFloat (data.count)
        let view = UIScrollView()
        view.isPagingEnabled = true
        view.contentSize = CGSize(width: total, height: 1.0)
        view.bounces = true
        view.showsVerticalScrollIndicator = false
        view.showsHorizontalScrollIndicator = false
        view.delegate = context.coordinator
        let view1 = UIHostingController(rootView: CardList(page: self.$page))
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
//struct PageControl : UIViewRepresentable {
//    @Binding var page : Int
//
//    func makeUIView(context: Context) -> UIPageControl {
//
//        let view = UIPageControl()
//        view.currentPageIndicatorTintColor = .black
//        view.pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
//        view.numberOfPages = data.count
//        return view
//
//    }
//    func updateUIView(_ uiView: UIPageControl, context: Context) {
//
//        DispatchQueue.main.async {
//            uiView.currentPage = self.page
//
//        }
//    }
//}

//struct pageControl: View {
//    @Binding var selectedPage: Int
//    var pages: Int
//    var circleDiameter: CGFloat
//    var circleMargin: CGFloat
//
//    private var circleRadius: CGFloat { circleDiameter / 2}
//    private var pageIndex: CGFloat { CGFloat(selectedPage - 1) }
//
//        private var currentPosition: CGFloat {
//            // Get the first circle position
//            let stackWidth = circleDiameter * CGFloat(pages) + circleMargin * CGFloat(pages - 1)
//            let halfStackWidth = stackWidth / 2
//            let iniPosition = -halfStackWidth + circleRadius
//
//            // Calculate the distance to get the next circle
//            let distanceToNextPoint = circleDiameter + circleMargin
//
//            // Use the pageIndex to get the current position
//            return iniPosition + (pageIndex * distanceToNextPoint)
//
//        }
//
//
//    var body: some View {
//
//        ZStack{
//            HStack{
//                ForEach(0..<pages) {_ in
//                    Circle()
//                        .stroke(Color.black, style: StrokeStyle(lineWidth: 2, lineCap: .round))
//                        .frame(width:  circleDiameter, height: circleDiameter)
//                }
//            }
//            Circle()
//                .foregroundColor(.black)
//                .frame(width: circleDiameter, height: circleDiameter)
//
//        }
//
//    }
//}

struct AcneType : Identifiable {
    var id: Int
    var image : String
    var title: String
    var desc: String
    
}

var AcneData = [

AcneType(id: 0, image: "skintype1", title: "Normal", desc: "No severe sensitivity, barely visible pores, hydrated"),
AcneType(id: 1, image: "skintype2", title: "Dry", desc: "Large pores, shiny appearance over the face mostly in T-Zone area"),
AcneType(id: 2, image: "skintype3", title: "Sensitive", desc: "No severe sensitivity, barely visible pores, hydrated"),
AcneType(id: 3, image: "skintype4", title: "Normal", desc: "No severe sensitivity, barely visible pores, hydrated"),
AcneType(id: 5, image: "skintype5", title: "Combination", desc: "No severe sensitivity, barely visible pores, hydrated"),

]

