//
//  SkinTypeView.swift
//  ACNIFY
//
//  Created by Local Administrator on 23/8/22.
//

import SwiftUI


struct DrySkinView: View {
    
    let items: [BookmarkItem] = [.causesDry, .tipsDry]
    let acneItem: [BookmarkItem] = [.causesSensi, .tipsSensi]
    var acne: String = "Mild"
    var skin: String = "Dry"
    var body: some View {
        VStack{
        
        Section {
            
                 Text("Skin type: \(skin)")
                     .foregroundColor(Color("primaryGreen"))
                     .bold()
                     .padding(.trailing, 210)
             
        }
            List(items, children: \.items) { row in
               
                Image(row.icon)
                //.padding
                Text(row.desc)
                    .font(.system(size: 12))
            }
            
            Section{
                Text("Acne type: \(acne)")
                    .foregroundColor(Color("primaryGreen"))
                    .bold()
                    .padding(.trailing, 210)
            }
            
            List(acneItem, children: \.items) { row in

                Image(row.icon)
                //.padding
                Text(row.desc)
                    .font(.system(size: 12))
                
            }
            
            
        }
        
    }
}

