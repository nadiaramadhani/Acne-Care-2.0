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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SkinType()
        
    }
}

//MARK: DATA
struct Type : Identifiable {
    var id: Int
    var image : String
    var title: String
    var desc: String
    
}

let data = [
    
    Type(id: 0, image: "skintype1", title: "Normal", desc: "No severe sensitivity, barely visible pores, hydrated"),
    Type(id: 1, image: "skintype2", title: "Dry", desc: "Feels tight, scaling and flaking, feels itchy"),
    Type(id: 2, image: "skintype3", title: "Oily", desc: "Large pores, shiny appearance over the face mostly in T-Zone area"),
    Type(id: 3, image: "skintype4", title: "Combination", desc: "Shiny appearance in T-Zone (forehead, nose and chin) area, cheeks tend to be dry and tight"),
    Type(id: 5, image: "skintype5", title: "Sensitive", desc: "Easily inflammed through specific trigger (redness, itching, burning, dryness)"),
    
]


//MARK: SKIN TYPE VIEW
struct SkinType: View {
    //   var data: Type
    @Environment (\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var skins: FetchedResults<SkinEntity>
    @State var acneTypeView : Bool = false
    
    
    
    @State var page = 0
    var body: some View {
        if acneTypeView {
            AcneTypeView1()
        } else {
            
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
            
            
            GeometryReader { g in
                
                Carousel(width:
                            
                            UIScreen.main.bounds.width,
                         
                         
                         page: self.$page, height: g.frame(in: .global).height)
                
            }
            
            PageControl(page: self.$page)
            
//            TabView {
//                        Text("First")
//                        Text("Second")
//                        Text("Third")
//                        Text("Fourth")
//                    }
//                    .tabViewStyle(.page)
//                    .indexViewStyle(.page(backgroundDisplayMode: .always))
                
            Button {
                
                addSkin()
                acneTypeView = true
                
                
            } label: {
                Text("Choose").foregroundColor(Color.white)
                    .frame(width: 150, height: 50, alignment: .center)
            }.background(Color("primaryGreen"))
                .cornerRadius(10)
            
        }
    }
        
    }
    //MARK: COREDATA
    //want to save selected skin value to coredata
    func addSkin () {
        let newSkin = SkinEntity(context: moc)
        newSkin.skinTitle = String(page)
//        newSkin.skinImage = self.data.image
//        newSkin.skinDesc = self.data.desc
//
//
        
        try? moc.save()
        
        
    }
}


//MARK: CARDLIST
struct CardList: View {
    
    @Binding var page : Int
    
    
    
    var body: some View {
        HStack(spacing: 10){
            ForEach(data) { i in
                
                Card(page: self.$page, width: UIScreen.main.bounds.width, data: i)
                
            }
        }
    }
}


//MARK: CARD

struct Card: View {
    
    
    
    @Binding var page: Int
    var width : CGFloat
    var data: Type
    var body: some View {
        VStack{
            
            VStack{
                
                Text(self.data.title)
                    .foregroundColor(Color("primaryGreen"))
                    .font(.system(size: 17))
                    .fontWeight(.bold)
                    .padding(.bottom,20)
                
                Image(self.data.image)
                    .resizable()
                    .frame(width: self.width - (170), height: 230)
                
                Text(self.data.desc)
                    .font(.system(size: 16))
                    .padding(.vertical)
                    .frame(width: 300, height: 100, alignment: .leading)
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
        .frame(width: self.width)
    }
    
}


//MARK: CAROUSEL
struct Carousel: UIViewRepresentable {
    func makeCoordinator() -> Coordinator {
        return Carousel.Coordinator(parent1: self)
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
        var parent : Carousel
        init(parent1: Carousel) {
            parent = parent1
        }
        func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
            
            let page = Int(scrollView.contentOffset.x / UIScreen.main.bounds.width)
            
            self.parent.page = page
            
        }
    }
}




//MARK: PAGE CONTROL
struct PageControl : UIViewRepresentable {
    @Binding var page : Int
    
    func makeUIView(context: Context) -> UIPageControl {
        
        let view = UIPageControl()
        view.currentPageIndicatorTintColor = .black
        view.pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
        view.numberOfPages = data.count
        return view
        
    }
    func updateUIView(_ uiView: UIPageControl, context: Context) {
        
        DispatchQueue.main.async {
            uiView.currentPage = self.page
            
        }
    }
}


