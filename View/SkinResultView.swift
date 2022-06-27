//
//  SkinResultView.swift
//  ACNIFY
//
//  Created by Local Administrator on 25/06/22.
//

import SwiftUI

//
//enum Segmented {
//
//    case 0:
//    return SkinView()
//    case 1:
//    return AcneView()
//}
struct SkinResultView: View {
    @State private var selected = 1
    
    var body: some View {
        
        NavigationView{
           
            
            ScrollView {
                Picker("Skin", selection: $selected){
                    Text("Skin")
                        .tag(1)
                    Text("Acne")
                        .tag(2)
                }
                .pickerStyle(.segmented)
                .padding()
                
                if selected == 1 {
                    SkinView()
                } else if selected == 2 {
                    AcneView()
                }
                
                
               
            }
        }
     
        
    }
}

struct SkinView : View {
    
    
    
    var body: some View{
        
        ZStack{
            
            
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 320, height: 450)
                .foregroundColor(Color("gray"))
                .overlay(RoundedRectangle (cornerRadius: 25)
                .stroke(Color("cream"), lineWidth: 3)
                )
            VStack{
                
                Text("Dry")
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                
                Image("skintype1")
                    .padding()
                Text("Feels tight, scaling and flaking, feels itchy")
                    .frame(width: 310, height: 50, alignment: .center)
//
//                        Button(action: {
//                            print("tapped")
//
//                        }) {
//                            Text("Click for real image")
//                                .font(.system(size: 16))
//                                .padding(.top, 20)
//
//                        }
//

            }
            
            
        }

        HStack {
            Text("Characteristics")
                .font(.system(size: 16))
                .fontWeight(.bold)
                .frame(width: 350, alignment: .leading)
                .padding(.leading, 30)
               
            
       .padding()
            
        }
        
        Text("Dry skin condition characterized as people who have it shows almost invisible pores, dull, rough complexion, Red patches, Less elastic skin, More visible lines.")
            .padding(.horizontal)
            .frame(width: 350, alignment: .leading)
            .font(.system(size: 16))
            .padding(.vertical)
        
        Text("Your skin can crack, peel, or become itchy, irritated, or inflamed. If it’s very dry, it can become rough and scaly, especially on the backs of your hands, arms, and legs.")
            .padding(.horizontal)
            .font(.system(size: 16))
            .frame(width: 350,  alignment: .leading)

        
        .navigationBarTitle("Skin Result")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing:
                                    Button(action: {
                print("Done")
            }) {
                Text("Done")
                //.fontWeight(.bold)
                    .foregroundColor(Color("primaryGreen"))
            }
        )
    

    }
}


//MARK: ACNE VIEW

struct AcneView : View {
    
    
    
    var body: some View{
        
        ZStack{
            
            
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 320, height: 450)
                .foregroundColor(Color("gray"))
                .overlay(RoundedRectangle (cornerRadius: 25)
                .stroke(Color("cream"), lineWidth: 3)
//                .shadow(color: Color("gray").opacity(0.5), radius: 3)

                )
            VStack{
                
                Text("Blackhead")
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                
                Image("Blackhead")
                
                    .padding()
                Text("There is small black or yellowish bumps that develop on the skin")
                    .frame(width: 300, height: 50, alignment: .center)
//
//                        Button(action: {
//                            print("tapped")
//
//                        }) {
//                            Text("Click for real image")
//                                .font(.system(size: 16))
//                                .padding(.top, 20)
//
//                        }
//

            }
            
            
        }

        HStack {
            Text("Characteristics")
                .font(.system(size: 16))
                .fontWeight(.bold)
                .frame(width: 350, alignment: .leading)
                .padding(.leading, 30)
               
            
            .padding()
        }
        
        Text("""
        Blackheads characterized as small black or yellowish bumps that develop on the skin; they're not filled with dirt, but are black because the inner lining of the hair follicle produces colour
        
        Your skin can crack, peel, or become itchy, irritated, or inflamed. If it’s very dry, it can become rough and scaly, especially on the backs of your hands, arms, and legs.
        """)
            .padding(.horizontal)
            .frame(width: 350, alignment: .leading)
            .font(.system(size: 16))
        
     
        Text("Treatment Ingredients")
            .font(.system(size: 16))
            .fontWeight(.bold)
            .frame(width: 350, alignment: .leading)
            .padding(.leading, 30)
            .padding(.top, 10)
        
        Text("""
The best solution for blackheads is to wash your face with a beta hydroxy acid (BHA) such as salicylic acid, which deeply penetrates the pores and can unclog them, McMahan says.

OTC such as Retinol, which is a form of vitamin A that works by increasing skin cell turnover, breaking up the cells that form the clogs and reducing future clogged pores, says Crutchfield.
""")
            .padding(.horizontal)
            .padding(.vertical, 5)
            .font(.system(size: 16))
            .frame(width: 350, alignment: .leading)
        
        
        HStack{
            Image("warning")
            
            Text("Disclaimer: this is not a diagnosis. You might have certain conditions of your skin that is not stated here. Consult to doctor or dermatologists if you are concerned about your skin.")
        }
        .padding()
        .frame(width: 350)
        
        
        
           Text("Things to avoid")
               .font(.system(size: 16))
               .fontWeight(.bold)
               .frame(width: 350, alignment: .leading)
               .padding(.leading, 30)
               .padding(.top, 10)
           
           Text("""
   1. Terry cloth or other scrubbing material may cause acne sores to rupture.
   
   2. Popping cysts or nodules — it can cause inflammation, painful bumps lodged deep in the skin — can increase the amount of time they take to heal and could cause scarring.
   """)
               .padding(.horizontal)
               .padding(.vertical, 5)
               .font(.system(size: 16))
               .frame(width: 350, alignment: .leading)
           
        
           Text("Ingredients to avoid")
               .font(.system(size: 16))
               .fontWeight(.bold)
               .frame(width: 350, alignment: .leading)
               .padding(.leading, 30)
               .padding(.top, 10)
           
           Text("""
   1. Greasy products that contain pimple-producing ingredients such as cocoa butter, mineral oil, or cold cream.

   2. Synthetic Perfumes — this can cause inflammation and irritation.
   
   3. Alkohol — can cause irritation to the skin.
   
   4. SLS (Sodium Lauryl Sulfate) — it can loss the face oil emulation in face skin.
   
   5. Lanolin — it can cause the pore plogged and inflammed.
   
   6. Isopropyl Mysristate —  rease the amount of time they take to heal and could cause scarring.
   """)
               .padding(.horizontal)
               .padding(.vertical, 5)
               .font(.system(size: 16))
               .frame(width: 350, alignment: .leading)
           
        
        
        .navigationBarTitle("Skin Result")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing:
                                    Button(action: {
                print("Done")
            }) {
                Text("Done")
            }
        )
    }
}


//MARK: DUMMY DATA

struct SkinTypeText: Identifiable {
    var id: Int
    
    var title : String
    var description: String
    var image: String
    var longDesc: String
    
}

var SkinTypeData = [
    SkinTypeText(id: 0 , title: "Normal", description: "", image: "skintype1",
                 longDesc: ""),
    SkinTypeText(id: 1, title: "Dry", description: "Feels tight, scaling and flaking, feels itchy", image: "skintype2",
                 longDesc: "Dry skin condition characterized as people who have it shows almost invisible pores, dull, rough complexion, Red patches, Less elastic skin, More visible lines."),
    SkinTypeText(id: 2, title: "Oily", description: "", image: "skintype3", longDesc: ""),
    SkinTypeText(id: 3, title: "Combination", description: "", image: "skintype4", longDesc: ""),
    SkinTypeText(id: 4, title: "Sensitive", description: "", image: "skintype5", longDesc: ""),

]

struct SkinResultView_Previews: PreviewProvider {
    static var previews: some View {
        SkinResultView()
    }
}
